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
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Inventario</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <form name="form" action="mostrador.action" method="post">
        <table width="100%">
            <tr>
                <td width="100%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<a href="inventarioimp.action" target="_blank">Imprimir</a> 
                 </td>
            </tr>
        </table>
        </form>
       <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC" >
                <tr>
                    <th>#</th>
                    <th>NOMBRE PRODUCTO</th>
                    <th>CONC</th>
                    <th>UNID MEDID</th>
                    <th>COD PRODUCTO</th>
                    <th>STOCK</th>
                    <th>COSTO</th>
                    <th>VALOR COSTO</th>
                    <th>PRECIO</th>
                    <th>VALOR PRECIO</th>
                </tr>
                <s:iterator value="%{ReporteInventario}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="nro"/>.</td>
                        <td align="left"><s:property value="nombre_producto"/></td>
                        <td><s:property value="conc"/></td>
                        <td><s:property value="id_unidad_medida"/></td>
                        <td><s:property value="codigo_producto"/></td>
                        <td align="right" width="60"><s:property value="stock"/></td>
                        <td align="right" width="60"> <s:property value="costo"/></td>
                        <td align="right" width="90"> <s:property value="valor_costo"/></td>
                        <td align="right" width="60"> <s:property value="precio"/></td>
                        <td align="right" width="90"> <s:property value="valor_precio"/></td>
                     </tr>
                </s:iterator>
                     <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                         <td align="right" colspan="7">Totales </td>
                         <td align="right" bgcolor="#F5F5DC">S/ <b><s:property value="%{BCmostrador.valor_costo}"/></b></td>
                         <td align="right"></td>
                         <td align="right"  bgcolor="#F5F5DC">S/ <b><s:property value="%{BCmostrador.valor_precio}"/></b></td>
                     </tr>
                     <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                         <td align="right" colspan="9">Utilidad </td>
                         <td align="right"  bgcolor="#FFFF99">S/ <b><s:property value="%{BCmostrador.utilidad}"/></b></td>
                     </tr>
            </table>
                 <br><br>
    
    </body>
</html>
