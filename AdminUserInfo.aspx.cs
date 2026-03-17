using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Main_project
{
    public partial class UserInfo : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\gym_data1.mdf;Integrated Security=True";

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

            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                LoadUserInfo();
                lblStatus.Text = ""; 
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

        private void LoadUserInfo()
        {
            string userId = Request.QueryString["id"];

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Name, email, UserID, phone FROM Users WHERE UserID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["email"].ToString();
                    txtJoined.Text = reader["phone"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtName.ReadOnly = false;
            txtEmail.ReadOnly = false;
            txtJoined.ReadOnly = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string phone = txtJoined.Text;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Users SET Name = @name, email = @mail, phone = @phone WHERE UserID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@mail", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            txtName.ReadOnly = true;
            txtEmail.ReadOnly = true;
            txtJoined.ReadOnly = true;

            lblStatus.Text = "Changes saved successfully.";
            lblStatus.ForeColor = System.Drawing.Color.Green;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Users WHERE UserID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblStatus.Text = "User deleted successfully.";
            lblStatus.ForeColor = System.Drawing.Color.Red;

        
            txtName.Text = "";
            txtEmail.Text = "";
            txtJoined.Text = "";

            txtName.ReadOnly = true;
            txtEmail.ReadOnly = true;
            txtJoined.ReadOnly = true;
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}