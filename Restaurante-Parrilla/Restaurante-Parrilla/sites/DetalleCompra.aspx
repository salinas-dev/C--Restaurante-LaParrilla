<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="Restaurante_Parrilla.sites.DetalleCompra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <nav> 
        <ul>
            <li><a href="DetalleCompra.aspx">DETALLE COMPRA</a></li>
            <li><a href="Insumo.aspx">INSUMO</a></li>
        </ul>
    </nav>
<h7>Agregar Detalle de Compra</h7>
    <form id="form1" runat="server">
        <center>
            <asp:Label ID="lblInsumo" runat="server" Text="Insumo: "></asp:Label>
            <asp:DropDownList ID="DropDownListInsumo" runat="server" Width="151px"></asp:DropDownList>
            
            <br />
            <br />

            <asp:Label ID="lblCantidad" runat="server" Text="Cantidad: "></asp:Label>
            <asp:TextBox ID="txtCantidad" runat="server" Width="143px"></asp:TextBox>

            <br />
            <br />
            
            <asp:Label ID="lblProveedor" runat="server" Text="Proveedor: "></asp:Label>
            <asp:DropDownList ID="DropDownListProveedor" runat="server" Width="139px"></asp:DropDownList>
            
           
            
             <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                <br />
                <br />
            <br />
            <br />
            <asp:GridView ID="GridViewDetalleCompra" runat="server"></asp:GridView>
        </center>
    </form>
</body>
</html>
