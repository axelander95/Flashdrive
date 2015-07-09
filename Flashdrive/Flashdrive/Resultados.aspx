<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="Flashdrive.Resultados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1" colspan="2">
                    Resultados:</td>
            </tr>
            <tr>
                <td class="style1">
                    Seleccione pregunta:</td>
                <td>
                    <asp:DropDownList ID="ddlPreguntas" runat="server" AutoPostBack="True" 
                        onload="ddlPreguntas_Load">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" onload="GridView1_Load">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
