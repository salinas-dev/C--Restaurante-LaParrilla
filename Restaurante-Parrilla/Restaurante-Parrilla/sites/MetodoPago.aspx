<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetodoPago.aspx.cs" Inherits="Restaurante_Parrilla.MetodoPago" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
 <h7>Agregar Metodo de Pago</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblNombreForma" runat="server" Text="Nombre pago: "></asp:Label>
                <asp:TextBox ID="txtNombreForma" runat="server" Height="20px" Width="135px"></asp:TextBox>

                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos.png" />
                <br />
                <br />
                <center>
                
                <asp:GridView ID="GridViewMetodoPago" runat="server" Height="73px" Width="165px">
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
