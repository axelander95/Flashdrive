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
    public partial class Tipos_Unidades : System.Web.UI.Page
    {
        clase_general tipos = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (Session["modo"] == "N")
                tipos.ExecuteProcedure("insert_tipo", new System.Data.SqlClient.SqlParameter("@descripcion", txtDescripcion.Text));
            else if (Session["modo"] == "M")
                tipos.ExecuteProcedure("actualizar_tipos", Modify());
            else if (Session["modo"] == "E")
                tipos.ExecuteProcedure("eliminar_tipos", new SqlParameter("@cod_tipo", Convert.ToInt32(txtCodigo.Text)));
                Response.Redirect(Request.RawUrl);
        }
        protected SqlParameter[] Modify()
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@descripcion", txtDescripcion.Text);
            parametros[1] = new SqlParameter("@cod_tipo", Convert.ToInt32(txtCodigo.Text));
            return parametros;
        }
        protected void EnableControls(bool band, bool DeleteMode)
        {
            txtDescripcion.Enabled = band;
            btnLimpiar.Enabled = band;
            if (DeleteMode)
            {
                btnProcesar.Enabled = DeleteMode;
                btnCancelar.Enabled = DeleteMode;
            }
            else
            {
                btnProcesar.Enabled = band;
                btnCancelar.Enabled = band;
            }
        }
        protected void grvTipos_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                tipos.SetGridView(grvTipos, "consulta_tipo");
        }
        protected void Clean()
        {
            txtCodigo.Text = String.Empty;
            txtDescripcion.Text = String.Empty;
        }
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Clean(); 
            EnableControls(true, false);
            Session["modo"] = "N";
        }
        protected void FillControls(int index)
        {
            txtCodigo.Text = grvTipos.Rows[index].Cells[1].Text;
            txtDescripcion.Text = grvTipos.Rows[index].Cells[2].Text;
        }
        protected void grvTipos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            FillControls(Convert.ToInt32(e.CommandArgument));
            if (e.CommandName == "M")
            {
                Session["modo"] = "M";
                EnableControls(true, false);
            }
            else
            {
                Session["modo"] = "E";
                EnableControls(true, false);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlBusqueda.SelectedIndex == 0)
                    tipos.SetGridView(grvTipos, "consulta_cod_tipo", new SqlParameter("@cod_tipo", Convert.ToInt32(txtBusqueda.Text)));
                else
                    tipos.SetGridView(grvTipos, "consulta_descripcion_tipo", new SqlParameter("@descripcion", txtBusqueda.Text));
            }
            catch (Exception EX){

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clean();
            EnableControls(false, false);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Clean();
        }
    }
}