<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Sector.aspx.cs" Inherits="Flashdrive.Administrador.Sector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table style="width:100%; color: #FFFFFF;">
        <tr>
            <td align="center" colspan="3">
                SECTORES GENERALES</td>
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
            &nbsp;<asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                    Text="Buscar" onclick="btnBuscar_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                TABLA DE CONSULTA</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="grvSectores" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                    CellPadding="3" CellSpacing="1" GridLines="None" onload="grvSectores_Load" 
                    onrowcommand="grvSectores_RowCommand">
                    <Columns>
                        <asp:ButtonField HeaderText="Acción" Text="Modificar" ButtonType="Button" 
                            CommandName="M" />
                        <asp:BoundField DataField="cod_sector" HeaderText="Código" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                        <asp:ButtonField HeaderText="Acción" Text="Eliminar" ButtonType="Button" 
                            CommandName="E" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
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
                    onkeypress="letras()" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" 
                    ControlToValidate="txtDescripcion" ErrorMessage="* No hay descripción" 
                    ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnProcesar" runat="server" Text="Procesar" Width="77px" 
                    onclick="btnProcesar_Click" />
&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" CausesValidation="False" 
                    Text="Limpiar" Width="77px" onclick="btnLimpiar_Click" />
&nbsp;
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                    Text="Cancelar" Width="77px" onclick="btnCancelar_Click" 
                    style="height: 26px" />
            </td>
        </tr>
    </table>
</asp:Content>
