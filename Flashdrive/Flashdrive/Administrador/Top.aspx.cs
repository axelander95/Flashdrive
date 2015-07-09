using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
namespace Flashdrive.Administrador
{
    public partial class Top : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTop_Click(object sender, EventArgs e)
        {
            clase_general top = new clase_general();
            top.SetGridView(grvServicios, "top5", new System.Data.SqlClient.SqlParameter("@tabla", "servicios"));
            top.SetGridView(grvUnidades, "top5", new System.Data.SqlClient.SqlParameter("@tabla", "unidades"));
            top.SetGridView(grvChoferes, "top5", new System.Data.SqlClient.SqlParameter("@tabla", "choferes"));
            top.SetGridView(grvSectores, "top5", new System.Data.SqlClient.SqlParameter("@tabla", "sectores"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            clase_general top = new clase_general();
            top.SetGridView(grvServicios, "consulta_servicios");
            top.SetGridView(grvUnidades, "consulta_unidades");
            top.SetGridView(grvChoferes, "consulta_choferes");
            top.SetGridView(grvSectores, "consulta_sectores");
        }
    }
}