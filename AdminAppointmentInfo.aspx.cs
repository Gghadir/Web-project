using System;
using System.Data.SqlClient;

namespace Main_project
{
    public partial class AdminAppointmentInfo : System.Web.UI.Page
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

            if (!IsPostBack && Request.QueryString["AppointmentID"] != null)
            {
                LoadAppointmentInfo();
            }
        }

        protected void ImgBtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void LoadAppointmentInfo()
        {
            string appointmentId = Request.QueryString["AppointmentID"];

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT AppointmentDate, AppointmentTime FROM Appointments WHERE AppointmentID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", appointmentId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtDate.Text = Convert.ToDateTime(reader["AppointmentDate"]).ToString("yyyy-MM-dd");
                    txtTime.Text = reader["AppointmentTime"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string appointmentId = Request.QueryString["AppointmentID"];
            string date = txtDate.Text;
            string time = txtTime.Text;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Appointments SET AppointmentDate = @date, AppointmentTime = @time WHERE AppointmentID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@time", time);
                cmd.Parameters.AddWithValue("@id", appointmentId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Changes saved successfully.";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string appointmentId = Request.QueryString["AppointmentID"];

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Appointments WHERE AppointmentID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", appointmentId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Appointment deleted successfully.";
        }
    }
}
