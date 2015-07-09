<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="Flashdrive.Capa_de_usuario.servicio" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #espacio
    {
        height: 33px;
        color: #FFCC99;
        background-color: #FFFFFF;
    }
        .style10
        {
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="Main" runat="server">
    <div id="espacio">
    </div> 
    <div>
    <center style="background-color: #FFFFFF"><object type="application/x-shockwave-flash" 
                                data="/flash/servicios animacion.swf" 
            style="width: 800px; height: 360px;" class="style10">
                            <param name="movie" value="flash/servicios animacion.swf" />
                            <param name="menu" value="false" />
                            <param name="quality" value="high" />
                            </object></center>
    </div>
    <div align="center" style="background-color: #FFFFFF">
        <br />
        <asp:Button ID="btnSolicitar" runat="server" onclick="btnSolicitar_Click" 
            Text="Solicitar" CssClass="style10" BackColor="Black" BorderStyle="Dashed" 
            Font-Size="Large" ForeColor="White" />
        <br />
        *Clic aquí para solicitar tu unidad.</div>
</asp:Content>
