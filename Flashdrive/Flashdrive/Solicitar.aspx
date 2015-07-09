<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Solicitar.aspx.cs" Inherits="MyGps.MyGps2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
&nbsp;<html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><meta http-equiv="content-type" content="text/html; charset=utf-8"/><title>Rutas</title>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>

<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAuPsJpk3MBtDpJ4G8cqBnjRRaGTYH6UMl8mADNa0YKuWNNa8VNxQCzVBXTx2DYyXGsTOxpWhvIG7Djw" type="text/javascript"></script>
<style type="text/css">

body {
font-family: Verdana, Arial, sans serif;
font-size: 11px;
margin: 25px;
}
table.directions th {
background-color:#EEEEEE;
}
h2 {text-align: center}
img {
color: #000000;
}
    .style1
    {
        width: 221px;
    }
</style>
<meta name= "viewport" content= "width=device-width, initial-scale=1"/>
    <style type="text/css">
        html, body, #map-canvas
        {
            height: 400px;
            width: 100%;
            background-position: center;
            margin: 0px;
            padding: 10px 10px 10px 10px;
        }
        </style>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=es&libraries=geometry"></script>
    
    <script type="text/javascript">
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map;

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var guayaquil = new google.maps.LatLng(-2.1637532, -79.9623097);
            var mapOptions = {
                zoom: 15,
                center: guayaquil
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);
        }
        var distance;
        function calcRoute() {
            var start = document.getElementById('start').value;
            var end = document.getElementById('end').value;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    distance = response.routes[0].legs[0].distance.value / 1609.344;
                    document.getElementById("txtKm").value = distance;
                }
            });
            
        }

        function getDistance() {


            document.getElementById("txtKm").value = distance;
            
                  }

        



        google.maps.event.addDomListener(window, 'load', initialize);


    </script>
    </head>
    <body>
<br />
   
   <div id="map-canvas"></div>
   <div>
       <center><label>Desde: </label><input id="start" type="text" runat= "server" />&nbsp;&nbsp;&nbsp;<label>Hasta: </label><input runat="server" id="end" type="text" /> 
       <input id="buscar" type="button" value="Consultar Distancia" onclick="calcRoute()"/> </center>
       <br />
   </div>
   <div>
    <div style="width: 100%; height: 400px;">
<form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table runat="server" style="width:100%; background-color: #CCCCCC;">
                    <tr>
                        <td colspan="3" style="text-align: center; font-weight: 700">
                            FLASHDRIVE TE BRINDA UN SERVICIO 100% GARANTIZADO.</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center; font-weight: 700">
                            SOLICITUD</td>
                    </tr>
                    <tr>
                        <td>
                            Usuario:</td>
                        <td class="style1">
                            <asp:TextBox ID="txtUsuario" runat="server" Enabled="False" 
                                onload="lblusuario_Load"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Servicio:</td>
                        <td class="style1">
                            <asp:DropDownList ID="ddlservicio" runat="server" Height="16px" Width="244px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Sector de inicio:</td>
                        <td class="style1">
                            <center>
                                <asp:DropDownList ID="ddlsectorini" runat="server" Height="16px" 
                                    style="text-align: left" Width="244px">
                                </asp:DropDownList>
                            </center>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Sector de destino:</td>
                        <td class="style1">
                            <asp:DropDownList ID="ddlsectorfin" runat="server" Height="16px" Width="244px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Kilómetros de carrera:</td>
                        <td class="style1">
                    <input id="txtKm" type="text" runat="server" disabled="disabled"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtKm" ErrorMessage="*Requiere calcular la distancia."></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" style="font-weight: 700" 
                                Text="Costo Carrera: "></asp:Label>
                            <asp:TextBox ID="txtresultado" runat="server" Enabled="False" 
                                onload="lblsub_Load" Width="159px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtresultado" ErrorMessage="* Calcule el precio."></asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="btnCalcular" runat="server" CausesValidation="False" onclick="btnCalcular_Click" 
                                Text="Calcular" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Reservación:</td>
                        <td class="style1">
                            <asp:RadioButtonList ID="rblreservacion" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="rblreservacion_SelectedIndexChanged">
                                <asp:ListItem>Si</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="rblreservacion" 
                                ErrorMessage="* Debe seleccionar una opción."></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Hora:
                            <asp:TextBox ID="Reloj" runat="server" MaxLength="2" 
                                onkeypress="ValidoSoloNumeros()" onkeyup="if(this.value&gt;23){this.value='';}" 
                                Width="22px"></asp:TextBox>
                            <asp:Label ID="lbl" runat="server" Font-Size="XX-Large" Text=":"></asp:Label>
                            <asp:TextBox ID="Minuto" runat="server" MaxLength="2" 
                                onkeypress="ValidoSoloNumeros()" onkeyup="if(this.value&gt;59){this.value='';}" 
                                Width="24px"></asp:TextBox>
                            &nbsp;<asp:Label ID="lblrelojno" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Fecha:</td>
                        <td class="style1">
                            <asp:Calendar ID="calendar" runat="server" BackColor="White" 
                                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                ondayrender="calendar_DayRender" onselectionchanged="calendar_SelectionChanged" 
                                Width="200px">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                    <br />
                            <asp:Label ID="lblcalendar" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Dirección exacta de inicio:</td>
                        <td class="style1">
                            <asp:TextBox ID="txtDireccion" runat="server" MaxLength="100" Width="208px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            * Un correo electrónico será enviado para la confirmación definitiva de su 
                            carrera.<br /> * Cada servicio tiene un costo diferente, revise la tabla de 
                            precios de servicios, Aquí.<br /> * Para servicio de taxi normal, elija servicio 
                            estándar, cuyo costo es $0.</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <center>
                                <asp:Button ID="btnasignar" runat="server" onclick="btnasignar_Click" 
                                    style="font-weight: 700" Text="Enviar solicitud" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnregresar" runat="server" CausesValidation="False" 
                                    onclick="btnregresar_Click" style="font-weight: 700" Text="Regresar" 
                                    Width="150px" />
                            </center>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>

</div>
   </div>
</body>
</html> 
