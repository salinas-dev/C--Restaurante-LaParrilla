using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla
{
    public partial class MetodoPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConexionMaestra.abrir();
                ConexionMaestra.grid(GridViewMetodoPago, "SELECT id_met_pago AS ID, nombre AS NOMBRE FROM metodo_pago; ");
                ConexionMaestra.cerrar();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();
            ConexionMaestra.ejecuta("EXEC InsertarMetodoPago '" + txtNombreForma.Text + "'");
            ConexionMaestra.leer.Close();
            ConexionMaestra.grid(GridViewMetodoPago, "SELECT id_met_pago AS ID, nombre AS NOMBRE FROM metodo_pago; ");
            ConexionMaestra.cerrar();
        }
    }
}