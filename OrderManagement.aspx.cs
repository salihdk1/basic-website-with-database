using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


public partial class OrderManagement : System.Web.UI.Page
{
    protected string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrders();
        }
    }

    protected void BindOrders()
    {
        string query = "SELECT OrderId, CustomerName, OrderDate, TotalAmount, OrderStatus FROM Orders";
        using (SqlConnection conn = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                gvOrders.DataSource = reader;
                gvOrders.DataBind();
            }
            else
            {
                // No orders found
                gvOrders.DataSource = null;
                gvOrders.DataBind();
            }
            reader.Close();
        }
    }

    protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "CancelOrder")
        {
            int orderID = Convert.ToInt32(e.CommandArgument);
            CancelOrder(orderID);
        }
    }

    protected void CancelOrder(int orderID)
    {
        string query = "UPDATE Orders SET OrderStatus = @OrderStatus WHERE OrderId = @OrderId";
        using (SqlConnection conn = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@OrderStatus", "Cancelled");
            cmd.Parameters.AddWithValue("@OrderId", orderID);
            conn.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                // Order cancelled successfully
                BindOrders();
            }
            else
            {
                // Failed to cancel order
            }
        }
    }
}

