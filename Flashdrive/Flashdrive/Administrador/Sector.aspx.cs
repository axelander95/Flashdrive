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
    public partial class Sector : System.Web.UI.Page
    {
        clase_general sectores = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void grvSectores_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                sectores.SetGridView(grvSectores, "consulta_sectores");
        }
        protected void Clean()
        {
            txtCodigo.Text = String.Empty;
            txtDescripcion.Text = String.Empty;
        }
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Session["modo"] = "N";
            EnableControls(true, false);
            Clean();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Clean();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clean();
            EnableControls(false, false);
        }
        protected void FillControls(int i)
        {
            txtCodigo.Text = grvSectores.Rows[i].Cells[1].Text;
            txtDescripcion.Text = grvSectores.Rows[i].Cells[2].Text;
        }
        protected void grvSectores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            FillControls(Convert.ToInt32(e.CommandArgument));
            if (e.CommandName == "M")
            {
                Session["modo"] = "M";
                EnableControls(true, false);
            }
            else if (e.CommandName == "E")
            {
                Session["modo"] = "E";
                EnableControls(false, true);
            }
        }
        protected SqlParameter[] Modify()
        {
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = new SqlParameter("@descripcion", txtDescripcion.Text);
            parametros[1] = new SqlParameter("@cod_sector", Convert.ToInt32(txtCodigo.Text));
            return parametros;
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (Session["modo"] == "N")
                sectores.ExecuteProcedure("insert_sectores", new SqlParameter("@descripcion", txtDescripcion.Text));
            else if (Session["modo"] == "E")
                sectores.ExecuteProcedure("eliminar_sectores", new SqlParameter("@cod_sector", Convert.ToInt32(txtCodigo.Text)));
            else if (Session["modo"] == "M")
                sectores.ExecuteProcedure("actualizar_sectores", Modify());
                Response.Redirect(Request.RawUrl);

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (ddlBusqueda.SelectedIndex == 0)
                sectores.SetGridView(grvSectores, "consulta_cod_sector", new SqlParameter("@cod_sector", Convert.ToInt32(txtBusqueda.Text)));
            else
                sectores.SetGridView(grvSectores, "consulta_descripcion_sector", new SqlParameter("@descripcion", txtBusqueda.Text));
        }
    }
}