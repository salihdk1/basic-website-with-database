<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>My Account</title>

    <style>
        body{
            margin: 0;
            padding: 0;
            font-family:sans-serif;
        }
        .regbox{
            position:absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%);
            width:350px;
            height:520px;
            padding:2px 40px;
            box-sizing:border-box;
            background: rgba(0,0,0,0.5);
        }
        h1{
            text-align:center;
        }
        .lblname, .lblsurname, .lblmail, .lblpsw{
            font-weight:bold;
            color:black;
        }
        .txtname, .txtsurname, .txtmail, .txtpsw, .btnsign{
            width:%100 ;
            margin-bottom:20px;
        }
        .txtname, .txtsurname, .txtmail, .txtpsw{
            border:none;
            border-bottom:3px solid #fff;
            outline:none;
            height:40px;
            color:#fff;
            font-size:16px;
            background-color:transparent;
        }
        ::placeholder{
            color:rgba(255,255,255,.5);
        }
        .btnsign{
            border:none;
            outline:none;
            height:40px;
            font-size:16px;
            color:#fff;
            background-color:rgb(255,9,9);
            cursor:pointer;
            border-radius:20px;
            transition: .3s ease-in-out;
        }
        .btnsign:hover{
            background-color:rgb(255,217,9);
        }
    </style>
</head>
<body>
    <h1>Account Management</h1>
    <form runat="server">
        <label for="txtName">Name:</label>
        <asp:TextBox ID="txtName" runat="server" Enabled="false"></asp:TextBox><br><br>
        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br><br>
        <label for="txtNewPassword">New Password:</label>
        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox><br><br>
        <label for="txtConfirmPassword">Confirm Password:</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox><br><br>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /><br /><br />
        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" /><br /><br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
