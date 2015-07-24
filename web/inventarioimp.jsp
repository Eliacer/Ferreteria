<%-- 
    Document   : inventario
    Created on : 23-may-2013, 12:29:31
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Inventario</title>
    </head>
    <body bgcolor="white">
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <br>
        <table align="center"  cellpadding="2" cellspacing="1">
            <tr onclick="window.print();">
                <td valign="top"><img src="imag/upeu.jpg" height="60"/></td>
                <td><img src="imag/linea.png" height="55"/></td>
                <td valign="top" width="500"><b>UNIVERSIDAD PERUANA UNIÓN - TARAPOTO</b><br>
                    CAFETÍN UNIVERSITARIO <br>
                    <b>INVENTARIO ACTUAL</b><br>
                    <b>FECHA: </b><s:property value="%{BCmostrador.fecha_impresion}"/>
                </td>
            </tr>
        </table>
        <hr>
        <table align="center"  cellpadding="2" cellspacing="1" class="reporte3">
            <tr onclick="window.print();">
                <th>#</th>
                <th><b>NOMBRE PRODUCTO</b></th>
                <th><b>CODIGO</b></th>
                <th><b>STOCK</b></th>
                <th><b>COSTO</b></th>
                <th><b>VALOR COSTO</b></th>
                <th><b>PRECIO</b></th>
                <th><b>VALOR PRECIO</b></th>
            </tr>
            <s:iterator value="%{ReporteInventario}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center"><s:property value="nro"/></td>
                    <td align="left" nowrap="nowrap"><s:property value="nombre_producto"/> <s:property value="conc"/> <s:property value="id_unidad_medida"/></td>
                    <td><s:property value="codigo_producto"/></td>
                    <td align="right" width="60"><s:property value="stock"/></td>
                    <td align="right" width="60"><s:property value="costo"/></td>
                    <td align="right" width="90"><s:property value="valor_costo"/></td>
                    <td align="right" width="60"><s:property value="precio"/></td>
                    <td align="right" width="90"><s:property value="valor_precio"/></td>
                </tr>
            </s:iterator>
            <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                onmouseout="this.style.backgroundColor='White';">
                <td align="right" colspan="5">Totales </td>
                <td align="right" bgcolor="#F5F5DC">S/ <b><s:property value="%{BCmostrador.valor_costo}"/></b></td>
                <td align="right"></td>
                <td align="right"  bgcolor="#F5F5DC">S/ <b><s:property value="%{BCmostrador.valor_precio}"/></b></td>
            </tr>
            <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                onmouseout="this.style.backgroundColor='White';">
                <td align="right" colspan="7">Utilidad </td>
                <td align="right"  bgcolor="#FFFF99">S/ <b><s:property value="%{BCmostrador.utilidad}"/></b></td>
            </tr>
        </table>
        <br><br>

    </body>
</html>
