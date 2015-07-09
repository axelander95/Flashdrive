<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Carreras.aspx.cs" Inherits="Flashdrive.Administrador.Carreras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Button ID="btnVer" runat="server" onclick="btnVer_Click" 
                    Text="Ver en el mapa" />
            </td>
            <td>
                Carreras</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grvUnidades" runat="server" AutoGenerateColumns="False" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    onload="grvUnidades_Load" onrowcommand="grvUnidades_RowCommand">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:BoundField DataField="cod_unidad" HeaderText="Código" />
                        <asp:BoundField DataField="placa" HeaderText="Placa" />
                        <asp:BoundField DataField="color" HeaderText="Color" />
                        <asp:BoundField DataField="cod_chofer" HeaderText="Chofer" />
                        <asp:BoundField DataField="nombres" HeaderText="Nombre de chofer" />
                        <asp:ButtonField ButtonType="Button" CommandName="S" Text="Seleccionar" />
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
            </td>
            <td>
                <asp:GridView ID="grvCarreras" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" onload="grvCarreras_Load" 
                    onrowcommand="grvCarreras_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="cod_carrera" HeaderText="Código" />
                        <asp:BoundField DataField="usuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="fecha" HeaderText="Fecha" />
                        <asp:BoundField DataField="descripcion" HeaderText="Sector" />
                        <asp:BoundField DataField="hora" HeaderText="Hora" />
                        <asp:ButtonField ButtonType="Button" CommandName="S" HeaderText="Seleccionar" 
                            Text="Seleccionar" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Carrera:</td>
            <td>
                <asp:TextBox ID="txtCarrera" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Usuario:</td>
            <td>
                <asp:TextBox ID="txtUsuario" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Fecha:</td>
            <td>
                <asp:TextBox ID="txtFecha" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Hora:</td>
            <td>
                <asp:TextBox ID="txtHora" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Sector:</td>
            <td>
                <asp:TextBox ID="txtSector" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Codigo de chofer:</td>
            <td>
                <asp:TextBox ID="txtCodigoChofer" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Chofer:</td>
            <td>
                <asp:TextBox ID="txtChofer" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Unidad:</td>
            <td>
                <asp:TextBox ID="txtUnidad" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Placa:</td>
            <td>
                <asp:TextBox ID="txtPlaca" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Color:</td>
            <td>
                <asp:TextBox ID="txtColor" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAsignar" runat="server" Text="Asignar" 
                    onclick="btnAsignar_Click" />
&nbsp;<asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
