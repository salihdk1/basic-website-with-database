<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Product Details</title>
</head>
<body>

    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Home.aspx">My Custom Laptop</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Home.aspx">Home</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Adetail.aspx">  <%=HttpContext.Current.Session["uname"] %> </asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ShoppingCart.aspx"> Your Cart </asp:HyperLink></li>
                </ul>
            </div>
        </nav>

    <form id="form1" runat="server">
        <div>
            <h1>Product Details</h1>
            <div>
                <label>Name:</label>
                <asp:Label ID="LblName" runat="server"></asp:Label>
            </div>
            <div>
                <label>Price:</label>
                <asp:Label ID="LblPrice" runat="server"></asp:Label>
            </div>
            <div>
                <label>Description:</label>
                <asp:Label ID="LblDescription" runat="server"></asp:Label>
            </div>
            <div>
                <asp:Button ID="BtnAddToCart" runat="server" Text="Add to Cart" OnClick="BtnAddToCart_Click" />
            </div>
        </div>
    </form>
</body>
</html>
