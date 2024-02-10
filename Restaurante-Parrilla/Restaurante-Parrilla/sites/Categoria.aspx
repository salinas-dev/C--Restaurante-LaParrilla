<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="Restaurante_Parrilla.sites.Categoria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h7>Agregar Categoria</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblNombreCategoria" runat="server" Text="Nombre categoria: "></asp:Label>
                <asp:TextBox ID="txtNombreCategoria" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                <br />
                <br />
                <asp:GridView ID="GridViewCategoria" runat="server">
                <Columns>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <AlternatingRowStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </center>
        </div>
    </form>
</body>
</html>
