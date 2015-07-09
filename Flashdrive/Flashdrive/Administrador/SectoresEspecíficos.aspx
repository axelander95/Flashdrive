<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="SectoresEspecíficos.aspx.cs" Inherits="Flashdrive.Administrador.SectoresEspecíficos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; color: #FFFFFF;">
        <tr>
            <td align="center" colspan="4" style="font-weight: 700">
                PRECIOS DE CARRERA DE SECTOR A SECTOR</td>
        </tr>
        <tr>
            <td>
                Búsqueda:
                <asp:DropDownList ID="ddlBusqueda" runat="server">
                    <asp:ListItem Value="C">Código</asp:ListItem>
                    <asp:ListItem Value="S">Sector</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtBusqueda" runat="server" MaxLength="50" Width="306px"></asp:TextBox>
&nbsp;<asp:Button ID="btnBusqueda" runat="server" Text="Buscar" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                TABLA DE CONSULTAS</td>
            <td align="center" colspan="2">
                TABLA DE SECTORES POR CÓDIGO</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" onload="GridView1_Load" 
                    onrowcommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="M" HeaderText="Modificar" 
                            Text="Modificar" />
                        <asp:BoundField DataField="cod_precio" HeaderText="Código" />
                        <asp:BoundField DataField="cod_sector_inicio" 
                            HeaderText="Código de Sector de Inicio" />
                        <asp:BoundField DataField="cod_sector_fin" 
                            HeaderText="Código de Sector de Fin" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" />
                        <asp:ButtonField ButtonType="Button" CommandName="E" HeaderText="Eliminar" 
                            Text="Eliminar" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
            &nbsp;</td>
            <td align="center" colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" onload="GridView2_Load">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="cod_sector" HeaderText="Código" />
                        <asp:BoundField DataField="descripcion" HeaderText="Sector" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="btnNuevo" runat="server" CausesValidation="False" 
                    onclick="btnNuevo_Click" Text="Nuevo" />
            </td>
        </tr>
        <tr>
            <td>
                Código:</td>
            <td colspan="2">
                <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" MaxLength="50" 
                    Width="57px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Sector de inicio:</td>
            <td colspan="2">
                <asp:DropDownList ID="ddlInicio" runat="server" Enabled="False" 
                    onload="ddlInicio_Load">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Sector de fin:</td>
            <td colspan="2">
                <asp:DropDownList ID="ddlFin" runat="server" Enabled="False" 
                    onload="ddlFin_Load">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Precio:</td>
            <td colspan="2">
                <asp:TextBox ID="txtPrecio" runat="server" Enabled="False" MaxLength="10" 
                    Width="57px" onkeypress="dinero()"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" 
                    ControlToValidate="txtPrecio" 
                    ErrorMessage="* El campo precio no puede estar vacío."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="btnProcesar" runat="server" Enabled="False" 
                    onclick="btnProcesar_Click" Text="Procesar" Width="77px" />
&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" CausesValidation="False" 
                    Enabled="False" onclick="btnLimpiar_Click" Text="Limpiar" Width="77px" />
&nbsp;
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                    Enabled="False" onclick="btnCancelar_Click" Text="Cancelar" Width="77px" />
            </td>
        </tr>
    </table>
</asp:Content>
