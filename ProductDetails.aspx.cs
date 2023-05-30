using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                int laptopId;
                if (int.TryParse(Request.QueryString["ID"], out laptopId))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT Name, Price, Description FROM Pc WHERE ID = @LaptopId";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@LaptopId", laptopId);
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            LblName.Text = reader.GetString(0);
                            LblPrice.Text = reader.GetDecimal(1).ToString("C");
                            LblDescription.Text = reader.GetString(2);
                        }
                        reader.Close();
                    }
                }
                else
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }

    protected void BtnAddToCart_Click(object sender, EventArgs e)
    {
        Button btnAddToCart = (Button)sender;
        int laptopId;
        if (int.TryParse(btnAddToCart.CommandArgument, out laptopId))
        {
            int userId = Convert.ToInt32(Session["id"]);

            string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string laptopQuery = "SELECT ID, Name, Price FROM Pc WHERE ID = @LaptopID";
                SqlCommand laptopCommand = new SqlCommand(laptopQuery, connection);
                laptopCommand.Parameters.AddWithValue("@LaptopID", laptopId);
                connection.Open();
                SqlDataReader reader = laptopCommand.ExecuteReader();

                if (reader.Read())
                {
                    int selectedLaptopId = reader.GetInt32(0);
                    string selectedLaptopName = reader.GetString(1);
                    decimal selectedLaptopPrice = reader.GetDecimal(2);

                    string cartItemQuery = "INSERT INTO CartItem (LaptopID, Name, Price) " +
                        "VALUES (@LaptopID, @LaptopName, @LaptopPrice)";
                    SqlCommand cartItemCommand = new SqlCommand(cartItemQuery, connection);
                    cartItemCommand.Parameters.AddWithValue("@LaptopID", selectedLaptopId);
                    cartItemCommand.Parameters.AddWithValue("@LaptopName", selectedLaptopName);
                    cartItemCommand.Parameters.AddWithValue("@LaptopPrice", selectedLaptopPrice);
                    cartItemCommand.ExecuteNonQuery();

                    string message = "Laptop added to cart: " + selectedLaptopName + " (LaptopID: " + selectedLaptopId + "), Price: $" + selectedLaptopPrice;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
                }

                reader.Close();
            }
        }
        else
        {
            string message = "Invalid laptop ID.";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
        }
    }

}
