<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insumo.aspx.cs" Inherits="Restaurante_Parrilla.Insumo" %>

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
 <h7>Agregar Insumo</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblProducto" runat="server" Text="Producto:  "></asp:Label>
                <asp:DropDownList ID="DropDownListProducto" runat="server"></asp:DropDownList>
                 <br />
                <br />
                <asp:Label ID="lblNombreInsumo" runat="server" Text="Insumo:  "></asp:Label>
                <asp:TextBox ID="txtNombreInsumo" runat="server" Height="25px" Width="205px"></asp:TextBox>
                 <br />
                <br />
                <asp:Label ID="lblExistencia" runat="server" Text="Existencia insumo:  "></asp:Label>
                <asp:TextBox ID="txtExistencia" runat="server" Height="16px" Width="151px"></asp:TextBox>

                <br />
                <br />

                <asp:Label ID="lblPrecioCompra" runat="server" Text="Precio compra:  "></asp:Label>
                <asp:TextBox ID="txtPrecioCompra" runat="server" Width="151px" Height="18px" style="margin-bottom: 0px"></asp:TextBox>

               
                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                <br />
                <br />
                <center>
                <asp:GridView ID="GridViewInsumo" runat="server" Height="173px" Width="652px">
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
