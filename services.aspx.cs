using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_project
{
    public partial class services : Page
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

        protected string GetViewLink(int index, object id)
        {
            return $"<a href='ServiceDetails1.aspx?id={id}' class='book-btn'>View</a>";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
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
