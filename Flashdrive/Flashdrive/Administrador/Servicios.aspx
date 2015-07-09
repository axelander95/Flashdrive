<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="Flashdrive.Administrador.Servicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table style="width:100%; color: #FFFFFF;">
        <tr>
            <td align="center" class="style2" colspan="3">
                SERVICIOS DE FLASHDRIVE</td>
        </tr>
        <tr>
            <td class="style3">
                Buscar por:</td>
            <td class="style1">
                <asp:DropDownList ID="ddlBusqueda" runat="server" 
                    onselectedindexchanged="ddlBusqueda_SelectedIndexChanged">
                    <asp:ListItem Value="C">Código</asp:ListItem>
                    <asp:ListItem Value="D">Descripción</asp:ListItem>
                </asp:DropDownList>
&nbsp;
                <asp:TextBox ID="txtConsulta" runat="server" Width="257px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                    Text="Buscar" onclick="btnBuscar_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="3">
                Tabla de Consulta:</td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="3">
                <asp:GridView ID="grvServicios" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" onload="grvServicios_Load" 
                    onrowcommand="grvServicios_RowCommand">
                    <Columns>
                        <asp:ButtonField HeaderText="Acción" Text="Modificar" ButtonType="Button" 
                            CommandName="M" />
                        <asp:BoundField DataField="cod_servicio" HeaderText="Código" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" />
                        <asp:ButtonField HeaderText="Acción" Text="Eliminar" ButtonType="Button" 
                            CommandName="E" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="3">
                <asp:Button ID="btnNuevo" runat="server" CausesValidation="False" Text="Nuevo" 
                    Width="77px" onclick="btnNuevo_Click" />
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
            <td class="style3">
                Nombre del servicio:</td>
            <td class="style1">
                <asp:TextBox ID="txtNombre" runat="server" MaxLength="50" Width="219px" 
                    onkeypress="letras()" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                    ControlToValidate="txtNombre" 
                    ErrorMessage="* Se requiere el nombre del servicio." ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Precio:</td>
            <td class="style1">
                <asp:TextBox ID="txtPrecio" runat="server" MaxLength="10" Width="83px" 
                    onkeypress="dinero()" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNombre0" runat="server" 
                    ControlToValidate="txtPrecio" 
                    ErrorMessage="* Se requiere el precio del servicio." ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style2" colspan="3">
                <asp:Button ID="btnProcesar" runat="server" Text="Procesar" Width="77px" 
                    onclick="btnProcesar_Click" Enabled="False" />
&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" CausesValidation="False" 
                    Text="Limpiar" Width="77px" Enabled="False" onclick="btnLimpiar_Click" />
&nbsp;
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                    Text="Cancelar" Width="77px" onclick="btnCancelar_Click" Enabled="False" />
            </td>
        </tr>
    </table>
</asp:Content>
