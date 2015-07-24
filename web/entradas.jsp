<%-- 
    Document   : proveedor
    Created on : 10-may-2013, 9:20:17
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de entradas</title>
    </head>
    <body>
       <%@taglib uri="/struts-tags" prefix="s"%> 
       <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <table width="100%">
            <tr>
                <td width="100%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<s:a href="entradas.action?buscar=">Ver lista</s:a>
                    <div class="error"><s:property value="resultado"/></div>
                </td>
                
            </tr>
        </table>
       <s:if test="%{msg=='ver'}">
            <table align="center"  class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>N° DOC.</th>
                    <th>PROVEEDOR</th>
                    <th>FECHA</th>
                    <th>SUB_TOTAL</th>
                    <th>IGV</th>
                    <th>TOTAL</th>
                    <th>Ver</th>
                </tr>
                <s:iterator value="%{ReporteEntradas}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="snro"/>.</td>
                        <td align="left" width="90"><s:property value="nro"/></td>
                        <td align="left" width="300"><s:property value="id_proveedor"/></td>
                        <td align="center" width="150"><s:property value="fecha"/></td>
                        <td align="right" width="100">S/. <s:property value="sub_total"/></td>
                        <td align="right" width="100">S/. <s:property value="igv"/></td>
                        <td align="right" width="100">S/. <s:property value="total"/></td>
                        <td align="center" width="50"><a href="reporteEntrada.action?identrada=<s:property value="identrada"/>&BCentradadetalle.identrada=<s:property value="identrada"/>"><img src="imag/report.png" height="17" title="Ver Reporte"/></a></td>
                   </tr>
                </s:iterator>
                <tr>
                    <td colspan="6"></td>
                    <td align="right" bgcolor="yellow">S/. <b><s:property value="%{BCentrada.total}"/></b></td>
                    <td></td>
                </tr>
            </table>
        </s:if>
        <br><br>
    </body>
</html>
