using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla.sites
{
    public partial class Categoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.grid(GridViewCategoria, "SELECT id_categoria AS ID, nombre AS NOMBRE FROM categoria; ");
                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();
            ConexionMaestra.ejecuta("EXEC InsertarCategoria '" + txtNombreCategoria.Text + "'");
            ConexionMaestra.leer.Close();
            ConexionMaestra.grid(GridViewCategoria, "SELECT id_categoria AS ID, nombre AS NOMBRE FROM categoria; ");
            ConexionMaestra.cerrar();
        }
    }
}