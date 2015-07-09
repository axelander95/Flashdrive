<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Admin.Master" AutoEventWireup="true" CodeBehind="Choferes.aspx.cs" Inherits="Flashdrive.Administrador.Choferes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            color: #FFFFFF;
        }
        .style4
        {
            width: 148px;
        }
        .style5
        {
            color: #FFFFFF;
            width: 148px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td align="center" colspan="3" class="style3">
                <strong>CHOFERES</strong></td>
        </tr>
        <tr>
            <td style="color: #FFFFFF" class="style4">
                Buscar por:</td>
            <td class="style1">
                <asp:DropDownList ID="ddlBusqueda" runat="server" onload="ddlBusqueda_Load" 
                    onselectedindexchanged="ddlBusqueda_SelectedIndexChanged">
                    <asp:ListItem Value="C">Código</asp:ListItem>
                    <asp:ListItem Value="N">Nombre</asp:ListItem>
                </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusqueda" runat="server" MaxLength="50" Width="248px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                    Text="Buscar" onclick="btnBuscar_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="color: #FFFFFF">
                TABLA DE CONSULTA</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" onrowcommand="GridView1_RowCommand" 
                    onload="GridView1_Load" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="M" HeaderText="Modificar" 
                            Text="Modificar" />
                        <asp:BoundField DataField="cod_chofer" HeaderText="Código" />
                        <asp:BoundField DataField="nombres" HeaderText="Nombre" />
                        <asp:BoundField DataField="cedula" HeaderText="Cédula" />
                        <asp:BoundField DataField="sexo" HeaderText="Sexo" />
                        <asp:BoundField DataField="edad" HeaderText="Edad" />
                        <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                        <asp:BoundField DataField="licencia" HeaderText="Licencia" />
                        <asp:BoundField DataField="cod_servicio" HeaderText="Código de Servicio" />
                        <asp:BoundField DataField="descripcion" HeaderText="Servicio" />
                        <asp:ButtonField ButtonType="Button" CommandName="E" HeaderText="Eliminar" 
                            Text="Eliminar" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="color: #FFFFFF">
                Para agregar un nuevo chofer, de clic aquí.
                <asp:Button ID="btnNuevo" runat="server" CausesValidation="False" 
                    Text="Nuevo" onclick="btnNuevo_Click" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                Código:</td>
            <td class="style1">
                <asp:TextBox ID="txtCodigo" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Nombres y Apellidos:</td>
            <td class="style1">
                <asp:TextBox ID="txtNombre" runat="server" MaxLength="100" Width="294px" 
                    onkeypress="letras()" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNombres" runat="server" 
                    ControlToValidate="txtNombre" 
                    ErrorMessage="* Se requiere los nombres y apellidos del chofer." 
                    ForeColor="White" CssClass="style3"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Cédula:</td>
            <td class="style1">
                <asp:TextBox ID="txtCedula" runat="server" MaxLength="10" Width="157px" 
                    onkeypress="numeros()" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCedula" runat="server" 
                    ControlToValidate="txtCedula" 
                    ErrorMessage="* Se requiere un número de cédula. Recuerde que es un dato único." 
                    ForeColor="White" CssClass="style3"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Sexo:</td>
            <td class="style1">
                <asp:RadioButtonList ID="rblSexo" runat="server" ForeColor="White" 
                    Enabled="False">
                    <asp:ListItem Selected="True" Value="M">Masculino</asp:ListItem>
                    <asp:ListItem Value="F">Femenino</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Edad:</td>
            <td class="style1">
                <asp:TextBox ID="txtEdad" runat="server" MaxLength="2" Width="48px" 
                    onkeypress="numeros()" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEdad" runat="server" 
                    ControlToValidate="txtEdad" ErrorMessage="* Se requiere la edad del chofer." 
                    ForeColor="White" CssClass="style3"></asp:RequiredFieldValidator>
                <br class="style3" />
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="txtEdad" 
                    ErrorMessage="* Sólo se permite una edad entre 18 y 65 años." ForeColor="White" 
                    MaximumValue="65" MinimumValue="18" Type="Integer" CssClass="style3"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Teléfono:</td>
            <td class="style1">
                <asp:TextBox ID="txtTelefono" runat="server" onkeypress="numeros()" MaxLength="10" Width="157px" 
                    Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Licencia:</td>
            <td class="style1">
                <asp:DropDownList ID="ddlLicencia" runat="server" Enabled="False">
                    <asp:ListItem Selected="True">A</asp:ListItem>
                    <asp:ListItem>A1</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>C1</asp:ListItem>
                    <asp:ListItem>D</asp:ListItem>
                    <asp:ListItem>D1</asp:ListItem>
                    <asp:ListItem>E</asp:ListItem>
                    <asp:ListItem>E1</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                    <asp:ListItem>G</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Servicio:</td>
            <td class="style1">
                <asp:DropDownList ID="ddlServicio" runat="server" Enabled="False" 
                    onload="ddlServicio_Load">
                </asp:DropDownList>
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnProcesar" runat="server" Enabled="False" 
                    onclick="btnProcesar_Click1" Text="Procesar" Width="77px" />
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
