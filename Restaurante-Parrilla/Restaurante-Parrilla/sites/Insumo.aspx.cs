using Restaurante_Parrilla.sites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla
{
    public partial class Insumo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.combo(DropDownListProducto, "SELECT nombre FROM productos");
                ConexionMaestra.leer.Close();

                // Select con INNER JOIN para mostrar datos de insumos y nombres de productos
                ConexionMaestra.grid(GridViewInsumo,
                    "SELECT I.id_insumo AS ID, " +
                    "I.nombre_insumo AS NOMBRE_INSUMO, " +
                    "I.existencia_insumo AS EXISTENCIA, " +
                    "I.precio_compra AS PRECIO " +
                    "FROM insumo AS I ;");

                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();
            string consulta = "EXEC InsertarInsumo '" +
                                    DropDownListProducto.SelectedItem.Text + "', '" +
                                    txtNombreInsumo.Text + "', " +
                                    txtExistencia.Text + ", " +
                                    txtPrecioCompra.Text;

            ConexionMaestra.ejecuta(consulta);
            ConexionMaestra.leer.Close();

            // Select con INNER JOIN para mostrar datos de insumos y nombres de productos
            ConexionMaestra.grid(GridViewInsumo,
                "SELECT I.id_insumo AS ID, " +
                "I.nombre_insumo AS NOMBRE_INSUMO, " +
                "I.existencia_insumo AS EXISTENCIA, " +
                "I.precio_compra AS PRECIO " +
                "FROM insumo AS I ;");

            ConexionMaestra.cerrar();
        }
    }
}
