using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
using System.Data.SqlClient;
using System.Security;
using System.Configuration;
using System.Data;
using System.Web.Security;
namespace Flashdrive.Accounts
{
    public partial class IniciarSesión : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
                Response.Redirect("~/Default.aspx");
        }
        protected SqlParameter[] Users()
        {
            SqlParameter[] datos = new SqlParameter[2];
            datos[0] = new SqlParameter("@user", Login1.UserName);
            datos[1] = new SqlParameter("@contraseña", Login1.Password);
            return datos;
        }
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (new clase_general().GetDataSet("login_user", Users()).Tables[0].Rows.Count == 0)
                Login1.FailureText = "Usuario y/o contraseña incorrectos.";
            else
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
        }
    }
}