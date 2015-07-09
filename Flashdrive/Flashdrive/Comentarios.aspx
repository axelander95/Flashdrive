<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comentarios.aspx.cs" Inherits="Flashdrive.Capa_de_usuario.Comentarios" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
    .style5
    {
        width: 134px;
        font-weight: bold;
    }
    .style6
    {
        text-align: center;
    }
    .style7
    {
        width: 255px;
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="Main" runat="server">
    <table style="width: 100%; color: #FFFFFF;">
    <tr>
        <td colspan="4" 
            style="font-size: x-large; font-weight: 700; text-align: center">
            COMENTARIOS</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            Nombres y apellidos:
        </td>
        <td>
            <asp:TextBox ID="txtUsuario" runat="server" Width="250px" Enabled="False" 
                onload="txtUsuario_Load"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="rfvUsuario" runat="server" 
                ControlToValidate="txtUsuario" 
                ErrorMessage="* Se requiere un nombre de usuario."></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            Mensaje:</td>
        <td>
            <asp:TextBox ID="txtMensaje" runat="server" Height="119px" TextMode="MultiLine" 
                Width="250px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="rfvMensaje" runat="server" 
                ControlToValidate="txtMensaje" 
                ErrorMessage="* Se requiere contenido del mensaje."></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6" colspan="4">
            <asp:Button ID="btnEnviar" runat="server" onclick="btnEnviar_Click" 
                Text="Enviar" />
        </td>
    </tr>
</table>
</asp:Content>
