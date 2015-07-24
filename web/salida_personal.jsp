<%-- 
    Document   : salida_personal
    Created on : 06-jun-2013, 8:20:49
    Author     : digesitpp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<s:include id="cab.jsp" value="cab.jsp"></s:include>
<link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salida Personal</title>
    </head>
    <body>
        <s:head theme="ajax"></s:head>
        <table width="100%">
            <tr>
                <td width="50%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    <div class="error"><s:property value="resultado"/></div>
                </td>                    
            </tr>
        </table>
    <center>
        <table align="center">
                <tr><th colspan="3">REGISTRO DE VENTAS AL PERSONAL</th></tr>
                <tr><td>
                        <s:form action="registarVentaPersonal" name="venta_personal" method="post"  cssClass="alinear">
                            <s:autocompleter label="Cliente (personal)" cssStyle="select" autoComplete="true" list="listaCliente"  listKey="id_persona" listValue="nombres" keyName="id_cliente" onchange=""></s:autocompleter>
                            <s:autocompleter label="Producto" cssStyle="select" autoComplete="true" list="listaProducto"  listKey="idproducto" listValue="nombre_producto" keyName="id_producto" onchange=""></s:autocompleter>
                            <s:textfield name="cantidad" maxLength="5" label="Cantidad" size="5" value=""></s:textfield>
                            <s:hidden name="id_usuario" value="%{#session.id_usuario}"></s:hidden>
                            <s:hidden name="id_local" value="001"></s:hidden>
                            <s:hidden name="tipo_cliente" value="0002"></s:hidden>
                            <s:submit value="Añadir" name="Salida" align="center" onclick="ventaPersonal();"></s:submit>
                        </s:form>
                    </td>
                </tr>
                <tr>
                    <td><div id="salida" class="falta"></div></td>
                </tr>
            </table>
        <s:if test="%{ventana=='ver'}">
            <script LANGUAGE="JavaScript">
                alert("<s:property value="resultado"/>")
            </script>
        </s:if>
    </body>
</html>
