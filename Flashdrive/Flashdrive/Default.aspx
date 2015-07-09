<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="plantilla.plantillaP" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="~/Estilos/pantalla.css" rel="stylesheet" type="text/css" />
    <title></title>
    <style type="text/css">
        .style2
        {
            color: #FFFFFF;
            text-align: center;
            font-size: large;
        }
        .style3
        {
            font-size: x-large;
        }
        .style5
        {
            text-align: justify;
        }
        .style6
        {
            color: #FFFFFF;
            text-align: center;
            font-size: xx-large;
        }
        .style7
        {
            color: #FFFFFF;
            text-align: center;
            font-size: x-large;
        }
    </style>
</head>
<body class="hbody">
<div id="margenalto"></div>
    <form id="form1" runat="server">
<div>
    <table style="width: 986px;">
        <tr>
            <td class="style2">
                <center>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="83px" 
                        ImageUrl="~/Imágenes/boton home.jpg" Width="116px" BorderStyle="Groove" 
                        PostBackUrl="~/Home.aspx" />
                    <br />
                    <asp:LinkButton ID="lkAdmin" runat="server" 
                        PostBackUrl="~/Administrador/Home.aspx" 
                        style="font-weight: 700; font-size: xx-large; color: #FFFFFF" Visible="False">Administrador</asp:LinkButton>
                </center>
            </td>
            <td class="style6">
              
                &quot;Rápido donde estés, seguro donde vayas.&quot;</td>
        </tr>
        <tr>
            <td class="style2">
        
                
                <table style="width:186px;">
                    <tr>
                        <td class="style3">
                            <strong style="font-size: x-large">¿Por qué elegirnos?</strong></td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Más de 100 unidades a tu disposición.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Servicios de todo tipo.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Promociones y descuentos.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Registro gratis.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Servicio las 24 horas del día.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - La empresa más confiable del país.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Localización GPS avanzada.</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            - Y por sobre todo: Bajo precio y comodidad 100% garantizada.</td>
                    </tr>
                    </table>
        
                
            </td>
            <td class="style2">
        
    <center><object type="application/x-shockwave-flash" height="550px" 
                        data="flash/wpp.swf" style="width: 800px; margin-left: 0px">
                            <param name="movie" value="flash/wpp.swf" />
                            <param name="menu" value="false" />
                            <param name="quality" value="high" />
            </object></center>
                </td>
        </tr>
        <tr>
            <td class="style7" colspan="2">
                Somos los #1 en el Ecuador, nuestros servicios son rápidos, seguros y confiables. 
                Olvídate de llegar tarde a tu trabajo, fiesta u hogar.¡ Flashdrive lo tiene 
                todo!</td>
        </tr>
    </table>
</div>
    <div>
    </div>
    </form>
    <div id="margenbajo"></div>
</body>
</html>
