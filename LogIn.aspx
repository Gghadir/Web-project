<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Main_project.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-container {
            width: 450px;
            margin: 30px auto;
            background-color: #FFFFFF;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }
        .form-container h1 {
            background-color: #C79B9C;
            color: white;
            padding: 15px;
            text-align: center;
            margin-top: 0;
            border-radius: 6px;
        }
        .input-label {
            margin-top: 15px;
            font-weight: bold;
            color: black;
            display: block;
        }
        .input-field {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            background-color: #CC9E9E;
            color: white;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
        }
        .link-button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            background-color: #CA9D9E;
            color: white;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            text-align: center;
        }
        .validation-message {
            color: red;
            font-size: 12px;
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
    <div class="form-container">
        <h1>Welcome Back!</h1>

        <label class="input-label" for="TextBox1">Enter your name:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-field"></asp:TextBox>

        <label class="input-label" for="TextBox2">Enter your password:</label>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>

        <asp:Label ID="label1" runat="server" CssClass="validation-message" Visible="false"></asp:Label>

        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="submit-button" OnClick="Button1_Click" />

        <asp:Button ID="Button2" runat="server" Text="New here? Create an account" CssClass="link-button" PostBackUrl="~/Registration.aspx" />
    </div>
</asp:Content>
