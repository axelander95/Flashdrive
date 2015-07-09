<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Flashdrive.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style16
    {
        text-align: left;
    }
    .style17
    {
        font-weight: normal;
        font-family: Leelawadee;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <table style="width:996px;">
        <tr>
            <td align="center" colspan="3">
                <object type="application/x-shockwave-flash" 
                                data="/flash/banner1.swf" style="width: 996px; height: 250px;">
                            <param name="movie" value="flash/banner.swf" />
                            <param name="menu" value="false" />
                            <param name="quality" value="high" />
                            </object>&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <iframe src="//www.youtube.com/embed/oysBYl2b_xg" frameborder="0"
                                    style="margin-top:0px; width: 300px;" height="200px" 
                            id="I1" name="I1"></iframe>&nbsp;</td>
            <td align="center">
                <table style="width:350px;" cellspacing="4px">
                    <tr>
                        <td align="center">
                            <b>Nuevas unidades a tu disposición</b></td>
                        <td align="center">
                            <b>Accede a nuestras promociones</b></td>
                        <td align="center">
                            <b>¡Contrata nuestros servicios ya!</b></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl="~/Imágenes/Noticias/back2.jpg" Width="80px" Height="80px" />
                        </td>
                        <td align="center">
                            <asp:Image ID="Image2" runat="server"
                                ImageUrl="~/Imágenes/Noticias/computadora.png" Width="80px" 
                                Height="80px" />
                        </td>
                        <td align="center">
                            <asp:Image ID="Image3" runat="server"
                                ImageUrl="~/Imágenes/Noticias/click.jpeg" Width="80px" Height="80px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            Flashdrive se actualiza cada día. Nuevas unidades disponibles para la comodidad 
                            de nuestros clientes.</td>
                        <td align="center">
                            Promociones cada mes, regístrate y disfruta de Flashdrive al máximo.</td>
                        <td align="center">
                            Adquiere una cuenta y descubre lo increíble que es contratar nuestros servicios.</td>
                    </tr>
                </table>
            </td>
            <td align="center" style="font-weight: 700">
                Comentarios:<br />
                <br />
                <asp:DataList ID="DataList1" runat="server" style="text-align: justify" 
                    onload="DataList1_Load" BackColor="#CCCCCC" BorderColor="#999999" 
                    BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" 
                    GridLines="Both" Width="300px" CellSpacing="2">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="White" />
                    <ItemTemplate >
                                                    <div class="style16">
                 
                                                                <asp:Label ID="lblUsuario" runat="server" style="font-weight: 700; font-style: italic;" 
                                                                    Text="<%# Bind('nombre') %>" Font-Names="Leelawadee"></asp:Label>
                                                           
                                                                &nbsp;<span class="style17"><strong><em>dice:</em></strong></span><br />&nbsp;<asp:Label 
                                                                    ID="lblMensaje" runat="server" Text="<%# Bind('descripcion') %>" 
                                                                    Font-Bold="False" Font-Names="Andalus" style="font-style: italic"></asp:Label>
                                           
                                                    </div>
                        </ItemTemplate>
                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <br />
            </td>
        </tr>
        </table>
</asp:Content>
