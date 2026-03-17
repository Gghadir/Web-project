<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="Main_project.WelcomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            color: #FFFFFF;
            font-size: 35pt;
            height: 15px;
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
        .contact-info {
            background-color: rgba(255, 255, 255, 0.1);
            color: #FFFFFF;
            text-align: center;
            padding: 20px;
            font-size: medium;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 100px;
        }
        .contact-info a {
            color: #FFB6C1;
            text-decoration: underline;
        }
        .auto-style11 {
            background-color: rgba(255, 255, 255, 0.1);
            color: #FFFFFF;
            text-align: center;
            padding: 20px;
            font-size: medium;
            position: relative;
            bottom: -284px;
            width: 100%;
            margin-top: 100px;
            left: 0px;
            height: 434px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="top-bar">
   
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p><br /></p>

    <p class="auto-style8">&nbsp;&nbsp; Welcome to Peak Gym</p>

    <p class="auto-style6">
        <span class="auto-style9"><em><strong>Strength</strong></em></span> meets Determination
    </p>

   

    <p>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style10" Height="50px" OnClick="Button1_Click" PostBackUrl="~/AboutUsPage.aspx" Text="About Us" Width="281px" />
    </p>

    <div class="auto-style11">
        <p><strong>Contact Us</strong></p>
        <p>Email: <a href="mailto:info@peakgym.com">info@peakgym.com</a></p>
        <p>Phone: +966 123 456 789</p>
        <p>Location: Riyadh, Saudi Arabia</p>
    </div>
</asp:Content>
