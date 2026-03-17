<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="Main_project.UserAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .account-container {
            width: 650px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }

        .account-container h1 {
            background-color: #C69E9E;
            color: white;
            padding: 15px;
            text-align: center;
            border-radius: 8px;
            font-size: 28px;
        }

        .form-row {
            margin-bottom: 20px;
        }

        .form-label {
            color: #333;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .form-button {
            background-color: #C69E9E;
            color: white;
            border: none;
            padding: 12px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
        }

        .form-button:hover {
            background-color: #b98c8c;
        }

        .form-message {
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
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
            <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" Style="text-decoration: none;">Home</asp:LinkButton>
            <asp:LinkButton ID="lnkAboutUs" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/About.aspx" Style="text-decoration: none;">About Us</asp:LinkButton>
            <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30" OnClick="ImgBtnLogout_Click" />
        </div>
    </div>

    <div class="account-container">
        <h1>Welcome</h1>

        <div class="form-row">
            <label class="form-label">Full Name</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" ReadOnly="True" />
        </div>

        <div class="form-row">
            <label class="form-label">Email</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input" />
        </div>

        <div class="form-row">
            <label class="form-label">Phone Number</label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" />
        </div>

        <div class="form-row">
            <label class="form-label">Password</label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" TextMode="Password" />
        </div>

        <asp:Button ID="Button1" runat="server" Text="SAVE" CssClass="form-button" OnClick="Button1_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />
    </div>
</asp:Content>
