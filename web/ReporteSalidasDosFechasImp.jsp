<%-- 
    Document   : ReporteSalidasDosFechasImp
    Created on : 12-jun-2013, 16:00:41
    Author     : digesitpp
--%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todas las ventas diarias entre 2 fechas</title>
    </head>
    <body>
        <br>
        <table align="center"  cellpadding="2" cellspacing="1">
            <tr onclick="window.print();">
                <td valign="top"><img src="imag/upeu.jpg" height="60"/></td>
                <td><img src="imag/linea.png" height="55"/></td>
                <td valign="top" width="500"><b>UNIVERSIDAD PERUANA UNIÓN - TARAPOTO</b><br>
                    CAFETÍN UNIVERSITARIO <br>
                    <b>REPORTE:</b> VENTAS ENTRE 2 FECHAS<br>
                    <b>TIPO DE CLIENTE:</b> <s:property value="%{CMtipo_persona.nombre_tipo_persona}"/><br>
                    <b>FECHA INICIAL:</b> <s:property value="%{fecha_ini}"/><br>
                    <b>FECHA FINAL:</b> <s:property value="%{fecha_fin}"/><br>
                    
                </td>
            </tr>
        </table>
        <hr>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
            <tr>
                <th><b>#<b></th>
                <th><b>APELLIDOS Y NOMBRES DEL CLIENTE</b></th>
                <th><b>TOTAL</b></th>
                <th width="200"><b>FECHA</b></th>

            </tr>
            <s:iterator value="%{ReporteSalidasDosFechas}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center" width="20"><s:property value="snro"/></td>
                    <td align="left"><s:property value="id_cliente"/></td>
                    <td align="right"><s:property value="total"/></td>
                    <td align="center"><s:property value="fecha_reg"/></td>

                </tr> 
            </s:iterator>
            <tr>
                <td colspan="2"></td>
                <td align="right" bgcolor="yellow">S/ <b><s:property value="%{BCsalida.total}"/></b></td>
                <td align="center"></td>
            </tr>
        </table>
    </body>
</html>
