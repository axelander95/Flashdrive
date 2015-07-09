<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Unidades.aspx.cs" Inherits="Flashdrive.Administrador.Unidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            height: 43px;
        }
        .style4
        {
            width: 629px;
            height: 43px;
        }
        .style5
        {
            height: 41px;
        }
        .style6
        {
            width: 629px;
            height: 41px;
        }
        .style7
        {
            width: 128px;
        }
        .style8
        {
            height: 41px;
            width: 128px;
        }
        .style9
        {
            height: 43px;
            width: 128px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table style="width:100%; color: #FFFFFF;">
        <tr>
            <td align="center" colspan="3">
                UNIDADES</td>
        </tr>
        <tr>
            <td class="style7">
                Buscar por:</td>
            <td class="style1">
                <asp:DropDownList ID="ddlBusqueda" runat="server" onload="ddlBusqueda_Load">
                    <asp:ListItem Value="Cod">Código</asp:ListItem>
                    <asp:ListItem Value="C">Color</asp:ListItem>
                    <asp:ListItem Value="P">Placa</asp:ListItem>
                </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusqueda" runat="server" MaxLength="50" Width="202px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnBusqueda" runat="server" CausesValidation="False" 
                    Text="Buscar" onclick="btnBusqueda_Click" />
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                    CellPadding="3" CellSpacing="1" GridLines="None" 
                    onrowcommand="GridView1_RowCommand" CaptionAlign="Top" 
                    onload="GridView1_Load">
                    <Columns>
                        <asp:ButtonField HeaderText="Modificar" Text="Modificar" CommandName="M" 
                            ButtonType="Button" />
                        <asp:BoundField DataField="cod_unidad" HeaderText="Código" />
                        <asp:BoundField DataField="cod_tipo" HeaderText="Código de tipo de unidad" />
                        <asp:BoundField DataField="descripcion" HeaderText="Tipo de unidad" />
                        <asp:BoundField DataField="placa" HeaderText="Placa" />
                        <asp:BoundField DataField="marca" HeaderText="Marca" />
                        <asp:BoundField DataField="modelo" HeaderText="Modelo" />
                        <asp:BoundField DataField="color" HeaderText="Color" />
                        <asp:BoundField DataField="año" HeaderText="Año" />
                        <asp:ButtonField HeaderText="Eliminar" Text="Eliminar" CommandName="E" 
                            ButtonType="Button" />
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
                <asp:Button ID="btnNuevo" runat="server" CausesValidation="False" Text="Nuevo" 
                    Width="77px" onclick="btnNuevo_Click" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                Código:</td>
            <td class="style1">
                <asp:TextBox ID="txtCodigo" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                Tipo de unidad:</td>
            <td class="style1">
                <asp:DropDownList ID="ddlTipo" runat="server" AutoPostBack="True" 
                    Enabled="False" onload="ddlTipo_Load" style="margin-left: 0px">
                </asp:DropDownList>
            &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Placa:</td>
            <td class="style6">
                <asp:TextBox ID="txtPlaca" runat="server" MaxLength="10" Width="156px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:RequiredFieldValidator ID="rfvPlaca" runat="server" 
                    ControlToValidate="txtPlaca" 
                    ErrorMessage="* Se requiere la placa de la unidad." ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Marca:</td>
            <td class="style1">
                <asp:TextBox ID="txtMarca" runat="server" MaxLength="25" Width="156px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvMarca" runat="server" 
                    ControlToValidate="txtMarca" 
                    ErrorMessage="* Se requiere la marca de la unidad." ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Modelo:</td>
            <td class="style1">
                <asp:TextBox ID="txtModelo" runat="server" MaxLength="25" Width="156px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvModelo" runat="server" 
                    ControlToValidate="txtModelo" 
                    ErrorMessage="* Se requiere el modelo de la unidad." ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Color:</td>
            <td class="style4">
                <asp:TextBox ID="txtColor" runat="server" MaxLength="25" Width="156px" onkeypress="letras()"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="rfvColor" runat="server" 
                    ControlToValidate="txtColor" 
                    ErrorMessage="* Se requiere el color de la unidad." ForeColor="White"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Año:</td>
            <td class="style1">
                <asp:TextBox ID="txtAño" runat="server" MaxLength="4" Width="156px" 
                    onkeypress="numeros()"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnProcesar" runat="server" Text="Procesar" Width="77px" 
                    onclick="btnProcesar_Click" />
&nbsp;
                <asp:Button ID="btnLimpiar" runat="server" CausesValidation="False" 
                    Text="Limpiar" Width="77px" />
&nbsp;
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
                    Text="Cancelar" Width="77px" />
            </td>
        </tr>
    </table>
</asp:Content>
