using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_project
{
    public partial class AdminDashboard : System.Web.UI.Page
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
        }

        protected void ImgBtnRight_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("UserAccount.aspx");
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}