<%-- 
    Document   : ReporteSalidasImp
    Created on : 12-jun-2013, 11:19:23
    Author     : digesitpp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Todas las ventas</title>
    </head>
    <body>
      <br>
        <table align="center"  cellpadding="2" cellspacing="1">
            <tr onclick="window.print();">
                <td valign="top"><img src="imag/upeu.jpg" height="60"/></td>
                <td><img src="imag/linea.png" height="55"/></td>
                <td valign="top" width="500"><b>UNIVERSIDAD PERUANA UNIÓN - TARAPOTO</b><br>
                    CAFETÍN UNIVERSITARIO <br>
                    <b>REPORTE: </b>TODAS LAS VENTAS<br>
                    <b>TIPO DE CLIENTE:</b> <s:property value="%{CMtipo_persona.nombre_tipo_persona}"/>
                </td>
            </tr>
        </table>
        <hr>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1">
            <tr>
                <th>#</th>
                <th>APELLIDOS Y NOMBRES DEL CLIENTE</th>
                <th>TOTAL</th>
                <th width="200">FECHA</th>

            </tr>
            <s:iterator value="%{ReporteSalidas}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center" width="30"><s:property value="snro"/></td>
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
