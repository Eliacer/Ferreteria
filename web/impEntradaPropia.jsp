<%-- 
    Document   : impEntradaPropia
    Created on : 05-jun-2013, 8:57:55
    Author     : digesitpp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>
        <title>Impresión entrada propia</title>
    </head>
    <body bgcolor="white">
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <br><br>
        <table align="center" cellpadding="1" cellspacing="1" width="60%" onclick="window.print();">
            <tr>
                <td align="center"><b>Entrada propia N° </b><s:property value="%{BCentrada.identrada}"/></td>
                <td><b>Fecha: </b> <s:property value="%{BCentrada.fecha}"/></td>
                <td><b>Fecha Registro: </b> <s:property value="%{BCentrada.fecha_reg}"/></td>
            </tr>
        </table>
        <br>
        <table align="center"  cellpadding="2" cellspacing="1" class="reporte">
            <tr>
                <th><b>CANT.</b></th>
                <th><b>UNIDAD</b></th>
                <th width="300"><b>DESCRIPCION</b></th>
                <th><b>T. UNIDADES</b></th>
             </tr>
            <s:iterator value="%{ReporteEntradaDetalles}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                   <td align="center"><b><s:property value="cantidad_xmay"/></b></td>
                    <td align="center"><s:property value="id_unidad"/></td>
                    <td align="left"><s:property value="nombre_producto"/> X <s:property value="cantidad_xmen"/></td>
                    <td align="center"><s:property value="total_unidades"/></td>
                  </tr> 
            </s:iterator>
        </table>
        <hr>
         <table align="center">
            <tr>
                <td><b>Registrador: </b> <s:property value="%{BCentrada.id_usuario}"/></td>
            </tr>
        </table>

    </body>
</html>
