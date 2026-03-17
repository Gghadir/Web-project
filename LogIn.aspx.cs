using System;
using System.Data;
using System.Data.SqlClient;

namespace Main_project
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\gym_data1.mdf;Integrated Security=True");

            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Users WHERE Name = @Name AND Password = @Password AND Role = 'admin'", con);
            SqlDataAdapter sda1 = new SqlDataAdapter("SELECT * FROM Users WHERE Name = @Name AND Password = @Password AND Role = 'user'", con);

            sda.SelectCommand.Parameters.AddWithValue("@Name", username);
            sda.SelectCommand.Parameters.AddWithValue("@Password", password);

            sda1.SelectCommand.Parameters.AddWithValue("@Name", username);
            sda1.SelectCommand.Parameters.AddWithValue("@Password", password);

            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();

            sda.Fill(dt);
            sda1.Fill(dt1);

            if (dt.Rows.Count > 0)
            {
                Session["adname"] = dt.Rows[0]["UserID"].ToString();
                Session["Name"] = dt.Rows[0]["Name"].ToString();
                Session["Email"] = dt.Rows[0]["Email"].ToString();
                Session["Phone"] = dt.Rows[0]["Phone"].ToString();
                Session["Password"] = dt.Rows[0]["Password"].ToString();
                Response.Redirect("AdminDashboard.aspx");
            }
            else if (dt1.Rows.Count > 0)
            {
                Session["username"] = dt1.Rows[0]["UserID"].ToString();
                Session["Name"] = dt1.Rows[0]["Name"].ToString();
                Session["Email"] = dt1.Rows[0]["Email"].ToString();
                Session["Phone"] = dt1.Rows[0]["Phone"].ToString();
                Session["Password"] = dt1.Rows[0]["Password"].ToString();
                Response.Redirect("UserHomePage.aspx");
            }
            else
            {
         
                label1.Visible = true;
                label1.Text = "Invalid username or password";
            }
        }
    }
}