<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlashMap.aspx.cs" Inherits="Flashdrive.Track.FlashMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<title>FlashMap</title>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAuPsJpk3MBtDpJ4G8cqBnjRRaGTYH6UMl8mADNa0YKuWNNa8VNxQCzVBXTx2DYyXGsTOxpWhvIG7Djw" type="text/javascript"></script>
    <style type="text/css">
        html, body, #mapa
        {
            height: 600px;
            width: auto;
            background-position: center;
            margin: 0px;
            padding: 10px 10px 10px 10px;
        }
        .style2
        {
            width: 268435456px;
        }
    </style>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=es&libraries=geometry"></script>
    <script type= "text/javascript">
        var map;
        var markers = [];
        var n = 0;
        var name = "Prueba";
        var DefaultLocation = new google.maps.LatLng("-2.181386", "-79.905984");
        function DrawMap() {
            if (navigator.geolocation) {
                var options = { enableHighAccuracy: true, timeout: Infinity, maximunAge: 0 };
                navigator.geolocation.watchPosition(success, fail, options);
                function success(position) {
                    alert("Se encontró tu localización");
                    var location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                    var options = { zoom: 11, center: location, mapTypeId: google.maps.MapTypeId.ROADMAP };
                    SetMap(options, location, name);
                }
                function fail() {
                    alert("No se pudo encontrar tu localización");
                    SetMap({ zoom: 11, center: DefaultLocation, mapTypeId: google.maps.MapTypeId.ROADMAP }, DefaultLocation,"?");
                }
            }
            else {
                alert("Tu navegador no soporta HTML5 o Geolocalización.");
            }
        }
        function SetMap(options, position, name) {
            map = new google.maps.Map(document.getElementById("mapa"), options);
            markers[n++] = new google.maps.Marker({map:map, position: position, draggable:true, title: name});
        }
        
        function Init_Map() {
            DrawMap();
        }
        window.onload = function () {
            Register();
        }
        function Register() {
            name = prompt("Código de unidad");
            var contraseña = prompt("Contraseña:");
            if (contraseña != "12345") {
                alert("Contraseña incorrecta");
                Register();
            }
            else
                Init_Map();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mapa">
    </div>
    </form>
</body>
</html>
