using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Flashdrive.Datos;
namespace Flashdrive
{
    public partial class Encuesta : System.Web.UI.Page
    {
        clase_general encuesta = new clase_general();
        Formulario_Encuesta form_encuesta = new Formulario_Encuesta();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                form_encuesta.DeleteList();
                Session["indice"] = 0;
                Session["cod_pregunta"] = encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows[Convert.ToInt32(Session["indice"])]["cod_pregunta"].ToString();
            }
        }

        protected void lblPregunta_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                lblPregunta.Text = encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows[Convert.ToInt32(Session["indice"])]["descripcion"].ToString();
        }

        protected void rblRespuestas_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            encuesta.SetRadioButtonList(rblRespuestas, "consulta_respuestas", "descripcion", "cod_respuesta", new System.Data.SqlClient.SqlParameter("@cod_pregunta", Convert.ToInt32(encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows[Convert.ToInt32(Session["indice"])]["cod_pregunta"])));
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["indice"]) < encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows.Count)
            {
                form_encuesta.Add(new pregunta(Convert.ToInt32(Session["cod_pregunta"]), Convert.ToInt32(rblRespuestas.SelectedValue)));
                try
                {
                    Session["indice"] = (Convert.ToInt32(Session["indice"]) + 1).ToString();
                    Session["cod_pregunta"] = encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows[Convert.ToInt32(Session["indice"])]["cod_pregunta"].ToString();
                    lblPregunta.Text = encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows[Convert.ToInt32(Session["indice"])]["descripcion"].ToString();
                    encuesta.SetRadioButtonList(rblRespuestas, "consulta_respuestas", "descripcion", "cod_respuesta", new System.Data.SqlClient.SqlParameter("@cod_pregunta", Convert.ToInt32(encuesta.GetDataSet("consulta_preguntas").Tables[0].Rows[Convert.ToInt32(Session["indice"])]["cod_pregunta"])));
                }
                catch
                {
                    form_encuesta.Save();
                    form_encuesta.DeleteList();
                    Response.Redirect("Final.aspx");
                }
            }

        }
    }
}