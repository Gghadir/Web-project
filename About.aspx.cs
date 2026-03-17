using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Main_project
{
    public partial class About : System.Web.UI.Page
    {
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ImgBtnRight_Click(object sender, ImageClickEventArgs e)
        {
           
        }

        protected void ImgBtnLogout_Click(object sender, ImageClickEventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}

