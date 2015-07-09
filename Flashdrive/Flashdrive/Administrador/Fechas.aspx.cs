using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
using System.Data.SqlClient;
namespace Flashdrive.Administrador
{
    public partial class Fechas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            SqlParameter[] datos = new SqlParameter[2];
            datos[0] = new SqlParameter("@desde", desde.SelectedDate.ToShortDateString());
            datos[1] = new SqlParameter("@hasta", hasta.SelectedDate.ToShortDateString());
            grvConsulta.DataSource = new clase_general().GetDataSet("consulta_fechas", datos);
            grvConsulta.DataBind();
        }

        protected void desde_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                desde.SelectedDate = desde.TodaysDate;
        }

        protected void hasta_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                hasta.SelectedDate = hasta.TodaysDate;
        }
    }
}