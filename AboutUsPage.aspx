<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="Main_project.AboutUsPage" %>

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
        .auto-style10 {
            margin-left: 172px;
            background-color: #E4D5D6;
        }
        .top-bar {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-left: 30px;
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="top-bar">
      

    
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p><br /></p>

    <p class="auto-style8">&nbsp;&nbsp; Inspiring you for a</p>

    <p class="auto-style6">
        <span class="auto-style9"><em><strong>NEW LOOK</strong></em></span> everyday
    </p>

    <p class="auto-style7">
        <em>we help you push limits and reach new heights. With top-tier equipment and expert trainers, we provide the perfect space for all fitness levels. Join us and take your performance to the next level!</em>
    </p>

    <p>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style10" Height="50px" OnClick="Button1_Click" PostBackUrl="~/LogIn.aspx" Text="Start Now!" Width="281px" />
    </p>
</asp:Content>
