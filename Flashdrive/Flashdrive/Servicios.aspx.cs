using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flashdrive.Capa_de_usuario
{
    public partial class servicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSolicitar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Solicitar.aspx");
        }
    }
}