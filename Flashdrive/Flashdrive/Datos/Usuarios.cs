using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace Flashdrive.Datos
{
    public static class Usuarios
    {
        public static bool admin = false, online = false;
        public static string user = String.Empty, nombres = String.Empty;
        public static DataSet users;
        public static int cod_usuario=0;
        public static bool Login(string user, string password)
        {
            users = new clase_general().GetDataSet("login_usuario", Usuarios.Parámetros(user, password));
            if (users.Tables[0].Rows.Count == 0)
                online = false;
            else
            {
                Usuarios.nombres = Convert.ToString(users.Tables[0].Rows[0]["nombres"]);
                Usuarios.user = user;
                online = true;
                Usuarios.cod_usuario = Convert.ToInt32(users.Tables[0].Rows[0]["cod_usuario"]);
                if (Convert.ToString(users.Tables[0].Rows[0]["estado"]) == "E")
                    admin = true;
            }
            return online;
        }
        public static SqlParameter [] Parámetros (string user, string password)
        {
            SqlParameter [] datos = new SqlParameter[2];
            datos[0] = new SqlParameter("@usuario", user);
            datos[1] = new SqlParameter("@contraseña", password);
            return datos;
        }
        public static void Logout()
        {
            admin = false;
            online = false;
            user = String.Empty;
        }
    }
}