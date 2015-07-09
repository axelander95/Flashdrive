using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flashdrive.Administrador
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnServicios_Click(object sender, EventArgs e)
        {
            Response.Redirect("Servicios.aspx");
        }

        protected void btnControl_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comentarios.aspx");
        }

        protected void btnChoferes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Choferes.aspx");
        }

        protected void btnUnidades_Click(object sender, EventArgs e)
        {
            Response.Redirect("Unidades.aspx");
        }

        protected void btnTipos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tipos_Unidades.aspx");
        }

        protected void btnSectores_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sector.aspx");
        }

        protected void btnCarreras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carreras.aspx");
        }

        protected void btnPrecios_Click(object sender, EventArgs e)
        {
            Response.Redirect("SectoresEspecíficos.aspx");
        }

        protected void btnEstadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiciosCarrera.aspx");
        }
    }
}