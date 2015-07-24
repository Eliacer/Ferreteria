<%-- 
    Document   : salida_personal_vista
    Created on : 10-jun-2013, 12:39:20
    Author     : digesitpp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<s:include id="cab.jsp" value="cab.jsp"></s:include>
<link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <link rel="stylesheet" type="text/css" href="js/calendar/tcal.css" />
        <script type="text/javascript" src="js/calendar/tcal.js"></script>
        <title>venta personal cliente</title>
    </head>
    <body>
        <table align="center">
            <tr>
                <td>
                    <form name="anular" action="AtrasSalida.action" method="post">
                        <input type="hidden" name="id_salida" value="<s:property value="%{BCsalida.id_salida}"/>"/>
                        <input type="submit" name="Atrás" value="Atrás" />
                    </form>
                </td>
                <td>
                    <form name="CrearCronogramaSalida" action="CrearCronogramaSalida.action" method="post">
                        Fecha de cobranza: <input type="text" name="fecha_reg" value="" maxLength="10" size="10" Class="tcal" readonly="true"/>
                        <input type="hidden" name="id_salida" value="<s:property value="%{BCsalida.id_salida}"/>"/>
                        <input type="submit" name="Terminar" value="Terminar" onclick="RegistrarCronogramaPersonal();"/>
                    </form>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><div id="cronograma" class="falta"></div></td>
            </tr>
        </table>
        <table align="center"><tr>
                <td align="center">
                    <iframe src="impresion_salida_personal.action?id_salida=<s:property value="BCsalida.id_salida"/>" width="600" height="500"/> 
                </td>
            </tr>
        </table>
    </body>
</html>
