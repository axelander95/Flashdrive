<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="Flashdrive.Capa_de_usuario.Nosotros" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="Main" runat="server">
    <table style="width: 100%; color: #000000; background-color: #FFFFCC;" 
        frame="border">
    <tr>
        <td style="font-weight: 700; text-align: center">
            NUESTRA HISTORIA</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="imgHistoria" runat="server" 
                ImageUrl="~/Imágenes/Nosotros/taxis.jpg" Width="500px" />
        </td>
    </tr>
    <tr>
        <td style="text-align: justify">
            En el año 1998 se funda la compañía “Taxi Flash” la cual contaba con 25 unidades 
            dedicadas únicamente al servicio de taxi particular en la ciudad de Guayaquil, 
            pero es hasta el 2004, en los que los accionistas deciden ampliar su visión y 
            renuevan la compañía, esta vez bajo el nombre “FlashDrive”, el cual permanece 
            hasta la actualidad, y con eso la compañía pasa a realizar todo tipo de servicio 
            de transporte, para lo cual cuenta con más de 100 unidades y choferes altamente 
            capacitados a sus servicios.</td>
    </tr>
    <tr>
        <td style="font-weight: 700; text-align: center">
            MISIÓN</td>
    </tr>
    <tr>
        <td>
            Somos una compañía dedicada a servir a todos los ciudadanos ecuatorianos, para 
            lo cual hacemos uso de nuestro lema: “Rápido a donde estés, seguro a donde 
            vayas”. Además de brindar el mejor servicio a toda hora y para todo evento.</td>
    </tr>
    <tr>
        <td style="text-align: center; font-weight: 700">
            VISIÓN</td>
    </tr>
    <tr>
        <td>
            Ser una de las principales compañías de transporte en la ciudad de Guayaquil, 
            donde se encuentra establecida nuestra matriz, y en un futuro llegar con nuestro 
            servicio a todas y cada una de las provincias del Ecuador.</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="imgHistoria1" runat="server" 
                ImageUrl="~/Imágenes/Logos/Empresa Logo.png" Width="200px" />
        </td>
    </tr>
</table>
</asp:Content>
