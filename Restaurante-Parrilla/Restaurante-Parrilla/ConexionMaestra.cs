using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Restaurante_Parrilla
{
    public class ConexionMaestra
    {

        public static string conexion =
           @"Data Source=DESKTOP-VM0RGNV;
            Initial Catalog=db_restaurante;
            User Id=sa;
            Password = Salinas;";
        public static SqlConnection conectar = new SqlConnection(conexion);
        public static SqlCommand consulta;
        public static SqlDataReader leer;
        DataSet cuadricula = new DataSet();
        public static void abrir()
        {
            if (conectar.State == ConnectionState.Closed)
            {
                conectar.Open();
                consulta = new SqlCommand();
                consulta.Connection = conectar;
                //MessageBox.Show("Conexion exitosa");
            }
        }
        public static void cerrar()
        {
            if (conectar.State == ConnectionState.Open)
            {
                conectar.Close();

            }
        }
        public static void ejecuta(string strSQL)
        {
            // cmd.CommandType = System.Data.CommandType.Text;
            //consulta  = new SqlCommand(strSQL, conexion);
            consulta.CommandType = System.Data.CommandType.Text;
            consulta.CommandText = strSQL;
            leer = consulta.ExecuteReader();
        }


        public static void grid(GridView tabla, String sql)
        {
            ejecuta(sql);
            leer.Close();
            DataSet cuadricula = new DataSet();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta);
            adaptador.Fill(cuadricula, "datos");
            tabla.DataSource = cuadricula;
            tabla.DataMember = "datos";
            cuadricula.AcceptChanges();
            tabla.DataBind();
        }

        public static void combo(DropDownList dropDown, string sql)
        {
            ejecuta(sql);
            dropDown.Items.Clear();
            while (leer.Read())
            {
                dropDown.Items.Add(leer[0].ToString());
            }
            leer.Close();
        }
    }
}