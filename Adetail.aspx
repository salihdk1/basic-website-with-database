<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adetail.aspx.cs" Inherits="Adetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Account Details</title>
    <style>
        h1{
            text-align:left;
        }
        h2{
            text-align:center;
        }
        .deta{
            text-align: center;
            margin:80px, 480px;
            padding:20px;
            border:1px double;
        }
        .txtName{
            width: 50px;
            height:30px;
        }
    </style>
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
                <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Adetail.aspx">  <%=HttpContext.Current.Session["uname"] %> </asp:HyperLink> </li>
                <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ShoppingCart.aspx"> Your Cart </asp:HyperLink> </li>
                <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Logout.aspx">Sign Out</asp:HyperLink></li>
            </ul>
        </div>
    </nav>

    <h1>Account Details</h1>
    <li>Your ID: <%=HttpContext.Current.Session["id"] %> </li>
    <li>Your Name: <%=HttpContext.Current.Session["uname"] %> </li>
    <li>Your Surname: <%=HttpContext.Current.Session["surname"] %> </li>
    <li>Your Email: <%=HttpContext.Current.Session["email"] %> </li><br />

    
    <form id="accountDetailsForm" runat="server">
        <div>
            <label for="name">Name:</label>
            <asp:TextBox ID="txtName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
        </div>
        <div>
            <label for="email">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required></asp:TextBox>
        </div>
        <div>
            <label for="password">Password:</label>
            <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Update" OnClick="UpdateButton_Click" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>
