<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Main_project.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard-container {
            background-color: white;
            border: 2px solid #CDA6A7;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            width: 700px;
            margin: 100px auto;
            padding: 40px;
            text-align: center;
            color: #444;
        }

        .dashboard-title {
            font-size: 28px;
            color: #CDA6A7;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 20px;
            font-weight: bold;
            color: #444;
            margin-top: 30px;
        }

        .info-text {
            margin: 10px 0;
        }

        .btn-book {
            margin-top: 20px;
            padding: 10px 25px;
            background-color: #CDA6A7;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-book:hover {
            background-color: #b65584;
        }

        
        .cancel-button {
            background-color: #CDA6A7;
            border: none;
            color: white;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .cancel-button:hover {
            background-color: #b65584;
        }

        
        .centered-gridview {
            margin: 0 auto;
            text-align: center;
        }

        .centered-gridview th, .centered-gridview td {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" />
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

    <div class="dashboard-container">
        <div class="dashboard-title">Dashboard</div>

        <div>
            <div class="section-title">Upcoming appointment</div>
            <asp:GridView ID="gvUpcomingAppointments" runat="server" AutoGenerateColumns="False" 
                OnRowCommand="gvUpcomingAppointments_RowCommand" CssClass="centered-gridview">
                <Columns>
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" SortExpression="AppointmentDate" />
                    <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time" SortExpression="AppointmentTime" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-button" CommandName="Cancel" CommandArgument='<%# Eval("AppointmentID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <div class="section-title">Past appointment</div>
            <asp:GridView ID="gvPastAppointments" runat="server" AutoGenerateColumns="False" 
                CssClass="centered-gridview">
                <Columns>
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" SortExpression="AppointmentDate" />
                    <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time" SortExpression="AppointmentTime" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
