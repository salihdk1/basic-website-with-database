using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;


public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<CartItem> cartItems = GetCartItems(); 
            GridViewCart.DataSource = cartItems;
            GridViewCart.DataBind();

            decimal total = CalculateTotal(cartItems); 
            LblTotal.Text = total.ToString("C");
        }
    }

    protected void BtnRemove_Click(object sender, EventArgs e)
    {
        Button btnRemove = (Button)sender;
        int laptopId = Convert.ToInt32(btnRemove.CommandArgument);

        RemoveFromCart(laptopId); 

        List<CartItem> cartItems = GetCartItems(); 
        GridViewCart.DataSource = cartItems;
        GridViewCart.DataBind();
        decimal total = CalculateTotal(cartItems); 
        LblTotal.Text = total.ToString("C");
    }

    protected void BtnCheckout_Click(object sender, EventArgs e)
    {
        ClearCart(); 

        Response.Redirect("~/Home.aspx");
    }

    private List<CartItem> GetCartItems()
    {
        List<CartItem> cartItems = new List<CartItem>();

        if (Session["CartItems"] != null)
        {
            cartItems = (List<CartItem>)Session["CartItems"];
        }

        return cartItems;
    }

    private void RemoveFromCart(int laptopId)
    {
        List<CartItem> cartItems = GetCartItems();

        CartItem itemToRemove = cartItems.Find(item => item.LaptopID == laptopId);

        if (itemToRemove != null)
        {
            cartItems.Remove(itemToRemove);

            Session["CartItems"] = cartItems;
        }
    }

    private void ClearCart()
    {
        Session["CartItems"] = null;
    }

    private decimal CalculateTotal(List<CartItem> cartItems)
    {
        decimal total = 0;

        foreach (CartItem item in cartItems)
        {
            total += item.Price;
        }

        return total;
    }
}

public class CartItem
{
    public int LaptopID { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
}
