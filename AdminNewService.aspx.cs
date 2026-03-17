using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Main_project
{
    public partial class AdminNewService : Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\gym_data1.mdf;Integrated Security=True";

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

            lblSuccessMessage.Visible = false;
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btnSaveNew_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) 
            {
                string serviceName = txtNewServiceName.Text.Trim();
                string description = txtNewDescription.Text.Trim();
                string price = txtNewPrice.Text.Trim();
                string duration = txtNewDuration.Text.Trim();

                string photoPath = "";
                if (fileUploadNewPhoto.HasFile)
                {
                    string filename = System.IO.Path.GetFileName(fileUploadNewPhoto.FileName);
                    photoPath = "~/uploads/" + filename;
                    fileUploadNewPhoto.SaveAs(Server.MapPath(photoPath));
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Services (ServiceName, Description, Price, Duration, ServicePhoto) VALUES (@Name, @Description, @Price, @Duration, @ServicePhoto)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", serviceName);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Duration", duration);
                    cmd.Parameters.AddWithValue("@ServicePhoto", photoPath);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblSuccessMessage.Visible = true;

                
                txtNewServiceName.Text = "";
                txtNewDescription.Text = "";
                txtNewPrice.Text = "";
                txtNewDuration.Text = "";
            }
        }
    }
}
