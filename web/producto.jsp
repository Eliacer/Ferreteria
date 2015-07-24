<%-- 
    Document   : producto
    Created on : 07-may-2013, 12:33:43
    Author     : Eliacer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Productos</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
            <form name="form" action="Producto.action" method="post">
                <table width="100%">
                    <tr>
                        <td width="50%" align="left">
                        &#9660;<s:a href="Inicio.action?Usuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                        &#9660;<s:a href="Producto.action?buscar=">Ver lista</s:a>
                        &#9660;<s:a  href="NuevoProducto.action">Nuevo producto</s:a>
                        
                        </td>
                    <td width="50%" align="right">
                        <input type="text" name="buscar" value="" size="12" maxlength="20"/>
                        <input type="submit" value="Buscar"/>
                    </td>
                </tr>
            </table>
        </form>
        <s:if test="%{sms=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC" >
                <tr>
                    <th>#</th>
                    <th>NOMBRE PRODUCTO</th>
                    <th>CÓDIGO</th>
                    <th>MARCA</th>
                    <th>COSTO</th>
                    <th>PRECIO</th>
                    <th>PREC. PORC</th>
                    <th>ESTADO</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReporteProducto}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';" title="<s:property value="descripcion"/>">
                        <td align="center" width="25"><s:property value="codigo"/></td>
                        <td align="left" width="220"><s:property value="nombre"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="codigo"/></td>
                        <td nowrap="nowrap" align="left"><s:property value="id_marca"/></td>
                        <td nowrap="nowrap" align="right" width="60"><s:property value="stock_actual"/></td>
                        <td nowrap="nowrap" align="right" width="60"><s:property value="precio"/></td>
                        <td nowrap="nowrap" align="center"><s:property value="porc_ganacia"/>%</td>
                        <td nowrap="nowrap" align="center" width="30"><s:property value=""/></td>
                        <td nowrap="nowrap" align="center"><a href="EditarProducto.action?id_producto=<s:property value="id_producto"/>"><img src="imag/editar.png" height="16" title="Editar"/></a></td>
                        <td nowrap="nowrap"align="center"><a href="EliminarProducto.action?buscar=&id_producto=<s:property value="id_producto"/>" onclick="if(!confirm('Eliminar el producto: \n  <s:property value="nombre"/>'))return false"><img src="imag/borrar.png" height="16" title="Borrar"/></a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{sms=='nueva'}">
        <center>
            <table align="center"><tr><th width="400">NUEVO PRODUCTO</th></tr>
                <tr><td>
            <s:form name="producto" action="AgregarProducto" method="get" cssClass="alinear">
                <s:hidden name="buscar" value=""></s:hidden>
                <s:textfield name="nombre" value="" maxLength="50" size="35" label="Nombre" cssClass="bord"></s:textfield>
                <s:textfield name="codigo" value="" maxLength="15" size="15" label="Código" cssClass="bord"></s:textfield>
                <s:textfield name="porc_ganacia" value="25" maxLength="4" size="4" label="Porc. Ganancia (%)" cssClass="bord"></s:textfield>
                <s:select name="id_unidad_medida" list="ReporteUndMedida"  listKey="idUndMedida" listValue="nombre" headerKey="" headerValue="" label="Unidad de medida" cssClass="bord"></s:select>
                <s:select name="id_categoria" list="ReporteCategoria"  listKey="idCategoria" listValue="nombreCategoria" headerKey="" headerValue="" label="Categoria" cssClass="bord"></s:select>
                <s:select  name="id_marca" list="ReporteMarca"  listKey="idMarca" listValue="nombreMarca" headerKey="" headerValue="" label="Marca" cssClass="bord"></s:select>
                <s:select  name="id_ubicacion" list="ReporteUbicacion"  listKey="id_ubicacion" listValue="nombre_ubicacion" headerKey="" headerValue="" label="Ubicación" cssClass="bord"></s:select>
                <s:textarea name="descripcion" cols="35" rows="2" label="Descripción" cssClass="bord"></s:textarea>
                <s:submit name="Agregar" value="Agregar" align="center" onclick="registrar_producto();"></s:submit>
            </s:form>
                        
            <div id="e_producto" class="falta"></div>
            </td></tr>
            </table>
        </center>
    </s:elseif>

    <s:elseif test="%{sms=='editar'}">
        <center>
            <table align="center"><tr><th width="400">ACTUALIZAR PRODUCTO</th>
                </tr><tr><td>
            <s:form name="form" action="ActualizarProducto" method="post" cssClass="alinear">
                <s:hidden name="buscar" value=""></s:hidden>
                <s:hidden name="id_producto" value="%{Producto.id_producto}"></s:hidden>
                <s:textfield name="nombre" value="%{Producto.nombre}" maxLength="50" size="35" label="Nombre" cssClass="bord"></s:textfield>
                <s:textfield name="codigo" value="%{Producto.codigo}" maxLength="15" size="15" label="Código" cssClass="bord"></s:textfield>
                <s:textfield name="porc_ganacia" value="%{Producto.porc_ganacia}" maxLength="4" size="4" label="Porc. Ganancia (%)" cssClass="bord"></s:textfield>
                <s:select name="Producto.id_unidad_medida" list="ReporteUndMedida"  listKey="idUndMedida" listValue="nombre" headerKey="" headerValue="" label="Unidad de medida" cssClass="bord"></s:select>
                <s:select name="Producto.id_categoria" list="ReporteCategoria"  listKey="idCategoria" listValue="nombreCategoria" headerKey="" headerValue="" label="Categoria" cssClass="bord"></s:select>
                <s:select  name="Producto.id_marca" list="ReporteMarca"  listKey="idMarca" listValue="nombreMarca" headerKey="" headerValue="" label="Marca" cssClass="bord"></s:select>
                <s:select  name="Producto.id_ubicacion" list="ReporteUbicacion"  listKey="id_ubicacion" listValue="nombre_ubicacion" headerKey="" headerValue="" label="Ubicación" cssClass="bord"></s:select>
                <s:textarea name="descripcion" cols="35" rows="2" label="Descripción" cssClass="bord" value="%{Producto.descripcion}"></s:textarea>
                <s:submit name="Actualizar" value="Actualizar" align="center" onclick="registrar_producto();"></s:submit>
            </s:form>
                        
            
            <div id="e_producto" class="falta"></div>
            </td></tr></table>
        </center>
    </s:elseif>
                    <br><br>
</body>
</html>
