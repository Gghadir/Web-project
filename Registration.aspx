<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Main_project.Registration" %>

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
            width: 48%;
        }
        .back-button {
            background-color: #888;
            color: white;
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
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .auto-style3 {
            font-size: x-small;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="top-bar">
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-container">
        <h1>Create New Account</h1>

        <label class="input-label" for="TextBox1">Name:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="***" ControlToValidate="TextBox1" CssClass="validation-message" />

        <label class="input-label" for="TextBox2">Email:</label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="input-field"></asp:TextBox>

        <label class="input-label" for="TextBox2">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" CssClass="auto-style3" ErrorMessage="***" ForeColor="Red"></asp:RequiredFieldValidator>
        </label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Incorrect Email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="validation-message" />

        <label class="input-label" for="TextBox3">Phone Number:</label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="input-field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="***" ControlToValidate="TextBox3" CssClass="validation-message" />

        <label class="input-label" for="TextBox4">Password:</label>
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="***" ControlToValidate="TextBox4" CssClass="validation-message" />

        <label class="input-label" for="TextBox5">Confirm Password:</label>
        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Unmatched password" CssClass="validation-message" />

        <div class="button-container">
            <asp:Button ID="Button1" runat="server" Text="Create Account" CssClass="submit-button" OnClick="Button1_Click" />
            <asp:Button ID="ButtonBack" runat="server" Text="Back" CssClass="submit-button back-button" CausesValidation="false" OnClick="ButtonBack_Click" />
        </div>
    </div>
</asp:Content>
