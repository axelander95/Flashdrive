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
    public partial class Carreras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grvUnidades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "S")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                txtUnidad.Text = grvUnidades.Rows[row].Cells[0].Text;
                txtPlaca.Text = grvUnidades.Rows[row].Cells[1].Text;
                txtColor.Text = grvUnidades.Rows[row].Cells[2].Text;
                txtCodigoChofer.Text = grvUnidades.Rows[row].Cells[3].Text;
                txtChofer.Text = grvUnidades.Rows[row].Cells[4].Text;
            }
        }

        protected void grvCarreras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "S")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                txtCarrera.Text = grvCarreras.Rows[row].Cells[0].Text;
                txtUsuario.Text = grvCarreras.Rows[row].Cells[1].Text;
                txtFecha.Text = grvCarreras.Rows[row].Cells[2].Text;
                txtSector.Text = grvCarreras.Rows[row].Cells[3].Text;
                txtHora.Text = grvCarreras.Rows[row].Cells[4].Text;
            }
        }

        protected void grvCarreras_Load(object sender, EventArgs e)
        {
            new clase_general().SetGridView(grvCarreras, "carreras_pendientes");
        }

        protected void grvUnidades_Load(object sender, EventArgs e)
        {
            new clase_general().SetGridView(grvUnidades, "unidades_libres");
        }
        protected void Update(string tabla, int num, string columna, int codigo)
        {
            SqlParameter[] datos = new SqlParameter[4];
            datos[0] = new SqlParameter("@tabla", tabla);
            datos[1] = new SqlParameter("@num_carreras", num);
            datos[2] = new SqlParameter("@column", columna);
            datos[3] = new SqlParameter("@codigo", codigo);
            new clase_general().ExecuteProcedure("actualizar_estado_carrera", datos);
        }
        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            SqlParameter [] datos = new SqlParameter[3];
            datos[0] = new SqlParameter("@codunidad", Convert.ToInt32(txtUnidad.Text));
            datos[1] = new SqlParameter("@codchofer", Convert.ToInt32(txtCodigoChofer.Text));
            datos[2] = new SqlParameter("@codcarrera", Convert.ToInt32(txtCarrera.Text));
            new clase_general().ExecuteProcedure("actualizar_carreras", datos);
            int unidades = Convert.ToInt32(new clase_general().GetDataSet("consulta_unidad_codigo",new SqlParameter("@codigo", Convert.ToInt32(txtUnidad.Text))).Tables[0].Rows[0]["num_carreras"]);
            int choferes = Convert.ToInt32(new clase_general().GetDataSet("choferes_cod", new SqlParameter("@cod_chofer", Convert.ToInt32(txtCodigoChofer.Text))).Tables[0].Rows[0]["num_carreras"]);
            Update("unidades", unidades, "cod_unidad", Convert.ToInt32(txtUnidad.Text));
            Update("choferes", choferes, "cod_chofer", Convert.ToInt32(txtCodigoChofer.Text));
            string correo = new clase_general().GetDataSet("consulta_usuarios_especifica", new SqlParameter("@user", txtUsuario.Text)).Tables[0].Rows[0]["correo"].ToString();
            new Mail("flashdrive_taxis@outlook.com", "Emelec123").SendMail(correo, "Asignación de carrera", "Estimado usuario "+ txtUsuario.Text +", su carrera ha sido receptada y habilitada por Flashdrive. Nombre de chofer: "+ txtChofer.Text + " Placa de unidad: "+ txtPlaca.Text + " Color: "+ txtColor.Text +" Atentamente: Flashdrive.");
            Response.Redirect(Request.RawUrl);
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            string vtn = "window.open('http://fixposit.com/map','Dates','scrollbars=yes,resizable=yes','height=300', 'width=300')";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", vtn, true);
        }
    }
}