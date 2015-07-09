using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Flashdrive.Datos
{
    public class Estadistica
    {
        public void Llenarddl(DropDownList ddl)

        { 
         foreach(int chartype in Enum.GetValues(typeof(SeriesChartType)))
         {
             ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType),chartype),Convert.ToString(chartype));
             ddl.Items.Add(li);
         }
        }

        public void Puntos(Chart ch, string campo,string tabla)
        {
            SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from "+tabla,conexion);
            conexion.Open();
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
                
                    ch.Series[0].Points.AddXY(read[campo],read["num_carreras"]);
            }
            read.Close();
            conexion.Close();
        }

        public SeriesChartType Seleccionar(DropDownList ddl)
        {
            return (SeriesChartType)Enum.Parse(typeof(SeriesChartType),ddl.SelectedValue);
        
        }
    
    }


}