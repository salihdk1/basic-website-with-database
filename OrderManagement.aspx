<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderManagement.aspx.cs" Inherits="OrderManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Order Management</title>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Order Management</h1>
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" OnRowCommand="gvOrders_RowCommand">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="CancelOrder" CommandArgument='<%# Eval("OrderId") %>' Visible='<%# Eval("OrderStatus") != "Cancelled" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>

