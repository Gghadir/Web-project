using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Main_project
{
    public partial class AdminServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\ghadi\OneDrive\Desktop\Main project\App_Data\gym_data1.mdf;Integrated Security=True");
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO Services (ServiceName, Description, Duration, Price, ServicePhoto) VALUES (@ServiceName, @Description, @Duration, @Price, @ServicePhoto)", con);

                cmd.Parameters.AddWithValue("@ServiceName", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Description", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Duration", TextBox4.Text); 
                cmd.Parameters.AddWithValue("@Price", TextBox3.Text);    

                if (FileUpload1.HasFile)
                {
                    string fileName = FileUpload1.FileName;
                    string filePath = Server.MapPath("~/images/" + fileName);
                    FileUpload1.SaveAs(filePath);
                    cmd.Parameters.AddWithValue("@ServicePhoto", "images/" + fileName);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ServicePhoto", DBNull.Value);
                }

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Service added successfully.');</script>");

                
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            
        }
    }
}
