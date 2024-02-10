using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla.sites
{
    public partial class Producto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.combo(DropDownListCategoria, "SELECT nombre FROM categoria");
                ConexionMaestra.leer.Close();
                ConexionMaestra.grid(GridViewProducto,
                    "SELECT p.id_producto AS ID, " +
                    "p.nombre AS NOMBRE, " +
                    "p.precio_venta AS PRECIO, " +
                    "c.nombre AS CATEGORIA, " +
                    "p.existencia AS EXISTENCIAS " +  // Agregar la coma aquí
                    "FROM productos p " +
                    "INNER JOIN categoria c " +
                    "ON p.id_categoria = c.id_categoria");

                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();
            string consulta = "EXEC InsertarProducto '" +
                                txtNombreProducto.Text + "', " +
                                txtPrecioVenta.Text + ", '" +
                                DropDownListCategoria.SelectedItem.Text + "', '" +
                                txtExistencia.Text + "'";
            ConexionMaestra.ejecuta(consulta);
            ConexionMaestra.leer.Close();
            ConexionMaestra.grid(GridViewProducto,
                "SELECT p.id_producto AS ID, " +
                "p.nombre AS NOMBRE, " +
                "p.precio_venta AS PRECIO, " +
                "c.nombre AS CATEGORIA, " +
                "p.existencia AS EXISTENCIAS " +  // Agregar la coma aquí
                "FROM productos p " +
                "INNER JOIN categoria c " +
                "ON p.id_categoria = c.id_categoria");

            ConexionMaestra.cerrar();
        }
    }
}
