<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="Main_project.UserHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .image-row {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .image-item {
            text-align: center;
            margin: 10px;
        }

        .image-item img {
            display: block;
            margin: 0 auto;
        }

        .image-item a {
            display: block;
            margin-top: 10px;
            background-color: #D6A9A6;
            font-size: large;
            text-decoration: none;
            color: black;
            padding: 5px 10px;
            border-radius: 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    
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


    
    <div class="image-row">
        <div class="image-item">
            <asp:Image ID="Image3" runat="server" Height="155px" ImageUrl="~/image/acoont-removebg-preview.png" Width="146px" />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UserAccount.aspx">Account</asp:HyperLink>
        </div>
        <div class="image-item">
            <asp:Image ID="Image4" runat="server" Height="152px" ImageUrl="~/image/dashoard-removebg-preview.png" Width="151px" />
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/UserDashboard.aspx">Dashboard</asp:HyperLink>
        </div>
        <div class="image-item">
            <asp:Image ID="Image5" runat="server" Height="155px" ImageUrl="~/image/servicesmanagement-removebg-preview.png" Width="152px" />
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/UserServices.aspx">Services</asp:HyperLink>
        </div>
    </div>
</asp:Content>