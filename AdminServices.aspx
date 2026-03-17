<%@ Page Title="AdminServices" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="AdminServices.aspx.cs" Inherits="Main_project.AdminServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .service-info-container {
            width: 450px;
            margin: 80px auto;
            padding: 25px;
            background-color: #f8f8f8;
            border-radius: 10px;
            font-family: Arial, sans-serif;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .service-info-container h2 {
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
    <div class="service-info-container">
        <h2>Service Details</h2>

        <label class="form-label">Service Name:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" />

        <label class="form-label">Description:</label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3" />

        <label class="form-label">Price:</label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" />

        <label class="form-label">Duration:</label>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" />

        <label class="form-label">Service Photo:</label>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-input" />

        <div class="button-group">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn" PostBackUrl="~/UserServices.aspx" OnClick="btnBack_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Add" CssClass="btn" OnClick="BtnSave_Click" />
        </div>
    </div>
</asp:Content>
