<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>My Custom Laptops</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Home.aspx">My Custom Laptop</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Home.aspx">Home</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <asp:PlaceHolder ID="loginPlaceHolder" runat="server">
                        <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Login.aspx"><span class="glyphicon glyphicon-user"></span>Login</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx"><span class="glyphicon glyphicon-user"></span>Register</asp:HyperLink></li>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="logoutPlaceHolder" runat="server" Visible="false">
                        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Adetail.aspx">  <%=HttpContext.Current.Session["uname"] %> </asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ShoppingCart.aspx"> Your Cart </asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Logout.aspx">Sign Out</asp:HyperLink></li>
                    </asp:PlaceHolder>
                </ul>
            </div>
        </nav>

        <div class="container">
            <h1>Laptops</h1>
            <asp:GridView ID="GridViewLaptops" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="BtnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ID") %>' OnClick="BtnAddToCart_Click" />
                        </ItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLinkDetails" runat="server" Text="View Details" NavigateUrl='<%# Eval("ID", "~/ProductDetails.aspx?Id={0}") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
