using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Main_project
{
    public partial class AdminAppointmentManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                if (Session["adname"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    lblWelcome.Text = "Welcome " + Session["Name"].ToString();
                    LoadAppointmentData();
                }
            }
        }

        private void LoadAppointmentData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT AppointmentID, UserID, AppointmentDate, AppointmentTime FROM Appointments";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    AppointmentGridView.DataSource = dt;
                    AppointmentGridView.DataBind();
                }
            }
        }

        protected void AppointmentGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewAppointment")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("AdminAppointmentInfo.aspx?AppointmentID=" + appointmentId);
            }
        }

        protected void ImgBtnRight_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("UserAccount.aspx");
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void AppointmentGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
