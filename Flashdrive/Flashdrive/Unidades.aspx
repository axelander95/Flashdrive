<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Unidades.aspx.cs" Inherits="Flashdrive.Capa_de_usuario.Unidades" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style5
        {
            font-size: x-large;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="Main" runat="server">
    <table align="center" 
        style="width: 100%; color: #000000; background-color: #FFFFCC;">
        <tr>
            <td align="center" colspan="3" style="font-weight: 700; font-size: x-large">
                Bodas</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image ID="Image1" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Boda1.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image2" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Boda2.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image3" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Boda3.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" 
                style="text-align: center; font-weight: 700; font-size: x-large">
                Clásicos</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image ID="Image4" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Clasico1.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image5" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Clasico2.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image6" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Clasico3.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" 
                style="text-align: center; font-weight: 700; font-size: x-large">
                Discapacitados</td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="text-align: center">
                <asp:Image ID="Image7" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Discapacitados1.png" Width="200px" />
&nbsp;<asp:Image ID="Image8" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Discapacitados2.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: 700; font-size: x-large">
                Ejecutivos</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image ID="Image9" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Ejecutivo1.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image10" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Ejecutivo2.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image11" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Ejecutivo3.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: 700; font-size: x-large">
                Escolar</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Image ID="Image12" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Escolar1.png" Width="200px" />
&nbsp;
                <asp:Image ID="Image13" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Escolar2.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: 700; font-size: x-large">
                Funerario</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Image ID="Image14" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Funeraria1.png" Width="200px" />
&nbsp;<asp:Image ID="Image15" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Funeraria2.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: 700; font-size: x-large">
                Mudanza</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image ID="Image16" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Mudanza1.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image17" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Mudanza2.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image18" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Mudanza3.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: 700; font-size: x-large">
                Privado</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Image ID="Image19" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Privado1.png" Width="200px" />
&nbsp;<asp:Image ID="Image20" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Privado2.png" Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style5">
                &nbsp;</td>
            <td align="center">
                <b style="font-size: x-large">Quinceañera</b></td>
            <td align="center">
                <b></b>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Image ID="Image21" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Quince1.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image22" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Quince2.png" Width="200px" />
            </td>
            <td align="center">
                <asp:Image ID="Image23" runat="server" Height="150px" 
                    ImageUrl="~/Imágenes/Carros/Quince3.png" Width="200px" />
            </td>
        </tr>
    </table>
</asp:Content>
