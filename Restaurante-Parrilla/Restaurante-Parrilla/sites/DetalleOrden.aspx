<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleOrden.aspx.cs" Inherits="Restaurante_Parrilla.sites.DetalleOrden" %>

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
<h7>Agregar Detalle de Orden</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblMesa" runat="server" Text="Numero de mesa:  "></asp:Label>
                <asp:DropDownList ID="DropDownListMesa" runat="server"></asp:DropDownList>
                
                <br />
                <br />

                <asp:Label ID="lblProducto" runat="server" Text="Producto:  "></asp:Label>
                <asp:DropDownList ID="DropDownListProducto" runat="server"></asp:DropDownList>

                <br />
                <br />

                <asp:Label ID="lblCantidad" runat="server" Text="Cantidad:  "></asp:Label>
                <asp:TextBox ID="textCantidad" runat="server" Height="16px" Width="145px"></asp:TextBox>

                <br />
                <br />
                
                <asp:Label ID="lblMetdoPago" runat="server" Text="Metdo de pago:  "></asp:Label>
                <asp:DropDownList ID="DropDownListMetdodoPago" runat="server"></asp:DropDownList>
               
               
                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                
                <br />
                <br />
                
                <center>
                <asp:GridView ID="GridViewDetalleOrden" runat="server" Height="214px" Width="822px">
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
