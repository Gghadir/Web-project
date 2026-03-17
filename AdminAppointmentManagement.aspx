<%@ Page Title="Manage Appointments" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="AdminAppointmentManagement.aspx.cs" Inherits="Main_project.AdminAppointmentManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .container {
            width: 80%;
            margin: 50px auto;
            text-align: center;
        }
        .appointment-grid {
            width: 100%;
            border-collapse: collapse;
            background-color: #f8f8f8;
            font-family: Arial, sans-serif;
        }
        .appointment-grid th, .appointment-grid td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .appointment-grid th {
            background-color: #e7c5c5;
            color: black;
            font-size: 16px;
            font-weight: bold;
        }
        .action-button {
            background-color: #e7c5c5;
            border: none;
            padding: 8px 16px;
            border-radius: 10px;
            color: black;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
        }
        .action-button:hover {
            background-color: #d89ea1;
        }
        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <div style="background-color: #f2b6bc; height: 60px; position: relative; left: -10px; width: calc(100% + 20px); display: flex; justify-content: space-between; align-items: center; padding: 0 30px; box-sizing: border-box;">
        <div style="display: flex; align-items: center; gap: 10px;">
            <asp:ImageButton ID="ImgBtnRight" runat="server" ImageUrl="~/image/Accountphoto.png" Width="30px" Height="30px" OnClick="ImgBtnRight_Click" />
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" ForeColor="White" />
        </div>

        <div style="display: flex; align-items: center; gap: 15px;">
            <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/AdminDashboard.aspx" Style="text-decoration: none;">Home</asp:LinkButton>
            <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30px" Height="30px" OnClick="ImgBtnLogout_Click" />
        </div>
    </div>
 

    <div class="container">

        <asp:GridView ID="AppointmentGridView" runat="server" AutoGenerateColumns="False" CssClass="appointment-grid" DataKeyNames="AppointmentID"
            OnRowCommand="AppointmentGridView_RowCommand" OnSelectedIndexChanged="AppointmentGridView_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" CommandName="ViewAppointment" CommandArgument='<%# Eval("AppointmentID") %>' CssClass="action-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
