<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/mainmasterpage.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="Main_project.services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            background-color: rgba(255, 240, 245, 0.9);
            padding: 20px;
            width: 90%;
            margin: 40px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            background-color: #CDA6A7;
            color: white;
            margin-bottom: 30px;
            padding: 10px;
            border-radius: 6px;
        }

        .gridview-style {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            width: 100%;
            margin-left: 2px;
            margin-right: 0px;
        }

        .service-box {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            background-color: white;
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

        .book-btn {
            background-color: #CDA6A7;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            margin: 0 5px;
        }

        .book-btn:hover {
            background-color: #b65584;
        }

        .btn-book {
            display: block;
            margin: 0 auto 30px auto;
            background-color: #CDA6A7;
            border: none;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            cursor: pointer;
            text-decoration: none;
            border-radius: 6px;
        }

        .btn-book:hover {
            background-color: #b65584;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" />

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="background-color: #f2b6bc; height: 60px; position: relative; left: -10px; width: calc(100% + 20px); display: flex; justify-content: space-between; align-items: center; padding: 0 30px; box-sizing: border-box;">
        <div style="display: flex; align-items: center; gap: 10px;">
            <asp:ImageButton ID="ImgBtnRight" runat="server" ImageUrl="~/image/Accountphoto.png" Width="30px" Height="30px" OnClick="ImgBtnRight_Click" />
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" ForeColor="White" />
        </div>

        <div style="display: flex; align-items: center; gap: 15px;">
            <asp:LinkButton ID="lnkHome" runat="server" ForeColor="White" Font-Bold="true" PostBackUrl="~/AdminDashboard.aspx"
    Style="text-decoration: none;">Home</asp:LinkButton>
            <asp:ImageButton ID="ImgBtnLogout" runat="server" ImageUrl="~/image/Logout.png" Width="30" Height="30" OnClick="ImgBtnLogout_Click" />
        </div>
    </div>

    <div class="form-container">
        <h2>Our Services</h2>

        <asp:Button ID="btnNewTopService" runat="server" Text="+ Add New Service"
            CssClass="btn-book" Height="46px" Width="300px"
            PostBackUrl="~/AdminNewService.aspx" />

        <asp:GridView ID="GridView1" runat="server" CssClass="gridview-style" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeader="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"><Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="service-box">
                            <img src='<%# ResolveUrl(Eval("ServicePhoto").ToString()) %>' alt="Service Photo" class="service-img" />
                            <div class="service-name"><%# Eval("ServiceName") %></div>
                            <%# GetViewLink(Container.DataItemIndex, Eval("ServiceID")) %>
                            <a href='<%# "AppointmentAvailability.aspx?ServiceID=" + Eval("ServiceID") %>' class="book-btn">Availability</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyDBConnectionString %>" 
            SelectCommand="SELECT ServiceID, ServiceName, ServicePhoto FROM Services">
        </asp:SqlDataSource>
    </div>
</asp:Content>
