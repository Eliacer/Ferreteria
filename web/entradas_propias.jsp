<%-- 
    Document   : entradas_propias
    Created on : 05-jun-2013, 12:00:00
    Author     : digesitpp
--%>
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
                    <th>N° ENTRADA</th>
                    <th>FECHA</th>
                    <th>FECHA REGISTRO</th>
                    <th>Ver</th>
                </tr>
                <s:iterator value="%{ReporteEntradas}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="snro"/>.</td>
                        <td align="left" width="100"><s:property value="identrada"/></td>
                        <td align="center" width="120"><s:property value="fecha"/></td>
                        <td align="right" width="160"><s:property value="fecha_reg"/></td>
                        <td align="center" width="50"><a href="reporteEntradaPropia.action?identrada=<s:property value="identrada"/>&BCentradadetalle.identrada=<s:property value="identrada"/>">Reporte</a></td>
                   </tr>
                </s:iterator>
            </table>
        </s:if>
        <br><br>
    </body>
</html>
