using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Flashdrive.Datos;
using System.Configuration;
using System.Data;
using System.Security;
namespace Flashdrive.Accounts
{
    public partial class Registro : System.Web.UI.Page
    {
        clase_general usuarios = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
                Response.Redirect("~/Default.aspx");
        }
        protected SqlParameter[] Parametros()
        {
            SqlParameter[] datos = new SqlParameter[4];
            datos[0] = new SqlParameter("@nombres", txtNombres.Text);
            datos[1] = new SqlParameter("@usuario", txtUsuario.Text);
            datos[2] = new SqlParameter("@correo", txtCorreo.Text);
            datos[3] = new SqlParameter("@contraseña", txtContraseña1.Text);
            return datos;
        }
        protected void btnResgistro_Click(object sender, EventArgs e)
        {
            usuarios.ExecuteProcedure("registrar_usuario", Parametros());
            new Mail("flashdrive_taxis@outlook.com", "Emelec123").SendMail(txtCorreo.Text, "Registro de tu cuenta Flashdrive", "¡Felicidades! Te has unido a Flashdrive, contrata un taxi de nuestra compañía y descubre el verdadero servicio de transporte a domicilio. Att: Flashdrive");
            Response.Redirect("~/Accounts/IniciarSesión.aspx");
        }
    }
}