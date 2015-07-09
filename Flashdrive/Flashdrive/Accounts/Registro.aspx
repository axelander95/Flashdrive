<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Flashdrive.Accounts.Registro" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style5
        {
            text-align: center;
            font-weight: 700;
            font-size: x-large;
        }
        .style6
        {
            width: 156px;
            text-align: left;
            font-size: medium;
            font-weight: bold;
        }
        .style7
        {
            width: 236px;
        }
    </style>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="Main" runat="server">
    <table style="width: 100%; color: #FFFFFF;">
        <tr>
            <td class="style5" colspan="3">
                Registra tu cuenta</td>
        </tr>
        <tr>
            <td class="style6">
                Nombres:</td>
            <td class="style7">
                <asp:TextBox ID="txtNombres" runat="server" MaxLength="50" Width="211px" onkeypress="letras()"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNombres" runat="server" 
                    ControlToValidate="txtNombres" ErrorMessage="* Se requiere un nombre."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Usuario:</td>
            <td class="style7">
                <asp:TextBox ID="txtUsuario" runat="server" MaxLength="20" Width="211px" onkeypress="sinEspacios()"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" 
                    ControlToValidate="txtUsuario" 
                    ErrorMessage="* Se requiere un nombre de usuario."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Correo electrónico:</td>
            <td class="style7">
                <asp:TextBox ID="txtCorreo" runat="server" MaxLength="100" Width="211px" onkeypress="sinEspacios()"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" 
                    ControlToValidate="txtCorreo" 
                    ErrorMessage="* Se requiere un correo electrónico válido."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Contraseña:</td>
            <td class="style7">
                <asp:TextBox ID="txtContraseña1" runat="server" MaxLength="17" 
                    TextMode="Password" Width="211px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCorreo0" runat="server" 
                    ControlToValidate="txtContraseña1" 
                    ErrorMessage="* Se requiere una contraseña válida."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Repetir contraseña:</td>
            <td class="style7">
                <asp:TextBox ID="txtContraseña2" runat="server" MaxLength="17" 
                    TextMode="Password" Width="211px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvContraseña2" runat="server" 
                    ControlToValidate="txtContraseña2" 
                    ErrorMessage="* Se requiere repetir la contraseña ingresada."></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="cmpvContraseña" runat="server" 
                    ControlToCompare="txtContraseña2" ControlToValidate="txtContraseña1" 
                    ErrorMessage="* Las contraseñas deben coincidir."></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <br />
                <asp:Button ID="btnResgistro" runat="server" Text="Registrarse" 
                    onclick="btnResgistro_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
