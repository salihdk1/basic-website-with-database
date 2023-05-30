<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Login</title>
    <style>
        
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
                <li><a href="Register.aspx"><span class="glyphicon glyphicon-user"></span> Signup </a></li>
            </ul>
        </div>
    </nav>
    <div class="loginbox">
        <form id="form1" runat="server">
            <h1>Log In Here</h1>
                <asp:Label ID="errorMSG" runat="server" Text=""></asp:Label><br />

                <asp:Label ID="Label1" runat="server" Text="EMAIL" CssClass="lblemail"></asp:Label><br />
                <asp:TextBox ID="email" runat="server" Placeholder="Enter your Email Address" CssClass="txtmail" ></asp:TextBox><br /><br />
            
                <asp:Label ID="Label2" runat="server" Text="PASSWORD" CssClass="lblpass"></asp:Label><br />
                <asp:TextBox ID="password" runat="server" Placeholder="Enter your password" TextMode="Password" CssClass="txtpsw" ></asp:TextBox><br /><br />
            
                <asp:Button ID="lgnBtn" runat="server" Text="Login" OnClick="lgnBtn_Click" CssClass="btnlgn" />
        </form>
    </div>
</body>
</html>
