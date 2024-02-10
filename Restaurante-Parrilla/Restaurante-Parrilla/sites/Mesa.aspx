<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mesa.aspx.cs" Inherits="Restaurante_Parrilla.Mesa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
 <h7>Agregar Mesa</h7>
    <form id="form1" runat="server">
        <div>
            <center>
                <asp:Label ID="lblCapacidad" runat="server" Text="Capacidad: "></asp:Label>
                <asp:TextBox ID="txtCapacidad" runat="server" Height="20px" Width="167px"></asp:TextBox>

                <br />
                <br />

                <asp:Label ID="lblEstatus" runat="server" Text="Estado: "></asp:Label>
                <asp:DropDownList ID="DropDownListEstado" runat="server"></asp:DropDownList>


                <asp:ImageButton ID="ImageButton1" runat="server" Width="16px" OnClick="ImageButton1_Click" Height="16px" src="/img/guardar-datos-png" />
                <br />
                <br />
                <center>

                <asp:GridView ID="GridViewMesa" runat="server" Height="54px" Width="229px">
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
