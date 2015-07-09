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
    public partial class Unidades : System.Web.UI.Page
    {
        clase_general unidades = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Tablas.ReloadData();
        }
        protected void ddlBusqueda_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ddlBusqueda.SelectedIndex = 0;
        }
        protected void EnableControls(bool band, bool DeleteMode)
        {
            txtPlaca.Enabled = band;
            txtMarca.Enabled = band;
            txtModelo.Enabled = band;
            txtColor.Enabled = band;
            txtAño.Enabled = band;
            ddlTipo.Enabled = band;
            btnLimpiar.Enabled = band;
            if (!DeleteMode)
            {
                btnCancelar.Enabled = band;
                btnProcesar.Enabled = band;
            }
            else
            {
                btnCancelar.Enabled = DeleteMode;
                btnProcesar.Enabled = DeleteMode;
            }
        }
        protected void Clean()
        {
            txtCodigo.Text = String.Empty;
            txtPlaca.Text = String.Empty;
            txtMarca.Text = String.Empty;
            txtModelo.Text = String.Empty;
            txtColor.Text = String.Empty;
            txtAño.Text = String.Empty;
            ddlTipo.SelectedIndex = -1;

        }
        protected void FillControls(int i)
        {
            txtCodigo.Text = GridView1.Rows[i].Cells[1].Text;
            int n = 0;
            for (int j = 0; j < Tablas.tipos_unidades.Tables[0].Rows.Count; j++)
            {
                if (Convert.ToInt32(Tablas.tipos_unidades.Tables[0].Rows[j]["cod_tipo"]) == Convert.ToInt32(GridView1.Rows[i].Cells[2].Text))
                {
                    n = j;
                    break;
                }
            }
            ddlTipo.SelectedIndex = n;
            txtPlaca.Text = GridView1.Rows[i].Cells[4].Text;
            txtMarca.Text = GridView1.Rows[i].Cells[5].Text;
            txtModelo.Text = GridView1.Rows[i].Cells[6].Text;
            txtColor.Text = GridView1.Rows[i].Cells[7].Text;
            txtAño.Text = GridView1.Rows[i].Cells[8].Text;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            FillControls(Convert.ToInt32(e.CommandArgument));
            if (e.CommandName == "M")
            {
                Session["modo"] = "M";
                EnableControls(true, false);
            }
            if (e.CommandName == "E")
            {
                Session["modo"] = "E";
                EnableControls(false, true);
            }

        }

        protected SqlParameter[] Insert()
        {
            SqlParameter[] parametros = new SqlParameter[7];
            parametros[0] = new SqlParameter("@cod_tipo", Convert.ToInt32(Tablas.tipos_unidades.Tables[0].Rows[ddlTipo.SelectedIndex][0]));
            parametros[1] = new SqlParameter("@placa", txtPlaca.Text);
            parametros[2] = new SqlParameter("@marca", txtMarca.Text);
            parametros[3] = new SqlParameter("@modelo", txtModelo.Text);
            parametros[4] = new SqlParameter("@color", txtColor.Text);
            parametros[5] = new SqlParameter("@año", txtAño.Text);
            parametros[6] = new SqlParameter("@estado_carrera", "L");
            return parametros;
        }
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            EnableControls(true, false);
            Clean();
            Session["modo"] = "N";
        }
        protected SqlParameter[] Modify()
        {
            SqlParameter[] parametros = new SqlParameter[7];
            parametros[0] = new SqlParameter("@cod_tipo", Convert.ToInt32(Tablas.tipos_unidades.Tables[0].Rows[ddlTipo.SelectedIndex][0]));
            parametros[1] = new SqlParameter("@placa", txtPlaca.Text);
            parametros[2] = new SqlParameter("@marca", txtMarca.Text);
            parametros[3] = new SqlParameter("@modelo", txtModelo.Text);
            parametros[4] = new SqlParameter("@color", txtColor.Text);
            parametros[5] = new SqlParameter("@año", txtAño.Text);
            parametros[6] = new SqlParameter("@cod_unidad", txtCodigo.Text);
            return parametros;
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (Session["modo"] == "N")
                unidades.ExecuteProcedure("insert_unidades", Insert());
            else if (Session["modo"] == "M")
                unidades.ExecuteProcedure("actualizar_unidades", Modify());
            else if (Session["modo"] == "E")
                unidades.ExecuteProcedure("eliminar_unidades", new SqlParameter("@codigo", txtCodigo.Text));
                Response.Redirect(Request.RawUrl);
        }

        protected void ddlTipo_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            unidades.SetDropDownList(ddlTipo, "consulta_tipo", "descripcion");
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                unidades.SetGridView(GridView1, "consulta_unidades");
        }
        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlBusqueda.SelectedIndex == 0)
                    unidades.SetGridView(GridView1, "consulta_unidad_codigo", new SqlParameter("@codigo", Convert.ToInt32(txtBusqueda.Text)));
                else if (ddlBusqueda.SelectedIndex == 1)
                    unidades.SetGridView(GridView1, "consulta_color_unidad", new SqlParameter("@color", txtBusqueda.Text));
                else if (ddlBusqueda.SelectedIndex == 2)
                    unidades.SetGridView(GridView1, "consulta_placa_unidad", new SqlParameter("@placa", txtBusqueda.Text));

            }
            catch (Exception ex)
            {
            }
        }
    }
}