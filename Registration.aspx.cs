using System;
using System.Data.SqlClient;

namespace Main_project
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (TextBox4.Text != TextBox5.Text)
            {
                Response.Write("<script>alert('Passwords do not match.');</script>");
                return;
            }

        
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\gym_data1.mdf;Integrated Security=True");
            con.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO Users (Name, Email, Password, Phone, Role) VALUES (@Name, @Email, @Password, @Phone, @Role)", con);


            cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Role", "User"); 

          
            cmd.ExecuteNonQuery();

           
            con.Close();

            
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";

            Response.Redirect("LogIn.aspx");
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx"); 
        }
    }
}
