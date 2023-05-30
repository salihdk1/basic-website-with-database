using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManagement : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserData();
        }
    }

    private void BindUserData()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand("SELECT id, uname, email FROM Info", connection);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            GridViewInfo.DataSource = dataTable;
            GridViewInfo.DataBind();
        }
    }

    protected void GridViewInfo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewInfo.EditIndex = e.NewEditIndex;
        BindUserData();
    }

    protected void GridViewInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridViewInfo.Rows[e.RowIndex];
        int id = Convert.ToInt32(GridViewInfo.DataKeys[e.RowIndex].Value);
        string uname = (row.FindControl("txtUsername") as TextBox).Text;
        string email = (row.FindControl("txtEmail") as TextBox).Text;

        UpdateInfo(id, uname, email);

        GridViewInfo.EditIndex = -1;
        BindUserData();
    }

    protected void GridViewInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewInfo.EditIndex = -1;
        BindUserData();
    }

    private void UpdateInfo(int id, string uname, string email)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand("UPDATE Users SET uname = @Username, email = @Email WHERE id = @UserId", connection);
            command.Parameters.AddWithValue("@Username", uname);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@UserId", id);

            connection.Open();
            command.ExecuteNonQuery();
        }
    }
}
