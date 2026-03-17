<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="UserAppointmentManagement1.aspx.cs" Inherits="Main_project.UserAppointmentManagement1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            background-color: rgba(255, 240, 245, 0.9);
            padding: 20px;
            width: 500px;
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
            color: White;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .grid-style {
            background-color: white;
            border: 1px solid #ccc;
            width: 100%;
            margin-top: 20px;
        }

        .grid-style th {
            background-color: #CDA6A7;
            color: white;
            padding: 10px;
        }

        .grid-style td {
            padding: 10px;
        }

        .btn-book {
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

        .btn-book:hover {
            background-color: #b65584;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"></asp:Content>

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

    <div class="form-container">
        <h2>Book Your Class</h2>

        <label>Pick your class</label>
        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>

        <label>Pick a date</label>
        <asp:DropDownList ID="ddlDate" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged"></asp:DropDownList>

        <label>Pick a time</label>
        <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTime_SelectedIndexChanged"></asp:DropDownList>

        <asp:GridView ID="gvClassDetails" runat="server" CssClass="grid-style" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" />
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnBookNow" runat="server" Text="Book Now!" CssClass="btn-book" Width="498px" OnClick="btnBookNow_Click" />

        <br /><br />

        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn-book" Width="498px" OnClick="btnBack_Click" />

        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Style="display:block;margin-top:20px;text-align:center;" />
    </div>
</asp:Content>
