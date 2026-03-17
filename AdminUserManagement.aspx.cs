using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Main_project
{
    public partial class AdminUserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adname"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome, " + Session["Name"].ToString();
            }

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void LoadUsers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Name, email, UserID, phone, role FROM Users";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                UserGridView.DataSource = dt;
                UserGridView.DataBind();
            }
        }

        protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewUser")
            {
                string userId = e.CommandArgument.ToString();
                Response.Redirect("AdminUserInfo.aspx?id=" + userId);
            }
        }

        protected void UserGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void UserGridView_SelectedIndexChanged1(object sender, EventArgs e)
        {
           
        }
    }
}
