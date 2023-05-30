using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void regBtn_Click(object sender, EventArgs e)
    {
        con.Open();
        string ins = "insert into [Info] (uname, surname,email,password) values(@uname,@surname,@email,@password)";
        SqlCommand com = new SqlCommand(ins, con);
        com.Parameters.AddWithValue("@uname", uname.Text.ToString());
        com.Parameters.AddWithValue("@surname", surname.Text.ToString());
        com.Parameters.AddWithValue("@email", email.Text.ToString());
        com.Parameters.AddWithValue("@password", password.Text.ToString());
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Login.aspx");
    }
}