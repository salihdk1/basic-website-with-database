<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Register</title>
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
                <li><a href="Login.aspx"><span class="glyphicon glyphicon-user"></span> Login </a></li>
            </ul>
        </div>
    </nav>
    <div class="regbox">
        <form id="form1" runat="server">
            <h1>Register Page</h1>
        
            <asp:Label ID="Label1" runat="server" Text="Name " CssClass="lblname" ></asp:Label><br />
            <asp:TextBox ID="uname" runat="server" Placeholder="Enter your First Name" CssClass="txtname" ></asp:TextBox><br /><br />
            <asp:Label ID="Label2" runat="server" Text="Surname " CssClass="lblsurname" ></asp:Label><br />
            <asp:TextBox ID="surname" runat="server" Placeholder="Enter your Last Name" CssClass="txtsurname" ></asp:TextBox><br /><br />
            <asp:Label ID="Label3" runat="server" Text="Email " CssClass="lblmail" ></asp:Label><br />
            <asp:TextBox ID="email" runat="server" Placeholder="Enter your Email Address" CssClass="txtmail" ></asp:TextBox><br /><br />
            <asp:Label ID="Label4" runat="server" Text="Password " CssClass="lblpsw" ></asp:Label><br />
            <asp:TextBox ID="password" runat="server" Placeholder="Enter your password" TextMode="Password" CssClass="txtpsw" ></asp:TextBox><br /><br />
            <asp:Button ID="regBtn" runat="server" Text="Signup" OnClick="regBtn_Click" CssClass="btnsign" />
        
        </form>
    </div>
</body>
</html>
