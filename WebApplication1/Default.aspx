<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar navbar_Custom navbar-fixed-top">
    </div>
    <div class="container-fluid panelmainContainer">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default panelLoginMain">
                    <div class="panel-heading panelLoginHeading">
                        <h3><strong>Person Details</strong></h3>
                    </div>
                    <div class="panel-body">
                        <hr>
                        <div class="form-group">
                            <asp:Label class="control-label labelDefaultFont" runat="server" Text="Name:"></asp:Label>
                            <asp:TextBox class="form-control" runat="server" placeholder="Enter your name here" ID="Text_Name" MaxLength="50"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label class="control-label labelDefaultFont" runat="server" Text="Date:"></asp:Label>
                            <asp:TextBox ID="Text_DateBirth" runat="server" CssClass="form-control" TextMode="Date" placeholder="Enter your date of birth here" MaxLength="50"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label class="control-label labelDefaultFont" runat="server" Text="Telephone Number:"></asp:Label>
                            <asp:TextBox class="form-control" runat="server" placeholder="Enter your telephone number here" ID="Text_Mobile" MaxLength="50"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegexValidator_Telephone" runat="server" ControlToValidate="Text_Mobile" ValidationExpression="^[0-9+]+$" ErrorMessage="Invalid telephone number format" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label class="control-label labelDefaultFont" runat="server" Text="Email:"></asp:Label>
                            <asp:TextBox class="form-control" runat="server" placeholder="Enter your email here" ID="Text_Email" MaxLength="50"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegexValidator_Email" runat="server" ControlToValidate="Text_Email" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ErrorMessage="Invalid email format" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label class="control-label labelDefaultFont" runat="server" Text="ID:" ></asp:Label>
                            <asp:TextBox class="form-control" runat="server" Disabled="False" MaxLength="50"></asp:TextBox>
                        </div>
                        <hr>
                        <div class="form-group">
                            <asp:Button type="submit" runat="server" OnClick="Submit_Click" Text="Submit" class="btn btn-success" />
                            <asp:Button type="reset" runat="server" OnClick="Cancel_Click" Text="Cancel" class="btn btn-danger pull-right" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#Text_Mobile").on('change keydown paste input', function (e) {
            var charCode = (e.which) ? e.which : event.keyCode
            if (String.fromCharCode(charCode).match(/^[0-9-+()]*$/);
            return false;
        });
    </script>
</asp:Content>

