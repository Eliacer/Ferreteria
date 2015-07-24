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
        <title>Proveedores</title>
    </head>
    <body>
       <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <form name="buscar" action="proveedor.action" method="post">
        <table width="100%">
            <tr>
                <td width="50%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<s:a href="proveedor.action?buscar=">Ver lista</s:a>
                    &#9660;<s:a href="nuevoProveedor.action?buscar=">Añadir nuevo</s:a>
                    <div class="error"><s:property value="resultado"/></div>
                </td>
                <td width="50%" align="right">
                    <input type="text" name="CMproveedor.buscar" value="" size="12" maxlength="20"/>
                    <input type="submit" value="Buscar"/>
                </td>
            </tr>
        </table>
        </form>
       <s:if test="%{msg=='ver'}">
            <table align="center"  class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>NOMBRE PROVEEDOR</th>
                    <th>ESLOGAN</th>
                    <th>RUC</th>
                    <th>TELÉFONO</th>
                    <th>CELULAR</th>
                    <th>DISTRITO</th>
                    <th>DIRECCIÓN</th>
                    <th colspan="2">Opcion</th>
                </tr>
                <s:iterator value="%{ReporteProveedores}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="snro"/>.</td>
                        <td align="left"><s:property value="nombre_proveedor"/></td>
                        <td align="left"><s:property value="eslogan"/></td>
                        <td align="left" width="90"><s:property value="ruc"/></td>
                        <td align="left" width="90"><b>&#9742;</b> <s:property value="telefono"/></td>
                        <td align="left" width="90">&#x2706; <s:property value="celular"/></td>
                        <td align="left"><s:property value="id_distrito"/></td>
                        <td align="left"><s:property value="direccion"/></td>
                        <td align="center" width="50"><a href="editarProveedor.action?id_proveedor=<s:property value="id_proveedor"/>">Editar</a></td>
                        <td align="center" width="50"><a href="eliminarProveedor.action?buscar=&id_proveedor=<s:property value="id_proveedor"/>" onclick="if(!confirm('¿Eliminar?\n  Proveedor: <s:property value="nombre_proveedor"/>\n  Ruc: <s:property value="ruc"/>\n  Dirección: <s:property value="direccion"/>'))return false">Borrar</a></td>
                   </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nuevo'}">
        <center>
            <table align="center"><tr><th>NUEVO PROVEEDOR</th></tr>
                <tr><td>
            <s:form name="proveedor" action="agregarProveedor" method="post" cssClass="alinear">
                <s:hidden name="buscar" value=""></s:hidden>
                <s:textfield name="nombre_proveedor" value="" maxLength="60" size="40" label="Nombre del proveedor" cssClass="bord"></s:textfield>
                <s:textfield name="eslogan" value="" maxLength="100"  label="Eslogan" size="40" cssClass="bord"></s:textfield>
                <s:textfield name="ruc" value="" maxLength="13"  label="Ruc" size="13" cssClass="bord"></s:textfield>
                <s:textfield name="telefono" value="" maxLength="10"  label="Teléfono" size="10" cssClass="bord"></s:textfield>
                <s:textfield name="celular" value="" maxLength="10"  label="Celular" size="10" cssClass="bord"></s:textfield>
                <s:select  name="id_distrito" list="ReporteDistritos"  listKey="id_distrito" listValue="nombre_distrito" headerKey="" headerValue="" label="Distrito" cssClass="bord"></s:select>
                <s:textfield name="direccion" value="" maxLength="100"  label="Dirección" size="40" cssClass="bord"></s:textfield>
                <s:submit name="Registrar" value="Registrar" align="center" onclick="registrarProveedor();"></s:submit>
             </s:form>
            <div id="e_proveedor" class="falta"></div>
            </td></tr></table>
        </center>
        </s:elseif>
        <s:elseif test="%{msg=='editar'}">
        <center>
           <table align="center"><tr><th>NUEVO PROVEEDOR</th></tr>
                <tr><td>
            <s:form name="proveedoract" action="actualizarProveedor" method="post" cssClass="alinear">
                <s:hidden name="buscar" value=""></s:hidden>
                <s:hidden name="id_proveedor" value="%{CMproveedor.id_proveedor}"></s:hidden>
                <s:textfield name="nombre_proveedor" value="%{CMproveedor.nombre_proveedor}" maxLength="60" size="40" label="Nombre del proveedor" cssClass="bord"></s:textfield>
                <s:textfield name="eslogan" value="%{CMproveedor.eslogan}" maxLength="100"  label="Eslogan" size="40" cssClass="bord"></s:textfield>
                <s:textfield name="ruc" value="%{CMproveedor.ruc}" maxLength="13"  label="Ruc" size="13" cssClass="bord"></s:textfield>
                <s:textfield name="telefono" value="%{CMproveedor.telefono}" maxLength="10"  label="Teléfono" size="10" cssClass="bord"></s:textfield>
                <s:textfield name="celular" value="%{CMproveedor.celular}" maxLength="10"  label="Celular" size="10" cssClass="bord"></s:textfield>
                <s:select  name="CMproveedor.id_distrito" list="ReporteDistritos"  listKey="id_distrito" listValue="nombre_distrito" headerKey="" headerValue="" label="Distrito" cssClass="bord"></s:select>
                <s:textfield name="direccion" value="%{CMproveedor.direccion}" maxLength="100"  label="Dirección" size="40" cssClass="bord"></s:textfield>
                <s:submit name="Actualizar" value="Actualizar" align="center" onclick="actualizarProveedor();"></s:submit>
             </s:form>
            <div id="e_proveedor" class="falta"></div>
            </td></tr></table>
        </center>
        </s:elseif>
                 <br><br>
             <script>
                    document.proveedor.nombre_proveedor.focus()
                    document.proveedor.nombre_proveedor.select()
                </script>
    </body>
</html>
