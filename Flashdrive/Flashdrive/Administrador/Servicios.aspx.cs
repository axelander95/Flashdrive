using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Flashdrive.Datos;
namespace Flashdrive.Administrador
{
    public partial class Servicios : System.Web.UI.Page
    {
        clase_general servicios = new clase_general();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected SqlParameter [] Guardar()
        {
            SqlParameter [] datos = new SqlParameter[2];
            datos[0] = new SqlParameter("@descripcion", txtNombre.Text);
            datos[1] = new SqlParameter("@precio", Decimal.Round(Convert.ToDecimal(txtPrecio.Text)));
            return datos;
        }
        protected SqlParameter[] Modificar()
        {
            SqlParameter[] datos = new SqlParameter[3];
            datos[0] = new SqlParameter("@codigo", Convert.ToInt32(txtCodigo.Text));
            datos[1] = new SqlParameter("@descripcion", txtNombre.Text);
            datos[2] = new SqlParameter("@precio", Decimal.Round(Convert.ToDecimal(txtPrecio.Text)));
            return datos;
        }
        protected void EnableControls(bool band, bool delete)
        {
            txtNombre.Enabled = band;
            txtPrecio.Enabled = band;
            btnLimpiar.Enabled = band;
            if (delete)
            {
                btnProcesar.Enabled = delete;
                btnCancelar.Enabled = delete;
            }
            else
            {
                btnProcesar.Enabled = band;
                btnCancelar.Enabled = band;
            }
        }
        protected void Clean()
        {
            txtCodigo.Text = String.Empty;
            txtNombre.Text = String.Empty;
            txtPrecio.Text = String.Empty;
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (Session["modo"] == "N")
                servicios.ExecuteProcedure("insert_servicios", Guardar());
            else if (Session["modo"] == "E")
                servicios.ExecuteProcedure("eliminar_servicios", Delete());
            else if (Session["modo"] == "M")
                servicios.ExecuteProcedure("actualizar_servicios", Modificar());
            Response.Redirect(Request.RawUrl);
        }
        protected SqlParameter[] Delete()
        {
            SqlParameter[] codigo = new SqlParameter[1];
            codigo[0] = new SqlParameter("@cod_servicio", Convert.ToInt32(txtCodigo.Text));
            return codigo;
        }
        protected void grvServicios_Load(object sender, EventArgs e)
        {
            servicios.SetGridView(grvServicios, "consulta_servicios");
        }

        protected void fuldFoto_Load(object sender, EventArgs e)
        {
        }
        protected void FillControls(int i)
        {
            txtCodigo.Text = grvServicios.Rows[i].Cells[1].Text;
            txtNombre.Text = grvServicios.Rows[i].Cells[2].Text;
            txtPrecio.Text = grvServicios.Rows[i].Cells[3].Text;
        }
        protected void grvServicios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            FillControls(Convert.ToInt32(e.CommandArgument));
            if (e.CommandName == "M")
            {
                EnableControls(true, false);
                Session["modo"] = "M";
            }
            if (e.CommandName == "E")
            {
                EnableControls(false, true);
                Session["modo"] = "E";
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Session["modo"] = "N";
            EnableControls(true, false);
            Clean();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clean();
            EnableControls(false, false);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlBusqueda.SelectedIndex == 0)
                    servicios.SetGridView(grvServicios, "consulta_cod_servicio", new SqlParameter("@cod_servicio", Convert.ToInt32(txtConsulta.Text)));
                else
                    servicios.SetGridView(grvServicios, "consulta_descripcion_servicio", new SqlParameter("@descripcion", txtConsulta.Text));
            }
            catch (Exception EX)
            {
                
            }
        }

        protected void ddlBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Clean();
        }
    }
}