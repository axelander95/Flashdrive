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
    public partial class SectoresEspecíficos : System.Web.UI.Page
    {
        clase_general precios = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Tablas.ReloadData();
        }
        protected void Clean()
        {
            txtPrecio.Text = String.Empty;
            txtCodigo.Text = String.Empty;
        }
        protected void EnableControls(bool band, bool DeleteMode)
        {
            txtPrecio.Enabled = band;
            ddlInicio.Enabled = band;
            ddlFin.Enabled = band;
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
        protected void ddlInicio_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                precios.SetDropDownList(ddlInicio, "consulta_sectores", "descripcion");
        }

        protected void ddlFin_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                precios.SetDropDownList(ddlFin, "consulta_sectores", "descripcion");
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Clean();
            EnableControls(true, false);
            Session["modo"] = "N";
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
        public void FillControls(int i)
        {
            txtCodigo.Text = GridView1.Rows[i].Cells[1].Text;
            txtPrecio.Text = GridView1.Rows[i].Cells[4].Text;
            ddlInicio.SelectedIndex = Tablas.GetCode(Tablas.sectores, Convert.ToInt32(GridView1.Rows[i].Cells[2].Text), "cod_sector");
            ddlFin.SelectedIndex = Tablas.GetCode(Tablas.sectores, Convert.ToInt32(GridView1.Rows[i].Cells[3].Text), "cod_sector");
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
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
        protected SqlParameter[] Nuevo()
        {
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("@cod_sector_inicio", Convert.ToInt32(Tablas.sectores.Tables[0].Rows[ddlInicio.SelectedIndex]["cod_sector"]));
            parametros[1] = new SqlParameter("@cod_sector_fin", Convert.ToInt32(Tablas.sectores.Tables[0].Rows[ddlFin.SelectedIndex]["cod_sector"]));
            parametros[2] = new SqlParameter("@precio", Decimal.Round(Convert.ToDecimal(txtPrecio.Text), 2));
            return parametros;
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (Session["modo"] == "N")
                precios.ExecuteProcedure("insert_precios", Nuevo());
            Response.Redirect(Request.RawUrl);
 
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                precios.SetGridView(GridView1, "consulta_precios");
        }

        protected void GridView2_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            precios.SetGridView(GridView2, "consulta_sectores");
        }
    }
}