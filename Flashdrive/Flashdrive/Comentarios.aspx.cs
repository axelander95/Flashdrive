using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Flashdrive.Datos;
namespace Flashdrive.Capa_de_usuario
{
    public partial class Comentarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
                Response.Redirect("~/Accounts/IniciarSesión.aspx");
        }
        protected SqlParameter [] Enviar()
        {
            SqlParameter[] datos = new SqlParameter[2];
            datos[0] = new SqlParameter("@usuario", txtUsuario.Text);
            datos[1] = new SqlParameter("@mensaje", txtMensaje.Text);
            return datos;
        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            new clase_general().ExecuteProcedure("insert_comentarios", Enviar());
            txtMensaje.Text = String.Empty;
            txtUsuario.Text = String.Empty;
        }

        protected void txtUsuario_Load(object sender, EventArgs e)
        {
            txtUsuario.Text = Page.User.Identity.Name;
        }
    }
}