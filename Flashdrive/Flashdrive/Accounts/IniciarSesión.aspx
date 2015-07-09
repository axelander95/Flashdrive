<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IniciarSesión.aspx.cs" Inherits="Flashdrive.Accounts.IniciarSesión" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .style6
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="Main" runat="server">
    <div align="center">
    <asp:Login ID = "Login1" runat = "server" OnAuthenticate= "Login1_Authenticate" 
            BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="Medium" ForeColor="#333333" 
            Height="146px" Width="303px" 
            CreateUserText="¿No tienes cuenta? Regístrate aquí." 
            CreateUserUrl="~/Accounts/Registro.aspx">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
            ForeColor="White" />
        </asp:Login>
    </div>
</asp:Content>
