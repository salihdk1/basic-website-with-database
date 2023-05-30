using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

    public partial class Adetail : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string query = "SELECT email FROM Users WHERE id = @id";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@id", id);

                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            txtName.Text = reader["Name"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                        }
                        else
                        {
                            // Handle user not found scenario
                        }

                        reader.Close();
                    }
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(id))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "UPDATE Info SET email = @email, password = @password WHERE id = @id";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@email", txtEmail.Text);
                    command.Parameters.AddWithValue("@password", passwordTextBox.Text);
                    command.Parameters.AddWithValue("@id", id);

                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Redirect("Adetail.aspx?id=" + id);
                    }
                    else
                    {
                        // Handle update failure scenario
                    }
                }
            }
        }
    }

