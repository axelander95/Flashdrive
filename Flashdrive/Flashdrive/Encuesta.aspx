<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="Flashdrive.Encuesta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Encuesta.css" type="text/css" rel="stylesheet"/>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:986px;">
            <tr>
                <td class="style1">
                    <strong>Encuesta:</strong></td>
            </tr>
            <tr>
                <td style="font-weight: 700; background-color: #FFCCCC;">
                    Pregunta: 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="rblRespuestas" ErrorMessage="* Debe seleccionar una opción."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="background-color: #99CCFF">
                    <asp:Label ID="lblPregunta" runat="server" onload="lblPregunta_Load"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color: #99FF99">
                    <asp:RadioButtonList ID="rblRespuestas" runat="server" 
                        onload="rblRespuestas_Load">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" 
                        onclick="btnSiguiente_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
