<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonLoaddata.aspx.cs" Inherits="WebApplication1.PersonLoaddata" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
           <div class="navbar navbar_Custom navbar-fixed-top">
    </div>
            <asp:Button ID="Button1" runat="server" Height="28px" OnClick="Button1_Click" Text="Export to CSV" />
    <div class="container-fluid">
       
    <div>
        <asp:GridView ID="PersonDataGridView" runat="server" CssClass="table table-striped table-bordered">
            <Columns>
  
            </Columns>
        </asp:GridView>
    </div>
    </div>
</asp:Content>