using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace Flashdrive.Datos
{
    public class clase_general
    {
        public SqlConnection Connect()
        {
            ConnectionStringSettings param = ConfigurationManager.ConnectionStrings["ApplicationServices"];
            return new SqlConnection(param.ConnectionString);
        }
        public DataSet GetDataSet(string command)
        {
            SqlCommand cmd = new SqlCommand(command, Connect());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet GetDataSet(string ProcedureName, SqlParameter busqueda)
        {
            SqlConnection conexion = Connect();
            SqlCommand cmd = new SqlCommand(ProcedureName, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();
            cmd.Parameters.Add(busqueda);
            conexion.Close();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet GetDataSet(string ProcedureName, SqlParameter [] busqueda)
        {
            SqlConnection conexion = Connect();
            SqlCommand cmd = new SqlCommand(ProcedureName, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();
            for (int i=0; i<busqueda.Length; i++)
            cmd.Parameters.Add(busqueda[i]);
            conexion.Close();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public int Execute(string command)
        {
            SqlConnection connection = Connect();
            SqlCommand cmd = new SqlCommand(command, connection);
            connection.Open();
            int info = cmd.ExecuteNonQuery();
            connection.Close();
            return info;
        }
        public void SetDropDownList(DropDownList list, string command, string column)
        {
            list.DataSource = GetDataSet(command);
            list.DataTextField = column;
            list.DataValueField = column;
            list.DataBind();
        }
        public void SetGridView(GridView table, string command)
        {
            table.DataSource = GetDataSet(command);
            table.DataBind();

        }
        public void SetGridView(GridView table, string ProcedureName, SqlParameter busqueda)
        {
            table.DataSource = GetDataSet(ProcedureName,busqueda);
            table.DataBind();
        }
        public int ExecuteProcedure(string name, SqlParameter[] param)
        {
            SqlConnection conexion = Connect();
            int rows = 0;
            SqlCommand cmd = new SqlCommand(name, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();
            for (int i = 0; i < param.Length; i++)
                cmd.Parameters.Add(param[i]);
            rows = cmd.ExecuteNonQuery();
            conexion.Close();
            return rows;
        }
        public int ExecuteProcedure(string name, SqlParameter param)
        {
            SqlConnection conexion = Connect();
            int rows = 0;
            SqlCommand cmd = new SqlCommand(name, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();
            cmd.Parameters.Add(param);
            rows = cmd.ExecuteNonQuery();
            conexion.Close();
            return rows;
        }
        public void SetRadioButtonList(RadioButtonList rbl, string procedure ,string column, string value, SqlParameter parametro)
        {
            rbl.DataSource = GetDataSet(procedure,parametro);
            rbl.DataTextField = column;
            rbl.DataValueField = value;
            rbl.DataBind();
        }
        public void SetDropDownList(DropDownList list, string procedure, string column, string value)
        {
            list.DataSource = GetDataSet(procedure);
            list.DataTextField = column;
            list.DataValueField = value;
            list.DataBind();
        }
    }
}