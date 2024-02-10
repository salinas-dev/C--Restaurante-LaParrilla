using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla.sites
{
    public partial class DetalleCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.combo(DropDownListInsumo, "SELECT nombre_insumo FROM insumo");
                ConexionMaestra.combo(DropDownListProveedor, "SELECT nombre FROM proveedor");
                ConexionMaestra.grid(GridViewDetalleCompra,
                    "SELECT dc.id_detalle_compra AS ID," +
                    " i.nombre_insumo AS ID_INSUMO," + // Corregir el nombre de la columna
                    " dc.cantidad AS CANTIDAD," +
                    " p.nombre AS PROVEEDOR," +
                    " dc.fecha AS FECHA," +
                    " dc.subtotal AS SUBTOTAL " + // Agregar un espacio antes de FROM
                    "FROM detalle_compra dc " +
                    "INNER JOIN insumo i ON dc.id_insumo = i.id_insumo " + // Corregir la comparación de las claves foráneas
                    "INNER JOIN proveedor p ON dc.id_proveedor = p.id_proveedor ");
                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();
            // Corregir la subconsulta para obtener solo un valor
            string consulta = "EXEC insertar_detalle_compra '" +
                              DropDownListInsumo.SelectedItem.Text + "', '" +
                              txtCantidad.Text + "', '" +
                              DropDownListProveedor.SelectedItem.Text + "'"; // Agrega un espacio antes de FROM

            ConexionMaestra.ejecuta(consulta);
            ConexionMaestra.cerrar();
            ConexionMaestra.abrir();
            ConexionMaestra.grid(GridViewDetalleCompra,
                "SELECT dc.id_detalle_compra AS ID," +
                " i.nombre_insumo AS ID_INSUMO," + // Corregir el nombre de la columna
                " dc.cantidad AS CANTIDAD," +
                " p.nombre AS PROVEEDOR," +
                " dc.fecha AS FECHA," +
                " dc.subtotal AS SUBTOTAL " + // Agregar un espacio antes de FROM
                "FROM detalle_compra dc " +
                "INNER JOIN insumo i ON dc.id_insumo = i.id_insumo " + // Corregir la comparación de las claves foráneas
                "INNER JOIN proveedor p ON dc.id_proveedor = p.id_proveedor ");
            ConexionMaestra.cerrar();
        }

    }
}