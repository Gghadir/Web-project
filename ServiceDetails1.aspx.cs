using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Main_project
{
    public partial class ServiceDetails1 : System.Web.UI.Page
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

                if (!IsPostBack && Request.QueryString["id"] != null)
                {
                    LoadServiceInfo();
                }
            }
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void LoadServiceInfo()
        {
            string id = Request.QueryString["id"];

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT ServiceName, Description, Duration, Price, ServicePhoto FROM Services WHERE ServiceID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtServiceName.Text = reader["ServiceName"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtDuration.Text = reader["Duration"].ToString();
                    txtPrice.Text = reader["Price"].ToString();
                    txtPhoto.Text = reader["ServicePhoto"].ToString();
                    imgPreview.ImageUrl = reader["ServicePhoto"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string name = txtServiceName.Text;
            string description = txtDescription.Text;
            string duration = txtDuration.Text;
            string price = txtPrice.Text;
            string photo = txtPhoto.Text;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Services SET ServiceName=@name, Description=@desc, Duration=@dur, Price=@price, ServicePhoto=@photo WHERE ServiceID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@desc", description);
                cmd.Parameters.AddWithValue("@dur", duration);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@photo", photo);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    lblMessage.Text = "Changes saved successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = " Failed to save changes.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnDeletePhoto_Click(object sender, EventArgs e)
        {
            imgPreview.ImageUrl = "";
            txtPhoto.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Services WHERE ServiceID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    lblMessage.Text = " Service deleted successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = " Failed to delete service.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
