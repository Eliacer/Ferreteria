<%-- 
    Document   : ReporteSalidasDosFechasClienteImp
    Created on : 12-jun-2013, 16:18:06
    Author     : digesitpp
--%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas entre 2 fechas por cliente</title>
    </head>
    <body>
        <br>
        <table align="center"  cellpadding="2" cellspacing="1">
            <tr onclick="window.print();">
                <td valign="top"><img src="imag/upeu.jpg" height="60"/></td>
                <td><img src="imag/linea.png" height="55"/></td>
                <td valign="top" width="500"><b>UNIVERSIDAD PERUANA UNIÓN - TARAPOTO</b><br>
                    CAFETÍN UNIVERSITARIO <br>
                    <b>REPORTE:</b> SUMATORIA DE VENTAS POR CLIENTE<br>
                    <b>TIPO DE CLIENTE:</b> <s:property value="%{CMtipo_persona.nombre_tipo_persona}"/><br>
                    <b>FECHA INICIAL:</b> <s:property value="%{fecha_ini}"/><br>
                    <b>FECHA FINAL:</b> <s:property value="%{fecha_fin}"/><br>
                    
                </td>
            </tr>
        </table>
        <hr>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1">
            <tr>
                <th><b>#</b></th>
                <th><b>APELLIDOS Y NOMBRES DEL CLIENTE</b></th>
                <th width="100"><b>DNI</b></th>
                <th><b>TOTAL</b></th>


            </tr>
            <s:iterator value="%{ReporteSalidasDosFechasCliente}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center" width="18"><s:property value="snro"/></td>
                    <td align="left"><s:property value="id_cliente"/></td>
                    <td align="center"><s:property value="fecha_reg"/></td>
                    <td align="right"><s:property value="total"/></td>
                </tr> 
            </s:iterator>
            <tr>
                <td colspan="3"></td>
                <td align="right" bgcolor="yellow">S/ <b><s:property value="%{BCsalida.total}"/></b></td>
            </tr>
        </table>
    </body>
</html>
