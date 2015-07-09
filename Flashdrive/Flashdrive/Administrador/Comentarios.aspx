<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Comentarios.aspx.cs" Inherits="Flashdrive.Administrador.Comentarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table style="width:100%; color: #FFFFFF;">
        <tr>
            <td align="center" class="style1" colspan="3">
                CONTROL DE COMENTARIOS</td>
        </tr>
        <tr>
            <td>
                Buscar por:</td>
            <td class="style2">
                <asp:DropDownList ID="ddlBusqueda" runat="server" onload="ddlBusqueda_Load" 
                    onselectedindexchanged="ddlBusqueda_SelectedIndexChanged">
                    <asp:ListItem Value="Cod">Código</asp:ListItem>
                    <asp:ListItem Value="C">Contenido</asp:ListItem>
                    <asp:ListItem Value="U">Usuario</asp:ListItem>
                </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusqueda" runat="server" MaxLength="50" Width="296px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                    Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="grvComentarios" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" GridLines="Horizontal" onrowcommand="GridView1_RowCommand" 
                    onload="grvComentarios_Load">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:ButtonField HeaderText="Modificar" Text="Visible/Invisible" 
                            CommandName="V" ButtonType="Button" />
                        <asp:BoundField DataField="cod_comentario" HeaderText="Código" />
                        <asp:BoundField DataField="nombre" HeaderText="Usuario" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="visibilidad" HeaderText="Visibilidad" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                Código:</td>
            <td class="style1">
                <asp:TextBox ID="txtCodigo" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Usuario:</td>
            <td class="style2">
                <asp:Label ID="lblUsuario" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Mensaje:</td>
            <td class="style2">
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Visibilidad:</td>
            <td class="style2">
                <asp:DropDownList ID="ddlVisibilidad" runat="server">
                    <asp:ListItem Value="S">Sí</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnProcesar" runat="server" Text="Procesar" Width="77px" 
                    Enabled="False" onclick="btnProcesar_Click" />
&nbsp;
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                    Text="Cancelar" Width="77px" Enabled="False" />
            </td>
        </tr>
    </table>
</asp:Content>
