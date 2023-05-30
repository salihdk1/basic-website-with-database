using System;
using System.Data.SqlClient;


    public partial class LaptopList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the laptop list and bind it to the repeater control
                LoadLaptopList();
            }
        }

    private void LoadLaptopList()
    {
        string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=MyCustomLaptop;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT Name, Price, Description FROM Pc";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            rptLaptops.DataSource = reader;
            rptLaptops.DataBind();

            reader.Close();
            connection.Close();
        }
    }

}

