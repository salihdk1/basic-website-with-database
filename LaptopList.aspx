<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LaptopList.aspx.cs" Inherits="LaptopList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Laptop Order Form</title>
    
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    .item-template td {
        border-bottom: 1px solid #ddd;
    }

    .item-template td:first-child {
        font-weight: bold;
    }

</style>

</head>
<body>
    <table>
        <tr>
            <th>Brand</th>
            <th>Model</th>
            <th>Price</th>
        </tr>
        <asp:Repeater ID="rptLaptops" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("Name") %></td>
                    <td><%# Eval("Price") %></td>
                    <td><%# Eval("Description") %></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</body>
</html>


