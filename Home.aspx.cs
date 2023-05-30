using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            BindLaptops();

            CheckLoginStatus();
        }
    }

    protected void BindLaptops()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT ID, Name, Price FROM Pc";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                GridViewLaptops.DataSource = dataTable;
                GridViewLaptops.DataBind();
            }
        }
    }

    protected void CheckLoginStatus()
    {
        if (HttpContext.Current.Session["uname"] != null)
        {
            // User is logged in
            loginPlaceHolder.Visible = false;
            logoutPlaceHolder.Visible = true;
        }
        else
        {
            
            loginPlaceHolder.Visible = true;
            logoutPlaceHolder.Visible = false;
        }
    }

    protected void BtnAddToCart_Click(object sender, EventArgs e)
    {

        Button btnAddToCart = (Button)sender;
        string laptopId = btnAddToCart.CommandArgument;

        AddToCart(laptopId);

        Response.Redirect("~/ShoppingCart.aspx");
    }

    protected void AddToCart(string laptopId)
    {

        var cartItems = (Session["CartItems"] as System.Collections.Generic.List<string>) ?? new System.Collections.Generic.List<string>();
        cartItems.Add(laptopId);
        Session["CartItems"] = cartItems;
    }
}
