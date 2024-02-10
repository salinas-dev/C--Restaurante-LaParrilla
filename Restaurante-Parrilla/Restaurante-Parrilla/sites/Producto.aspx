<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Restaurante_Parrilla.sites.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <nav> 
        <ul>
            <li><a href="DetalleOrden.aspx">DETALLE ORDEN</a></li>
            <li><a href="Producto.aspx">PRODUCTO</a></li>
        </ul>
    </nav>

 <h7>Agregar Producto</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblNombreProducto" runat="server" Text="Nombre:  "></asp:Label>
                <asp:TextBox ID="txtNombreProducto" runat="server" Height="23px" Width="192px"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="lblPrecioVenta" runat="server" Text="Precio venta:  "></asp:Label>
                <asp:TextBox ID="txtPrecioVenta" runat="server" Width="206px"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="lblCategoria" runat="server" Text="Categoria:  "></asp:Label>
                <asp:DropDownList ID="DropDownListCategoria" runat="server" Height="26px" Width="206px"></asp:DropDownList>
                <br />
                <br />

                <asp:Label ID="lblExistencia" runat="server" Text="Existencia:  "></asp:Label>
                <asp:TextBox ID="txtExistencia" runat="server" Width="206px"></asp:TextBox>
                
               
                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                <br />
                <br />
                <center>
                <asp:GridView ID="GridViewProducto" runat="server" Height="173px" Width="652px">
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
