using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Main_project
{
    public partial class AppointmentAvailability : System.Web.UI.Page
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
                if (Request.QueryString["ServiceID"] != null)
                {
                    ViewState["ServiceID"] = Request.QueryString["ServiceID"];
                }
                else
                {
                    lblMessage.Text = "Service not specified.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ViewState["ServiceID"] == null)
            {
                lblMessage.Text = "Service ID is missing.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string selectedDate = calendarDate.SelectedDate.ToString("yyyy-MM-dd");
            string time = txtTime.Text;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""C:\Users\ghadi\OneDrive\Desktop\Main project\App_Data\gym_data1.mdf"";Integrated Security=True");
            SqlCommand cmd = new SqlCommand("INSERT INTO Availability (ServiceID, AvailableDate, AvailableTime) VALUES (@ServiceID, @Date, @Time)", con);

            cmd.Parameters.AddWithValue("@ServiceID", ViewState["ServiceID"].ToString());
            cmd.Parameters.AddWithValue("@Date", selectedDate);
            cmd.Parameters.AddWithValue("@Time", time);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Saved available date and time!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                txtTime.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
