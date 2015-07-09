<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Tipos_Unidades.aspx.cs" Inherits="Flashdrive.Administrador.Tipos_Unidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <table style="width:100%; color: #FFFFFF;">
    <tr>
        <td align="center" colspan="3">
            TIPOS DE UNIDADES</td>
    </tr>
    <tr>
        <td>
            Buscar por:</td>
        <td class="style1">
            <asp:DropDownList ID="ddlBusqueda" runat="server">
                <asp:ListItem Selected="True" Value="C">Código</asp:ListItem>
                <asp:ListItem Value="D">Descripción</asp:ListItem>
            </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusqueda" runat="server" MaxLength="25" Width="223px"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                Text="Buscar" onclick="btnBuscar_Click" />
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            TABLA DE CONSULTA</td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:GridView ID="grvTipos" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" onload="grvTipos_Load" 
                onrowcommand="grvTipos_RowCommand">
                <Columns>
                    <asp:ButtonField HeaderText="Acción" Text="Modificar" ButtonType="Button" 
                        CommandName="M" />
                    <asp:BoundField DataField="cod_tipo" HeaderText="Código" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:ButtonField HeaderText="Acción" Text="Eliminar" ButtonType="Button" 
                        CommandName="E" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:Button ID="btnNuevo" runat="server" CausesValidation="False" 
                Text="Nuevo" onclick="btnNuevo_Click" />
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
            Descripción:</td>
        <td class="style1">
            <asp:TextBox ID="txtDescripcion" runat="server" MaxLength="50" Width="222px" 
                Enabled="False" EnableTheming="True"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" 
                ControlToValidate="txtDescripcion" ErrorMessage="* No hay descripción" 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:Button ID="btnProcesar" runat="server" Text="Procesar" Width="77px" 
                Enabled="False" onclick="btnProcesar_Click" />
&nbsp;
            <asp:Button ID="btnLimpiar" runat="server" CausesValidation="False" 
                Text="Limpiar" Width="77px" Enabled="False" onclick="btnLimpiar_Click" />
&nbsp;
            <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                Text="Cancelar" Width="77px" Enabled="False" onclick="btnCancelar_Click" />
        </td>
    </tr>
</table>
</asp:Content>
