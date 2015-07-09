<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Flashdrive.Administrador.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%">
        <tr>
            <td align="center" style="color: #FFFFFF; font-weight: 700">
                USUARIO CON PRIVILEGIO DE ADMINISTRADOR</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnServicios" runat="server" onclick="btnServicios_Click" 
                    Text="SERVICIOS" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnChoferes" runat="server" onclick="btnChoferes_Click" 
                    Text="CHOFERES" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnTipos" runat="server" onclick="btnTipos_Click" 
                    Text="TIPOS DE UNIDADES" Width="238px" BackColor="White" 
                    BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnUnidades" runat="server" onclick="btnUnidades_Click" 
                    Text="UNIDADES" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnControl" runat="server" onclick="btnControl_Click" 
                    Text="CONTROL DE MENSAJES" Width="238px" BackColor="White" 
                    BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnSectores" runat="server" onclick="btnSectores_Click" 
                    Text="SECTORES" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnPrecios" runat="server" onclick="btnPrecios_Click" 
                    Text="PRECIOS" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnCarreras" runat="server" onclick="btnCarreras_Click" 
                    Text="CARRERAS" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnEstadisticas" runat="server" onclick="btnEstadisticas_Click" 
                    Text="ESTADÍSTICAS" Width="238px" BackColor="White" BorderStyle="Double" />
            </td>
        </tr>
        <tr>
            <td align="center" style="color: #FFFFFF; font-weight: 700">
                * INFORMACIÓN SUMAMENTE IMPORTANTE, DEBE SER MANEJADA CON RESPONSABILIDAD, SOLO 
                PERSONAL AUTORIZADO.</td>
        </tr>
    </table>
</asp:Content>
