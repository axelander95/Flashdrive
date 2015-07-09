using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flashdrive.Datos;
namespace Flashdrive
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.Name == "admin")
                Response.Redirect("~/Administrador/Home.aspx");
        }

        protected void DataList1_Load(object sender, EventArgs e)
        {
            DataList1.DataSource = new clase_general().GetDataSet("consulta_comentarios");
            DataList1.DataBind();
        }
    }
}