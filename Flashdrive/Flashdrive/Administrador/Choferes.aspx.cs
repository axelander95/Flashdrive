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
    public partial class Choferes : System.Web.UI.Page
    {
         clase_general choferes = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            Tablas.ReloadData();
        }
        protected void EnableControls(bool band, bool DeleteMode)
        {
            txtCedula.Enabled = band;
            txtEdad.Enabled = band;
            txtNombre.Enabled = band;
            ddlLicencia.Enabled = band;
            ddlServicio.Enabled = band;
            btnLimpiar.Enabled = band;
            rblSexo.Enabled = band;
            txtTelefono.Enabled = band;
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
            txtCedula.Text = String.Empty;
            txtEdad.Text = String.Empty;
            txtNombre.Text = String.Empty;
            ddlLicencia.SelectedIndex = 0;
            ddlServicio.SelectedIndex = -1;
            rblSexo.SelectedValue = "M";
            txtTelefono.Text = String.Empty;

        }
        protected void FillControls(int i)
        {
            txtCodigo.Text = GridView1.Rows[i].Cells[1].Text;
            txtNombre.Text = GridView1.Rows[i].Cells[2].Text;
            txtCedula.Text = GridView1.Rows[i].Cells[3].Text;
            rblSexo.SelectedValue = GridView1.Rows[i].Cells[4].Text;
            txtEdad.Text = GridView1.Rows[i].Cells[5].Text;
            txtTelefono.Text = GridView1.Rows[i].Cells[6].Text;
            ddlLicencia.Text = GridView1.Rows[i].Cells[7].Text;
            int n = 0;
            for (int j = 0; j < Tablas.servicios.Tables[0].Rows.Count; j++)
            {
                if (Convert.ToInt32(Tablas.servicios.Tables[0].Rows[j]["cod_servicio"]) == Convert.ToInt32(GridView1.Rows[i].Cells[8].Text))
                {
                    n = j;
                    break;
                }
            }
            ddlServicio.SelectedIndex = n;
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

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Clean();
            Session["modo"] = "N";
            EnableControls(true, false);
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
                Session["accion"] = "Ced";
            else if (ddlBusqueda.SelectedIndex == 2)
                Session["accion"] = "Nom";
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                choferes.SetGridView(GridView1, "consulta_choferes");
        }
        protected System.Data.SqlClient.SqlParameter[] GetParameters()
        {
            System.Data.SqlClient.SqlParameter[] parametros = new System.Data.SqlClient.SqlParameter[8];
            parametros[0] = new SqlParameter("@nombres", txtNombre.Text);
            parametros[1] = new SqlParameter("@cedula", txtCedula.Text);
            parametros[2] = new SqlParameter("@sexo", rblSexo.SelectedValue);
            parametros[3] = new SqlParameter("@edad", Convert.ToInt32(txtEdad.Text));
            parametros[4] = new SqlParameter("@telefono", txtTelefono.Text);
            parametros[5] = new SqlParameter("@licencia", ddlLicencia.Text);
            parametros[6] = new SqlParameter("@cod_servicio", Convert.ToInt32(Tablas.servicios.Tables[0].Rows[ddlServicio.SelectedIndex][0]));
            parametros[7] = new SqlParameter("@estado_carrera", "L");
            return parametros;
        }
        protected SqlParameter [] Modificar()
        {
            System.Data.SqlClient.SqlParameter[] parametros = new System.Data.SqlClient.SqlParameter[8];
            parametros[0] = new SqlParameter("@nombres", txtNombre.Text);
            parametros[1] = new SqlParameter("@cedula", txtCedula.Text);
            parametros[2] = new SqlParameter("@sexo", rblSexo.SelectedValue);
            parametros[3] = new SqlParameter("@edad", Convert.ToInt32(txtEdad.Text));
            parametros[4] = new SqlParameter("@telefono", txtTelefono.Text);
            parametros[5] = new SqlParameter("@licencia", ddlLicencia.Text);
            parametros[6] = new SqlParameter("@cod_servicio", Convert.ToInt32(Tablas.servicios.Tables[0].Rows[ddlServicio.SelectedIndex][0]));
            parametros[7] = new SqlParameter("@cod_chofer", Convert.ToInt32(txtCodigo.Text));
            return parametros;
        }
        protected System.Data.SqlClient.SqlParameter[] Delete()
        {
            System.Data.SqlClient.SqlParameter[] parametro = new System.Data.SqlClient.SqlParameter[1];
            parametro[0] = new System.Data.SqlClient.SqlParameter("@codigo", txtCodigo.Text);
            return parametro;     
        }
        protected void btnProcesar_Click1(object sender, EventArgs e)
        {
            if (Session["modo"] == "N")
                choferes.ExecuteProcedure("insert_choferes", GetParameters());
            else if (Session["modo"] == "M")
                choferes.ExecuteProcedure("actualizar_choferes", Modificar());
            else if (Session["modo"] == "E")
                choferes.ExecuteProcedure("eliminar_choferes", Delete());
                Response.Redirect(Request.RawUrl);
        }

        protected void ddlServicio_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                choferes.SetDropDownList(ddlServicio, "consulta_servicios", "descripcion");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlBusqueda.SelectedIndex == 0)
                    choferes.SetGridView(GridView1, "choferes_cod", new System.Data.SqlClient.SqlParameter("@cod_chofer", Convert.ToInt32(txtBusqueda.Text)));
                else
                    choferes.SetGridView(GridView1, "choferes_nombre", new System.Data.SqlClient.SqlParameter("@nombres", txtBusqueda.Text));
            }
            catch (Exception ex)
            {
                ex.GetType();
            }
        }


    }
}