using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
namespace Flashdrive.Administrador
{
    public partial class ServiciosCarrera : System.Web.UI.Page
    {
        clase_general servicios_carrera = new clase_general();
        Estadistica estadistica = new Estadistica();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                estadistica.Llenarddl(ddl_serxcarrera);
                ddl_serxcarrera.SelectedValue = "10";
            }
            estadistica.Puntos(Chart1,"nombres","choferes");
            estadistica.Puntos(Chart2,"descripcion","sectores");
            estadistica.Puntos(Chart3,"descripcion","servicios");
            estadistica.Puntos(Chart4,"modelo","unidades");
           

        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            servicios_carrera.SetGridView(GridView1, "consulta_ranking");
        }

        protected void ddl_serxcarrera_SelectedIndexChanged(object sender, EventArgs e)
        {
            Chart1.Series[0].ChartType = estadistica.Seleccionar(ddl_serxcarrera);
            Chart2.Series[0].ChartType = estadistica.Seleccionar(ddl_serxcarrera);
            Chart3.Series[0].ChartType = estadistica.Seleccionar(ddl_serxcarrera);
            Chart4.Series[0].ChartType = estadistica.Seleccionar(ddl_serxcarrera);
        }


    }
}