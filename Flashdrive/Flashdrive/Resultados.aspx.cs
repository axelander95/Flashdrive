using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
namespace Flashdrive
{
    public partial class Resultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlPreguntas_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                new clase_general().SetDropDownList(ddlPreguntas, "consulta_preguntas", "descripcion", "cod_pregunta");  
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            new clase_general().SetGridView(GridView1, "consulta_respuestas", new System.Data.SqlClient.SqlParameter("@cod_pregunta", Convert.ToInt32(ddlPreguntas.SelectedValue)));
        }
    }
}