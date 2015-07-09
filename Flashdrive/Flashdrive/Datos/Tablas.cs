using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace Flashdrive.Datos
{
    public static class Tablas
    {
        public static DataSet ranking, carreras,servicios, choferes, tipos_unidades, unidades, sectores, precios;
        public static void ReloadData()
        {
            servicios = new clase_general().GetDataSet("consulta_servicios");
            choferes = new clase_general().GetDataSet("consulta_choferes");
            unidades = new clase_general().GetDataSet("consulta_unidades");
            tipos_unidades = new clase_general().GetDataSet("consulta_tipo");
            sectores = new clase_general().GetDataSet("consulta_sectores");
            precios = new clase_general().GetDataSet("consulta_precios");
            carreras = new clase_general().GetDataSet("consulta_carreras");
            ranking = new clase_general().GetDataSet("consulta_ranking");
        }
        public static int GetCode(DataSet tabla, int GridViewCode, string column)
        {
            int n = 0;
            for (int j = 0; j < tabla.Tables[0].Rows.Count; j++)
            {
                if (Convert.ToInt32(tabla.Tables[0].Rows[j][column]) == GridViewCode)
                {
                    n = j;
                    break;
                }
            }
            return n;
        }
        public static decimal GetPrecio (int sector1, int sector2)
        {
            decimal precio = 0;
            for (int i = 0; i < precios.Tables[0].Rows.Count; i++)
            {
                if (Convert.ToInt32(precios.Tables[0].Rows[i]["cod_sector_inicio"]) == sector1 && Convert.ToInt32(precios.Tables[0].Rows[i]["cod_sector_fin"]) == sector2)
                {
                    precio = Convert.ToDecimal(precios.Tables[0].Rows[i]["precio"]);
                    break;
                }
            }
            return precio;
        }
        public static int Counter( int cod_servicio)
        {
            int n = 0;
            for (int i = 0; i < carreras.Tables[0].Rows.Count; i++)
            {
                if (Convert.ToInt32(carreras.Tables[0].Rows[i]["cod_servicio"]) == cod_servicio)
                    n++;
            }
            return n;
        }
        public static bool Exist(int cod_servicio)
        {
            bool band = false;
            for (int i = 0; i < ranking.Tables[0].Rows.Count; i++)
            { 
            }
            return band;
        }
        public static void SetRanking()
        {
            for (int i = 0; i < servicios.Tables[0].Rows.Count; i++)
            {
                int n = Counter(Convert.ToInt32(servicios.Tables[0].Rows[i]["cod_servicio"]));
                
            }
        }
    }
}