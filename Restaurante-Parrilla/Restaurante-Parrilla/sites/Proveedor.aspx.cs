using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla.sites
{
    public partial class Proveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.grid(GridViewProveedor,
                    "SELECT id_proveedor AS ID, " +
                    "nombre AS NOMBRE, " +
                    "telefono AS TELEFONO " +
                    "FROM proveedor ");

                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();
            string consulta = "EXEC InsertarProveedor '" +
                                txtNombreProveedor.Text + "', '" +
                                txtTelefono.Text + "'";

            ConexionMaestra.ejecuta(consulta);
            ConexionMaestra.leer.Close();
            ConexionMaestra.grid(GridViewProveedor,
                "SELECT id_proveedor AS ID, " +
                "nombre AS NOMBRE, " +
                "telefono AS TELEFONO " +
                "FROM proveedor");

            ConexionMaestra.cerrar();
        }
    }
}
