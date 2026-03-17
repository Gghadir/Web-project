using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_project
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\gym_data1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome, " + Session["Name"].ToString();
            }

            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            int userId = Convert.ToInt32(Session["username"]);
            DateTime today = DateTime.Today;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                string upcomingQuery = "SELECT AppointmentID, AppointmentDate, AppointmentTime FROM Appointments WHERE UserID = @UserID AND AppointmentDate >= @Today ORDER BY AppointmentDate ASC";
                SqlCommand cmdUpcoming = new SqlCommand(upcomingQuery, con);
                cmdUpcoming.Parameters.AddWithValue("@UserID", userId);
                cmdUpcoming.Parameters.AddWithValue("@Today", today);
                SqlDataAdapter daUpcoming = new SqlDataAdapter(cmdUpcoming);
                DataTable dtUpcoming = new DataTable();
                daUpcoming.Fill(dtUpcoming);
                gvUpcomingAppointments.DataSource = dtUpcoming;
                gvUpcomingAppointments.DataBind();

                string pastQuery = "SELECT AppointmentDate, AppointmentTime FROM Appointments WHERE UserID = @UserID AND AppointmentDate < @Today ORDER BY AppointmentDate DESC";
                SqlCommand cmdPast = new SqlCommand(pastQuery, con);
                cmdPast.Parameters.AddWithValue("@UserID", userId);
                cmdPast.Parameters.AddWithValue("@Today", today);
                SqlDataAdapter daPast = new SqlDataAdapter(cmdPast);
                DataTable dtPast = new DataTable();
                daPast.Fill(dtPast);
                gvPastAppointments.DataSource = dtPast;
                gvPastAppointments.DataBind();
            }
        }

        protected void gvUpcomingAppointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    string query = "DELETE FROM Appointments WHERE AppointmentID = @AppointmentID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("UserServices.aspx");
            }
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("LogIn.aspx");
        }
    }
}
