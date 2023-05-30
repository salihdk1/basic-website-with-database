<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>User Management</h1>
            
            <asp:GridView ID="GridViewInfo" runat="server" AutoGenerateColumns="False"
                OnRowEditing="GridViewInfo_RowEditing"
                OnRowUpdating="GridViewInfo_RowUpdating"
                OnRowCancelingEdit="GridViewInfo_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="User ID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("uname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUsername" runat="server" Text='<%# Eval("uname") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
