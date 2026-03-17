<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="AdminNewService.aspx.cs" Inherits="Main_project.AdminNewService" %>

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

        .success-label {
            color: green;
            font-weight: bold;
            display: block;
            margin-top: 15px;
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
            <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/AdminDashboard.aspx"
                Style="text-decoration: none;">Home</asp:LinkButton>
            <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30" OnClick="ImgBtnLogout_Click" />
        </div>
    </div>

    <div class="service-info-container">
        <h2>Add New Service</h2>

        <label class="form-label">Service Name:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewServiceName" ErrorMessage="**" ForeColor="Red" ValidationGroup="AddGroup"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="txtNewServiceName" runat="server" CssClass="form-input" />

        <label class="form-label">Description:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewDescription" ErrorMessage="**" ForeColor="Red" ValidationGroup="AddGroup"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="txtNewDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3" />

        <label class="form-label">Price:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPrice" ErrorMessage="**" ForeColor="Red" ValidationGroup="AddGroup"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="txtNewPrice" runat="server" CssClass="form-input" />

        <label class="form-label">Duration:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewDuration" ErrorMessage="**" ForeColor="Red" ValidationGroup="AddGroup"></asp:RequiredFieldValidator>
        </label>
        <asp:TextBox ID="txtNewDuration" runat="server" CssClass="form-input" />

        <label class="form-label">Service Photo:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fileUploadNewPhoto" ErrorMessage="**" ForeColor="Red" ValidationGroup="AddGroup"></asp:RequiredFieldValidator>
        </label>
        <asp:FileUpload ID="fileUploadNewPhoto" runat="server" CssClass="form-input" />

        <asp:Label ID="lblSuccessMessage" runat="server" CssClass="success-label" Visible="false" Text="Service added successfully!" />

        <div class="button-group">
            <asp:Button ID="btnBackNew" runat="server" Text="Back" CssClass="btn" PostBackUrl="~/services.aspx" />
            <asp:Button ID="btnSaveNew" runat="server" Text="Add" CssClass="btn" ValidationGroup="AddGroup" OnClick="btnSaveNew_Click" />
        </div>
    </div>
</asp:Content>
