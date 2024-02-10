<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="Restaurante_Parrilla.sites.Proveedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
 <h7>Agregar Proveedor</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblNombreProveedor" runat="server" Text="NOMBRE:  "></asp:Label>
                <asp:TextBox ID="txtNombreProveedor" runat="server" Height="16px" Width="174px"></asp:TextBox>
                 <br />
                <br />
                <asp:Label ID="lblTelefono" runat="server" Text="TELEFONO:  "></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server" Height="16px" Width="165px"></asp:TextBox>


                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                <br />
                <br />
                <center>
                <asp:GridView ID="GridViewProveedor" runat="server"></asp:GridView>
                <Columns>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <AlternatingRowStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <PagerStyle HorizontalAlign="Center" />

                </asp:GridView>
                </center>
            </center>
        </div>
    </form>
</body>
</html>
