<%-- 
    Document   : salida_personal_imp
    Created on : 10-jun-2013, 12:41:46
    Author     : digesitpp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VentaPerImp</title>
    </head>
    <body bgcolor="white">
        <br>
        <table align="center" >
            <tr onclick="window.print();">
                <td align="left"><b>UNIVERSIDAD PERUANA UNIÓN</b></td>  
                <td width="100"></td>
                <td align="left"><b>FECHA: </b> <s:property value="%{BCsalida.fecha_reg}"/></td>                    
            </tr>
            <tr>
                <td align="left">CAFETÍN UPEU</td> 
                <td></td>
                <td align="left"><b>Vendedor:</b> <s:property value="%{BCsalida.id_usuario}"/></td>                    
            </tr>
            <tr>
                <td align="left"><b>CLIENTE: </b> <s:property value="%{BCsalida.id_cliente}"/></td> 
                <td></td>
                <td align="left"></td>                    
            </tr>
        </table>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
            <tr>
                <th>CANT.</th>
                <th width="300">DESCRIPCION</th>
                <th>P. UNIT</th>
                <th>TOTAL</th>
            </tr>
            <s:iterator value="%{ReporteSalidaDetalles}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center"><b><s:property value="cantidad"/></b></td>
                    <td width="300"><s:property value="nombre_product"/></td>
                    <td align="right"><s:property value="precio"/></td>
                    <td align="right"><s:property value="subtotal"/></td>
                </tr> 
            </s:iterator>
            <tr>
                <td colspan="3" align="right"><b>Sub Total </b></td>
                <td align="right" bgcolor="white">S/ <s:property value="%{BCsalida.sub_total}"/></td>
            </tr> 
            <tr>
                <td colspan="3" align="right"><b>Igv </b></td>
                <td align="right" bgcolor="white">S/ <s:property value="%{BCsalida.igv}"/></td>
            </tr> 
            <tr>
                <td colspan="3" align="right"><b>Total </b></td>
                <td align="right" bgcolor="yellow">S/ <b><s:property value="%{BCsalida.total}"/></b></td>
            </tr> 
        </table>

    </body>
</html>
