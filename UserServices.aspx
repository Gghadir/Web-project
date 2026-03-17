<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="UserServices.aspx.cs" Inherits="Main_project.UserServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .services-grid {
            width: 90%;
            margin: auto;
            margin-top: 30px;
        }

        .grid-header {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #000;
            margin-top: 60px;
            margin-bottom: 30px;
        }

        .gridview-style {
            width: 100%;
            border: none;
        }

        .service-box {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            background-color: #fdfdfd;
            margin-bottom: 20px;
        }

        .service-img {
            width: 150px;
            height: auto;
            margin-bottom: 10px;
        }

        .service-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        h2 {
            text-align: center;
            background-color: #CDA6A7;
            color: white;
            margin-bottom: 30px;
        }

        .book-btn {
            background-color: #D6A9A6;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            color: #000;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }

        .book-btn:hover {
            background-color: #c79491;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    
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
    <div><h2>Our Services</h2></div>

    <div class="services-grid">
        <asp:GridView ID="GridView1" runat="server" CssClass="gridview-style"
    AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
    ShowHeader="False" GridLines="None" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
    <div class="service-box">
      <img src='<%# ResolveUrl(Eval("ServicePhoto").ToString()) %>' alt="Service Photo" class="service-img" />
        <div class="service-name"><%# Eval("ServiceName") %></div>

       <div style="margin-bottom: 10px; display: flex; align-items: center; justify-content: center; gap: 5px;">
   <img src='<%# ResolveUrl("~/image/riyalsign.png") %>' alt="Price" style="width: 18px; height: 18px;" />
    <span style="font-weight: bold;"><%# Eval("Price") %></span>
</div>

        <asp:Button ID="btnBookNow" runat="server" Text="Book Now!" CssClass="book-btn"
            CommandName="Book" CommandArgument='<%# Eval("ServiceID") %>' />
    </div>
</ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>"
            SelectCommand="SELECT * FROM Services">
        </asp:SqlDataSource>
    </div>

    <p>&nbsp;&nbsp;</p>
</asp:Content>
