using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Flashdrive.Datos;
namespace Flashdrive
{
    public class Formulario_Encuesta
    {
        public  clase_general encuesta = new clase_general();
        public  pregunta head = null, top = null;
        public  void Add(pregunta nuevo)
        {
            if (head == null)
                head = top = nuevo;
            else
            {
                top.siguiente = nuevo;
                nuevo.anterior = top;
                top = nuevo;
            }
        }
        public void Save()
        {
            if (head != null)
            {
                pregunta aux = head;
                while (aux != null)
                {
                    SqlParameter[] datos = new SqlParameter[2];
                    datos[0] = new SqlParameter("@cod_pregunta", aux.cod_pregunta);
                    datos[1] = new SqlParameter("@cod_respuesta", aux.cod_respuesta);
                    int num = Convert.ToInt32(encuesta.GetDataSet("select_respuestas", new SqlParameter("@cod_respuesta", aux.cod_respuesta)).Tables[0].Rows[0]["num_respuestas"]) + 1;
                    SqlParameter[] parametros = new SqlParameter[2];
                    parametros[1] = new SqlParameter("@cod_respuesta", aux.cod_respuesta);
                    parametros[0] = new SqlParameter("@num_respuestas", num);
                    encuesta.ExecuteProcedure("actualizar_respuestas", parametros);
                    encuesta.ExecuteProcedure("insert_resultados", datos);
                    aux = aux.siguiente;
                }
            }
        }
        public void DeleteList (){
            head = top = null;
        }
    }
    public class pregunta
    {
        public pregunta anterior, siguiente;
        public int cod_pregunta, cod_respuesta;
        public pregunta(int cod_pregunta, int cod_respuesta)
        {
            anterior = siguiente = null;
            this.cod_pregunta = cod_pregunta;
            this.cod_respuesta = cod_respuesta;
        }
    }
}