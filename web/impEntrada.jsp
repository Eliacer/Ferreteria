<%-- 
    Document   : impEntrada
    Created on : 14-may-2013, 8:45:49
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>
        <title>Impresión entrada</title>
    </head>
    <body bgcolor="white">
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <br><br>
        <table align="center" class="reporte2"  onclick="window.print();">
            <tr>
                <td width="250" nowrap><font color="#000080" size="3"><b><s:property value="%{BCentrada.id_proveedor}"/></b></font></td>
                <td align="center" width="200"><b>RUC. </b><s:property value="%{BCentrada.ruc}"/></td>
                <td align="center" width="200"><b><s:property value="%{BCentrada.id_comprobante_tipo}"/></b></td>
            </tr>
            <tr>
                <td><em><s:property value="%{BCentrada.eslogan}"/></em></td>
                <td align="center"><s:property value="%{BCentrada.direccion}"/> - <b><s:property value="%{BCentrada.id_distrito}"/></b></td>
                <td align="center"><b>&#8470; <font color="#FF0000"><s:property value="%{BCentrada.nro}"/></font></b></td>
            </tr>
            <tr>
                <td><b>FECHA COMPRA:</b> <s:property value="%{BCentrada.fecha}"/></td>
                <td align="center"><b>&#9742;</b> <s:property value="%{BCentrada.telefono}"/> <b>&#x2706;</b> <s:property value="%{BCentrada.celular}"/></td>
                <td align="center"><b>Regis.: </b> <s:property value="%{BCentrada.id_usuario}"/></td>
            </tr>
        </table>
        <hr>
        <table align="center"  cellpadding="2" cellspacing="1" class="reporte">
            <tr>
                <th><b>CANT.</b></th>
                <th><b>UNIDAD</b></th>
                <th><b>DESCRIPCION</b></th>
                <th><b>T. UNID. </b></th>
                <th><b>C./UNIDAD</b></th>
                <th><b>PRECIO</b></th>
                <th><b>C. UNIT</b></th>
                <th><b>P.TOTAL</b></th>
            </tr>
            <s:iterator value="%{ReporteEntradaDetalles}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center"><b><s:property value="cantidad_xmay"/></b></td>
                    <td align="center"><s:property value="id_unidad"/></td>
                    <td align="left"><s:property value="nombre_producto"/> X <s:property value="cantidad_xmen"/></td>
                    <td align="center"><s:property value="total_unidades"/></td>
                    <td align="right"><font color="blue"><b>S/  </b><s:property value="costo_unitario"/></font></td>
                    <td align="right"><font color="green"><b>S/  </b><s:property value="precio_unitario"/>0</font></td>
                    <td align="right">S/  <b><s:property value="costo"/></b></td>
                    <td align="right">S/  <b><s:property value="subtotal"/></b></td>
                </tr> 
            </s:iterator>
            <tr>
                <td align="right" colspan="7">Sub Total:  </td>
                <td align="right" bgcolor="White">S/  <b><s:property value="%{BCentrada.sub_total}"/></b></td>
            </tr>
            <tr>
                <td align="right"  colspan="7">Igv (%)</td>
                <td align="right" bgcolor="White">S/  <b><s:property value="%{BCentrada.igv}"/></b></td>
            </tr>
            <tr>
                <td align="right" colspan="7">Total: </td>
                <td align="right" bgcolor="White">S/  <b><s:property value="%{BCentrada.total}"/></b></td>
            </tr>
        </table>
        <hr>
    </body>
</html>
