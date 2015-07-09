<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Solicitud.aspx.cs" Inherits="Flashdrive.Solicitud" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitud</title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style2
        {            font-weight: 700;
        }
        .style3
        {
            height: 23px;
            width: 170px;
            font-weight: bold;
        }
        .style4
        {
            width: 86px;
        }
        .style5
        {
            height: 23px;
            width: 86px;
        }
        .style6
        {
            text-align: center;
            font-weight: 700;
        }
        .style7
        {
            font-weight: bold;
        }
        .style9
        {
            width: 52px;
        }
        #Text1
        {
            width: 160px;
            height: 21px;
        }
        #txtDesde
        {
            width: 167px;
        }
        .style10
        {
            width: 245px;
        }
        .style11
        {
            width: 256px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 1020px;">
            <tr>
                <td class="style6" colspan="7">
                    Solicitud de unidad:</td>
            </tr>
            <tr>
                <td class="style7">
                    Usuario:</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td colspan="4" rowspan="9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Servicio:</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    ¿Desea hacer reservación?</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Fecha:</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Hora:</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Sector de inicio:</td>
                <td class="style5">
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Sector de destino:</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Subtotal:</td>
                <td class="style4">
                    <asp:TextBox ID="txtSubtotal" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    Total:</td>
                <td class="style4">
                    <asp:TextBox ID="txtTotal" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Dirección específica de inicio:</td>
                <td class="style4" id="txtDireccion">
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style9">
                    Desde:</td>
                <td class="style11">
                    <input id="txtDesde" type="text" />Hasta:</td>
                <td class="style10">
                    <input id="Text1" type="text" /></td>
                <td>
                    <input id="btnBuscar" type="button" value=" Buscar" /></td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
