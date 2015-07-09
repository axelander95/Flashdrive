using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
namespace Flashdrive.Administrador
{
    public partial class Comentarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ddlBusqueda_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ddlBusqueda.SelectedIndex = -1;
        }

        protected void ddlBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBusqueda.SelectedIndex == 0)
                Session["accion"] = "Cod";
            else if (ddlBusqueda.SelectedIndex == 1)
                Session["accion"] = "C";
            else if (ddlBusqueda.SelectedIndex == 2)
                Session["accion"] = "U";
        }
        protected void FillControls(int i)
        {
            txtCodigo.Text = grvComentarios.Rows[i].Cells[1].Text;
            lblUsuario.Text = grvComentarios.Rows[i].Cells[2].Text;
            lblMensaje.Text = grvComentarios.Rows[i].Cells[3].Text;
            ddlVisibilidad.SelectedValue = grvComentarios.Rows[i].Cells[4].Text;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            FillControls(Convert.ToInt32(e.CommandArgument));
            if (e.CommandName == "V")
                EnableControls(true);
        }
        protected void EnableControls(bool band)
        {
            ddlVisibilidad.Enabled = band;
            btnCancelar.Enabled = band;
            btnProcesar.Enabled = band;
        }
        protected void Clean()
        {
            txtCodigo.Text = String.Empty;
            ddlVisibilidad.SelectedIndex = 0;
        }

        protected void grvComentarios_Load(object sender, EventArgs e)
        {
            new clase_general().SetGridView(grvComentarios, "consulta_comentarios_admin");
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlParameter [] parametros = new System.Data.SqlClient.SqlParameter[2];
            parametros[0] = new System.Data.SqlClient.SqlParameter("@visibilidad", ddlVisibilidad.SelectedValue);
            parametros[1] = new System.Data.SqlClient.SqlParameter("@cod_comentario", Convert.ToInt32(txtCodigo.Text));
            new clase_general().ExecuteProcedure("actualizar_comentarios", parametros);
            Response.Redirect(Request.RawUrl);
        }
    }
}