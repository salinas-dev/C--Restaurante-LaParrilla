using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla.sites
{
    public partial class DetalleOrden : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.combo(DropDownListMesa, "SELECT id_mesa FROM mesa");
                ConexionMaestra.combo(DropDownListProducto, "SELECT nombre FROM productos");
                ConexionMaestra.combo(DropDownListMetdodoPago, "SELECT nombre FROM metodo_pago");
                ConexionMaestra.grid(GridViewDetalleOrden,
                    "SELECT do.id_detalle_orden AS ID," +
                    " m.id_mesa AS ID_MESA," +
                    " p.nombre AS NOMBRE_PRODUCTO," +
                    " do.cantidad AS CANTIDAD," +
                    " do.fecha AS FECHA," +
                    " do.subtotal AS SUBTOTAL," +
                    " mp.nombre AS METODO_PAGO " +
                    "FROM detalle_orden do " +
                    "INNER JOIN mesa m ON do.id_mesa = m.id_mesa " +
                    "INNER JOIN productos p ON do.id_producto = p.id_producto " +
                    "INNER JOIN metodo_pago mp ON do.id_met_pago = mp.id_met_pago");
                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();

            int cantidad;
            if (int.TryParse(textCantidad.Text, out cantidad) && cantidad >= 0)
            {
                try
                {
                    // Corregir la subconsulta para obtener solo un valor
                    string consulta = "EXEC insertar_detalle_orden '" +
                                        DropDownListMesa.SelectedItem.Text + "', '" +
                                        DropDownListProducto.SelectedItem.Text + "', " +
                                        cantidad + ", '" +
                                        DropDownListMetdodoPago.SelectedItem.Text + "'";

                    ConexionMaestra.ejecuta(consulta);

                    ConexionMaestra.cerrar();

                    ConexionMaestra.abrir();
                    ConexionMaestra.grid(GridViewDetalleOrden,
                        "SELECT do.id_detalle_orden AS ID," +
                        " m.id_mesa AS ID_MESA," +
                        " p.nombre AS NOMBRE_PRODUCTO," +
                        " do.cantidad AS CANTIDAD," +
                        " do.fecha AS FECHA," +
                        " do.subtotal AS SUBTOTAL," +
                        " mp.nombre AS METODO_PAGO " +
                        "FROM detalle_orden do " +
                        "INNER JOIN mesa m ON do.id_mesa = m.id_mesa " +
                        "INNER JOIN productos p ON do.id_producto = p.id_producto " +
                        "INNER JOIN metodo_pago mp ON do.id_met_pago = mp.id_met_pago");
                    ConexionMaestra.cerrar();
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    if (ex.Message.Contains("La cantidad a vender supera la existencia actual del producto."))
                    {
                        // Mostrar mensaje de alerta utilizando JavaScript
                        string script = "alert('La cantidad es mayor a la existencia actual del producto.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "InvalidQuantity", script, true);
                    }
                    else
                    {
                        // Mostrar cualquier otra excepción en la consola del navegador
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            else
            {
                // Mostrar mensaje de alerta utilizando JavaScript
                string script = "alert('La cantidad debe ser mayor o igual a cero.');";
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidQuantity", script, true);
            }
        }
    }
}
