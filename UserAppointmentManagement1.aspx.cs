using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Main_project
{
    public partial class UserAppointmentManagement1 : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\gym_data1.mdf;Integrated Security=True";

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
                if (Request.QueryString["ServiceID"] != null)
                {
                    string serviceID = Request.QueryString["ServiceID"];
                    LoadServiceInfo(serviceID);
                    LoadDates(serviceID);
                }
            }
        }

        protected void ImgBtnLogout_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        private void LoadServiceInfo(string serviceID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT ServiceName FROM Services WHERE ServiceID = @ServiceID", conn);
                cmd.Parameters.AddWithValue("@ServiceID", serviceID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ddlClass.Items.Clear();
                    ddlClass.Items.Add(reader["ServiceName"].ToString());
                    ddlClass.Enabled = false;
                }
                conn.Close();
            }
        }

        private void LoadDates(string serviceID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT AvailableDate FROM Availability WHERE ServiceID = @ServiceID", conn);
                cmd.Parameters.AddWithValue("@ServiceID", serviceID);
                conn.Open();
                ddlDate.DataSource = cmd.ExecuteReader();
                ddlDate.DataTextField = "AvailableDate";
                ddlDate.DataValueField = "AvailableDate";
                ddlDate.DataBind();
                ddlDate.Items.Insert(0, "-- Select Date --");
                conn.Close();
            }
        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlTime.Items.Clear();
            gvClassDetails.DataSource = null;
            gvClassDetails.DataBind();

            string serviceID = Request.QueryString["ServiceID"];
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT DISTINCT a.AvailableTime
                    FROM Availability a
                    WHERE a.ServiceID = @ServiceID
                      AND a.AvailableDate = @date
                      AND NOT EXISTS (
                          SELECT 1 FROM Appointments ap
                          WHERE ap.ServiceID = a.ServiceID
                            AND ap.AppointmentDate = a.AvailableDate
                            AND ap.AppointmentTime = a.AvailableTime
                      )
                ", conn);

                cmd.Parameters.AddWithValue("@ServiceID", serviceID);
                cmd.Parameters.AddWithValue("@date", ddlDate.SelectedValue);

                conn.Open();
                ddlTime.DataSource = cmd.ExecuteReader();
                ddlTime.DataTextField = "AvailableTime";
                ddlTime.DataValueField = "AvailableTime";
                ddlTime.DataBind();
                ddlTime.Items.Insert(0, "-- Select Time --");
                conn.Close();
            }
        }

        protected void ddlTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            string serviceID = Request.QueryString["ServiceID"];
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT Description, Price, Duration FROM Services WHERE ServiceID = @ServiceID", conn);
                cmd.Parameters.AddWithValue("@ServiceID", serviceID);
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvClassDetails.DataSource = dt;
                gvClassDetails.DataBind();
                conn.Close();
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (ddlDate.SelectedIndex == 0 || ddlTime.SelectedIndex == 0)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please select a valid date and time.";
                return;
            }

            string userID = Session["username"].ToString();
            string serviceID = Request.QueryString["ServiceID"];
            string selectedDate = ddlDate.SelectedValue;
            string selectedTime = ddlTime.SelectedValue;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand checkCmd = new SqlCommand(@"
                    SELECT COUNT(*) FROM Appointments
                    WHERE ServiceID = @ServiceID
                      AND AppointmentDate = @Date
                      AND AppointmentTime = @Time", conn);

                checkCmd.Parameters.AddWithValue("@ServiceID", serviceID);
                checkCmd.Parameters.AddWithValue("@Date", selectedDate);
                checkCmd.Parameters.AddWithValue("@Time", selectedTime);

                int conflict = (int)checkCmd.ExecuteScalar();

                if (conflict > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "This time slot is already booked. Please choose another time.";
                    return;
                }

                SqlCommand insertCmd = new SqlCommand(@"
                    INSERT INTO Appointments (UserID, ServiceID, AppointmentDate, AppointmentTime)
                    VALUES (@UserID, @ServiceID, @Date, @Time)", conn);

                insertCmd.Parameters.AddWithValue("@UserID", userID);
                insertCmd.Parameters.AddWithValue("@ServiceID", serviceID);
                insertCmd.Parameters.AddWithValue("@Date", selectedDate);
                insertCmd.Parameters.AddWithValue("@Time", selectedTime);

                insertCmd.ExecuteNonQuery();

                Response.Redirect("UserAppointmentManagement2.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserServices.aspx");
        }
    }
}
