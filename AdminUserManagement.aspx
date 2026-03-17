<%@ Page Title="" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="Main_project.AdminUserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .user-grid {
            width: 100%;
            border-collapse: collapse;
            background-color: #f8f8f8;
        }

        .user-grid th, .user-grid td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .user-grid th {
            background-color: #e7c5c5;
            color: black;
        }

        .permissions-label {
            background-color: #f0f0f0;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
        }

        .view-button {
            background-color: #999;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
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
    <br>
   <asp:GridView ID="UserGridView" runat="server" AutoGenerateColumns="False" CssClass="user-grid"
    OnRowCommand="UserGridView_RowCommand" OnSelectedIndexChanged="UserGridView_SelectedIndexChanged1">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Full Name" />
        <asp:BoundField DataField="email" HeaderText="Email Address" />
        <asp:BoundField DataField="UserID" HeaderText="ID" />
        <asp:BoundField DataField="phone" HeaderText="Phone" />
        <asp:TemplateField HeaderText="Permissions">
            <ItemTemplate>
                <span class="permissions-label"><%# Eval("role") %></span>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="ViewBtn" runat="server" Text="View" CssClass="view-button"
                    CommandName="ViewUser" CommandArgument='<%# Eval("UserID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

</asp:Content>
