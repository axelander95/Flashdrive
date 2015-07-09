using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Flashdrive.Datos;
using System.Data;
namespace MyGps
{
    public partial class MyGps2 : System.Web.UI.Page
    {
        clase_general solicitud = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                Tablas.ReloadData();

                if (!Page.IsPostBack)
                {
                    Tablas.ReloadData();
                    lbl.Visible = false;
                    calendar.Visible = false;
                    Reloj.Visible = false;
                    Reloj.Text = DateTime.Now.Hour.ToString();
                    Minuto.Visible = false;
                    Minuto.Text = DateTime.Now.Minute.ToString();

                    solicitud.SetDropDownList(ddlservicio, "consulta_servicios", "descripcion");
                    solicitud.SetDropDownList(ddlsectorini, "consulta_sectores", "descripcion");
                    solicitud.SetDropDownList(ddlsectorfin, "consulta_sectores", "descripcion");
                }
                else
                {
                    
                }
            }
            else
                Response.Redirect("~/Accounts/IniciarSesión.aspx");
        }

        protected void rblreservacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblreservacion.SelectedValue == "Si")
            {

                calendar.Visible = true;
                Reloj.Visible = true;
                Reloj.Text = DateTime.Now.Hour.ToString();
                Minuto.Visible = true;
                Minuto.Text = ((DateTime.Now.Minute < 10) ? "0" + DateTime.Now.Minute.ToString() : DateTime.Now.Minute.ToString());
                lblcalendar.Visible = true;
                lbl.Visible = true;
                lblrelojno.Visible = false;


            }
            else
            {
                calendar.Visible = false;
                Reloj.Visible = false;
                Minuto.Visible = false;
                lbl.Visible = false;
                lblrelojno.Visible = true;
                lblrelojno.Text = DateTime.Now.Hour.ToString() + ":" + ((DateTime.Now.Minute < 10) ? "0" + DateTime.Now.Minute.ToString() : DateTime.Now.Minute.ToString());
                lblcalendar.Text = DateTime.Now.ToShortDateString();
            }


        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            string reloj = "", estado = "";
            if (rblreservacion.SelectedValue == "Si")
            {
                reloj = Reloj.Text + ":" + Minuto.Text;
                estado = "R";
            }
            else
            {
                reloj = lblrelojno.Text;
                estado = "A";
            }

        }

        protected void btnlimpiar_Click(object sender, EventArgs e)
        {

            ddlsectorfin.ClearSelection();
            ddlsectorini.ClearSelection();
            ddlservicio.ClearSelection();

            rblreservacion.ClearSelection();
            
            calendar.Visible = false;
            Reloj.Visible = false;
            Minuto.Visible = false;
            txtresultado.Text = String.Empty;
        }

        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            lblcalendar.Text = calendar.SelectedDate.ToShortDateString();

        }


        protected void calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void lblusuario_Load(object sender, EventArgs e)
        {
            txtUsuario.Text = Page.User.Identity.Name;
        }

        protected void lblsub_Load(object sender, EventArgs e)
        {
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Servicios.aspx");
        }
        protected void UpdateServicios()
        {
            int num = Convert.ToInt32(Tablas.servicios.Tables[0].Rows[ddlservicio.SelectedIndex]["num_carreras"]) + 1;
            SqlParameter[] datos = new SqlParameter[4];
            datos[0] = new SqlParameter("@tabla", "servicios");
            datos[1] = new SqlParameter("@num_carreras", num);
            datos[2] = new SqlParameter("@column_name", "cod_servicio");
            datos[3] = new SqlParameter("@cod", Convert.ToInt32(Tablas.servicios.Tables[0].Rows[ddlservicio.SelectedIndex]["cod_servicio"]));
            new clase_general().ExecuteProcedure("actualizar_num_carreras", datos);
        }
        protected void UpdateSectores()
        {
            int num = Convert.ToInt32(Tablas.sectores.Tables[0].Rows[ddlsectorfin.SelectedIndex]["num_carreras"]) + 1;
            SqlParameter[] datos = new SqlParameter[4];
            datos[0] = new SqlParameter("@tabla", "sectores");
            datos[1] = new SqlParameter("@num_carreras", num);
            datos[2] = new SqlParameter("@column_name", "cod_sector");
            datos[3] = new SqlParameter("@cod", Convert.ToInt32(Tablas.sectores.Tables[0].Rows[ddlsectorfin.SelectedIndex]["cod_sector"]));
            new clase_general().ExecuteProcedure("actualizar_num_carreras", datos);

        }
        protected void btnasignar_Click(object sender, EventArgs e)
        {
            SqlParameter[] datos = new SqlParameter [11];
            datos[0] = new SqlParameter("@cod_servicio",Tablas.servicios.Tables[0].Rows[ddlservicio.SelectedIndex]["cod_servicio"]);
            datos[1] = new SqlParameter("@cod_ini", Tablas.sectores.Tables[0].Rows[ddlsectorini.SelectedIndex]["cod_sector"]);
            datos[2] = new SqlParameter("@cod_fin", Tablas.sectores.Tables[0].Rows[ddlsectorfin.SelectedIndex]["cod_sector"]);
            datos[3] = new SqlParameter("@inicio", start.Value);
            datos[4] = new SqlParameter("@fin", end.Value);
            datos[5] = new SqlParameter("@detalle", txtDireccion.Text);
            datos[6] = new SqlParameter("@fecha", lblcalendar.Text);
            datos[7] = new SqlParameter("@subtotal", Convert.ToDecimal(txtresultado.Text));
            datos[8] = new SqlParameter("@total", Convert.ToDecimal(txtresultado.Text) + Convert.ToDecimal(1.5));
            datos[9] = new SqlParameter("@usuario", txtUsuario.Text);
            datos[10] = new SqlParameter("@hora", Reloj.Text + ":" + Minuto.Text);
            new clase_general().ExecuteProcedure("insert_carrera", datos);
            UpdateServicios();
            UpdateSectores();
            Response.Redirect("Home.aspx");
        }

        protected void txtDesde_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            decimal servicio, kilometraje = 0;
            if (txtKm.Value != String.Empty)
                kilometraje = Decimal.Round(Convert.ToDecimal(txtKm.Value) * Convert.ToDecimal(0.25));
            servicio = Convert.ToDecimal(Tablas.servicios.Tables[0].Rows[ddlservicio.SelectedIndex]["precio"]);
            txtresultado.Text = Convert.ToString(servicio + kilometraje);
        }
    }
}