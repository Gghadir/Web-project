using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Main_project
{
    public partial class UserAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null && Session["adname"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }

            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, " + (Session["Name"] != null ? Session["Name"].ToString() : "");

                if (Session["adname"] != null)
                {
                    lnkHome.PostBackUrl = "~/AdminDashboard.aspx";
                }
                else if (Session["username"] != null)
                {
                    lnkHome.PostBackUrl = "~/UserHomePage.aspx";
                }

                LoadUserData();
            }
        }

        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
        }

        protected void ImgBtnLogout_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void LoadUserData()
        {
            TextBox1.Text = Session["Name"]?.ToString();
            TextBox2.Text = Session["Email"]?.ToString();
            TextBox3.Text = Session["Phone"]?.ToString();
            TextBox4.Text = Session["Password"]?.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userId = Session["username"] != null ? Session["username"].ToString() : Session["adname"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Users SET Name = @Name, Email = @Email, Phone = @Phone, Password = @Password WHERE UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Phone", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Password", TextBox4.Text);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.ExecuteNonQuery();

                Session["Name"] = TextBox1.Text;
                Session["Email"] = TextBox2.Text;
                Session["Phone"] = TextBox3.Text;
                Session["Password"] = TextBox4.Text;

                lblMessage.Text = "Your information has been successfully updated!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}