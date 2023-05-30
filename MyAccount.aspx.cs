using System;
using System.Data.SqlClient;


public partial class MyAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate account information on page load
            string userId = "get_user_id_from_session_or_query_string";
            LoadAccountDetails(userId);
        }
    }

    protected void LoadAccountDetails(string userId)
    {
        // Database connection and query execution
        string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=MyCustomLaptop;Integrated Security=True\" providerName=\"System.Data.SqlClient";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT uname, email FROM Users WHERE UserID = @UserID";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", userId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                // Set the values in the form fields
                txtUsername.Text = reader["uname"].ToString();
                txtEmail.Text = reader["email"].ToString();
            }

            reader.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string userId = "get_user_id_from_session_or_query_string";
        string email = txtEmail.Text;

        // Database connection and query execution
        string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=MyCustomLaptop;Integrated Security=True\" providerName=\"System.Data.SqlClient";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "UPDATE Users SET Email = @Email WHERE UserID = @UserID";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@UserID", userId);

            int rowsAffected = command.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                // Update successful, display success message
                lblMessage.Text = "Account details updated successfully.";
            }
            else
            {
                // Update failed, display error message
                lblMessage.Text = "Failed to update account details. Please try again.";
            }
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        string userId = "get_user_id_from_session_or_query_string";
        string newPassword = txtNewPassword.Text;
        string confirmPassword = txtConfirmPassword.Text;

        // Validate password inputs
        if (newPassword != confirmPassword)
        {
            lblMessage.Text = "Passwords do not match.";
            return;
        }

        // Database connection and query execution
        string connectionString = "your_connection_string";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "UPDATE Info SET password = @NewPassword WHERE UserID = @UserID";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@NewPassword", newPassword);
            command.Parameters.AddWithValue("@UserID", userId);

            int rowsAffected = command.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                // Password change successful, display success message
                lblMessage.Text = "Password changed successfully.";
            }
            else
            {
                // Password change failed, display error message
                lblMessage.Text = "Failed to change password. Please try again.";
            }
        }
    }
}

