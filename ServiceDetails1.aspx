<%@ Page Title="Service Info" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="ServiceDetails1.aspx.cs" Inherits="Main_project.ServiceDetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .user-info-container {
            width: 450px;
            margin: 80px auto;
            padding: 25px;
            background-color: #f8f8f8;
            border-radius: 10px;
            font-family: Arial, sans-serif;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .user-info-container h2 {
            background-color: #e8a7a7;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            color: #333;
        }

        .form-label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #eee;
        }

        .button-group {
            margin-top: 20px;
            text-align: center;
        }

        .button-group .btn {
            margin: 0 10px;
            background-color: #e8a7a7;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="background-color: #f2b6bc; height: 60px; position: relative; left: -10px; width: calc(100% + 20px); display: flex; justify-content: space-between; align-items: center; padding: 0 30px; box-sizing: border-box;">
        <div style="display: flex; align-items: center; gap: 10px;">
            <asp:ImageButton ID="ImgBtnRight" runat="server" ImageUrl="~/image/Accountphoto.png" Width="30px" Height="30px" PostBackUrl="~/UserAccount.aspx" />
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" ForeColor="White" />
        </div>
        <div style="display: flex; align-items: center; gap: 15px;">
            <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/AdminDashboard.aspx" Style="text-decoration: none;">Home</asp:LinkButton>
            <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30" OnClick="ImgBtnLogout_Click" />
        </div>
    </div>

    <div class="user-info-container">
        <h2>Service Information</h2>

        <label class="form-label">Service Name:</label>
        <asp:TextBox ID="txtServiceName" runat="server" CssClass="form-input" />

        <label class="form-label">Description:</label>
        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-input" />

        <label class="form-label">Duration:</label>
        <asp:TextBox ID="txtDuration" runat="server" CssClass="form-input" />

        <label class="form-label">Price:</label>
        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input" />

        <label class="form-label">Service Photo:</label>
        <asp:Image ID="imgPreview" runat="server" Width="150px" Style="margin-bottom:10px;" />
        <asp:TextBox ID="txtPhoto" runat="server" CssClass="form-input" Visible="false" />
        <asp:Button ID="btnDeletePhoto" runat="server" Text="Delete Photo" CssClass="btn" OnClick="btnDeletePhoto_Click" />

        <div class="button-group">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn" PostBackUrl="~/services.aspx" />
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn" OnClick="btnSave_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" OnClick="btnDelete_Click" />
        </div>

       
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Green" Style="display: block; text-align: center; margin-top: 20px;" />
    </div>
</asp:Content>
