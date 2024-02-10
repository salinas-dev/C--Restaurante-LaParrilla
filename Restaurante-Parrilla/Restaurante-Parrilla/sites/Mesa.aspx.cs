using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla
{
    public partial class Mesa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                    ConexionMaestra.abrir();
                    // Agrega las opciones al DropDownList de estado
                    DropDownListEstado.Items.Add("Disponible");
                    DropDownListEstado.Items.Add("Ocupado");
                    DropDownListEstado.Items.Add("Reservado");

                    ConexionMaestra.grid(GridViewMesa, "SELECT id_mesa AS ID, estado AS ESTADO, capacidad AS CAPACIDAD FROM mesa; ");
                    ConexionMaestra.cerrar();
                }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ConexionMaestra.abrir();

            // Obtén el valor seleccionado del estado
            string estado = DropDownListEstado.SelectedItem.Text;

            // Ejecuta el procedimiento almacenado con los valores seleccionados
            string consulta = "EXEC InsertarMesa @capacidad = " + txtCapacidad.Text + ", @estado = '" + estado + "'";
            ConexionMaestra.ejecuta(consulta);

            ConexionMaestra.leer.Close();
            ConexionMaestra.grid(GridViewMesa, "SELECT id_mesa AS ID, estado AS ESTADO, capacidad AS CAPACIDAD FROM mesa; ");
            ConexionMaestra.cerrar();
        }
    }
}
