<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="UserAppointmentManagement2.aspx.cs" Inherits="Main_project.UserAppointmentManagement2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
         <style>
     .message-box {
         background-color: white;
         border: 2px solid #CDA6A7;
         border-radius: 10px;
         padding: 30px 40px;
         color:#CDA6A7;
         box-shadow: 0 0 15px #ccc;
         width: 500px;
         margin: 100px auto;
         text-align: center;
     }

     .btn-next {
         margin-top: 20px;
         padding: 10px 20px;
         background-color: #CDA6A7;
         color: white;
         border: none;
         border-radius: 6px;
         font-size: 16px;
         cursor: pointer;
     }

     .btn-next:hover {
         background-color: #b65584;
     }
 </style>
            <div style="background-color: #f2b6bc; height: 60px; position: relative; left: -10px; width: calc(100% + 20px); display: flex; justify-content: space-between; align-items: center; padding: 0 30px; box-sizing: border-box;">

    <div style="display: flex; align-items: center; gap: 10px;">
        <asp:ImageButton ID="ImgBtnRight" runat="server" ImageUrl="~/image/Accountphoto.png" Width="30px" Height="30px" PostBackUrl="~/UserAccount.aspx" />
        <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" ForeColor="White" />
    </div>

    <div style="display: flex; align-items: center; gap: 15px;">
    <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/UserHomePage.aspx"
        Style="text-decoration: none;">Home</asp:LinkButton>
    <asp:LinkButton ID="lnkAboutUs" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/About.aspx"
        Style="text-decoration: none;">About Us</asp:LinkButton>
    <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30" OnClick="ImgBtnLogout_Click" />
</div>

    </div>

    <div class="message-box">
        <h2>Your booking was successful!</h2>
        <p>We look forward to seeing you in your upcoming class.</p>
        <asp:Button ID="btnGoToUpcoming" runat="server" Text="View Upcoming Appointments" CssClass="btn-next" OnClick="btnGoToUpcoming_Click" PostBackUrl="~/UserDashboard.aspx" />
    </div>

</asp:Content>
