<%@ Page Title="Appointment Availability" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="AppointmentAvailability.aspx.cs" Inherits="Main_project.AppointmentAvailability" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            background-color: rgba(255, 240, 245, 0.9);
            padding: 20px;
            width: 600px;
            margin: 40px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            background-color: #CDA6A7;
            color: white;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            color: white;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn-add {
            background-color: #CDA6A7;
            color: white;
            padding: 12px 20px;
            margin-top: 20px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border: none;
        }

        .btn-add:hover {
            background-color: #b65584;
        }

        .message-label {
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        .calendar-style {
            margin-bottom: 15px;
            background-color: white;
            border: 1px solid #ccc;
        }

        .calendar-style .selected {
            background-color: #CDA6A7 !important;
            color: white;
            font-weight: bold;
        }

        .btn-back {
            margin-top: 20px;
            background-color: #999;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-back:hover {
            background-color: #777;
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
    <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/AdminDashboard.aspx"
    Style="text-decoration: none;">Home</asp:LinkButton>
    <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30" OnClick="ImgBtnLogout_Click" />
</div>

    </div>
    <div class="form-container">
        <h2>Appointment Availability</h2>

        <label>Select Date:</label>
        <asp:Calendar ID="calendarDate" runat="server" CssClass="calendar-style" />

        <label>Enter Time:</label>
        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" />

        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn-add" OnClick="btnAdd_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" />

        <br />
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn-back" PostBackUrl="services.aspx" />
    </div>
</asp:Content>