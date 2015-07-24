<%-- 
    Document   : producto
    Created on : 07-may-2013, 12:33:43
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Mostrador</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
            <form name="form" action="mostrador.action" method="post">
                <table width="100%">
                    <tr>
                        <td width="50%" align="left">
                            &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                        &#9660;<s:a href="mostrador.action?buscar=">Ver lista</s:a>
                        <div class="error"><s:property value="resultado"/></div>
                    </td>
                    <td width="50%" align="right">
                        <input type="text" name="buscar" value="" size="12" maxlength="20"/>
                        <input type="submit" value="Buscar"/>
                    </td>
                </tr>
            </table>
        </form>
        <s:if test="%{msg=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC" >
                <tr>
                    <th>#</th>
                    <th>NOMBRE PRODUCTO</th>
                    <th>COSTO</th>
                    <th>PRECIO</th>
                    <th>STOCK MÍN</th>
                    <th>STOCK</th>
                    <th>OPCION</th>
                </tr>
                <s:iterator value="%{ReporteProductosMostrador}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="nro"/></td>
                        <td align="left" width="300"><s:property value="nombre_producto"/></td>
                        <td nowrap="nowrap" align="right" wtdth="60">S/ <b><s:property value="costo"/></b></td>
                        <td nowrap="nowrap" align="right" wtdth="60">S/ <b><s:property value="precio"/></b></td>
                        <td nowrap="nowrap" align="right" wtdth="60"><s:property value="stock_min"/></td>
                        <td nowrap="nowrap" align="right" wtdth="40"><b><s:property value="stock"/></b></td>
                        <td nowrap="nowrap" align="center"><a href="editarMostrador.action?idproducto=<s:property value="idproducto"/>"><img src="imag/editar.png" height="16" title="Editar"/></a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='editar'}">
        <center>
            <table align="center"><tr><th>ACTUALIZAR STOCK DE PRODUCTO</th></tr>
                <tr><td>
                        <s:form name="form" action="actualizarMostrador" method="post" cssClass="alinear">
                            <s:hidden name="buscar" value=""></s:hidden>
                            <s:hidden name="idproducto" value="%{BCmostrador.idproducto}"></s:hidden>
                            <s:hidden name="BCmostrador.id_local" value="%{BCmostrador.id_local}"></s:hidden>
                            <s:textfield name="nombre_producto" value="%{BCmostrador.nombre_producto}" maxLength="50" size="35" label="Producto" disabled="true"></s:textfield>
                            <s:textfield name="costo" value="%{BCmostrador.costo}" maxLength="4" size="4" label="Costo"></s:textfield>
                            <s:textfield name="precio" value="%{BCmostrador.precio}" maxLength="4" size="4" label="Precio"></s:textfield>
                            <s:textfield name="BCmostrador.stock_min" value="%{BCmostrador.stock_min}" maxLength="4" size="4" label="Stock mín"></s:textfield>
                            <s:textfield name="BCmostrador.stock" value="%{BCmostrador.stock}" maxLength="4" size="4" label="Stock"></s:textfield>
                            <s:submit name="Actualizar" value="Actualizar" align="center"></s:submit>
                        </s:form>
                        <div id="e_producto" class="falta"></div>

                    </td></th></table>
        </center>
    </s:elseif>
    <br><br>

</body>
</html>
