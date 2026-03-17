<%@ Page Title="About Us" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Main_project.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            color: #FFFFFF;
            font-size: 35pt;
            height: 15px;
        }
        .auto-style7 {
            color: #FFFFFF;
            font-size: large;
            background-color: rgba(255, 182, 193, 0.2);
            margin-top: 0px;
            height: 44px;
        }
        .auto-style8 {
            color: #FFFFFF;
            font-size: 35pt;
            height: 8px;
        }
        .auto-style9 {
            color: #CEA4A6;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" />

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

  
    <div style="background-color: #f2b6bc; height: 60px; position: relative; left: -10px; width: calc(100% + 20px); display: flex; justify-content: space-between; align-items: center; padding: 0 30px; box-sizing: border-box;">
        <div style="display: flex; align-items: center; gap: 10px;">
            <asp:ImageButton ID="ImgBtnRight" runat="server" ImageUrl="~/image/Accountphoto.png" Width="30px" Height="30px" OnClick="ImgBtnRight_Click" />
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" ForeColor="White" />
        </div>

        <div style="display: flex; align-items: center; gap: 15px;">
            <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/UserHomePage.aspx"
                Style="text-decoration: none;">Home</asp:LinkButton>
            <asp:LinkButton ID="lnkAboutUs" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/About.aspx"
                Style="text-decoration: none;">About Us</asp:LinkButton>
            <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30px" OnClick="ImgBtnLogout_Click" />
        </div>
    </div>

    <p><br /></p>

    <p class="auto-style8">&nbsp;&nbsp; Inspiring you for a</p>

    <p class="auto-style6">
        <span class="auto-style9"><em><strong>NEW LOOK</strong></em></span> everyday
    </p>

    <p class="auto-style7">
        <em>we help you push limits and reach new heights. With top-tier equipment and expert trainers, we provide the perfect space for all fitness levels. Join us and take your performance to the next level!</em>
    </p>

    <p>&nbsp;</p>

</asp:Content>
