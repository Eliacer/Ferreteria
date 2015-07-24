<%-- 
    Document   : entradadetalle_propia
    Created on : 04-jun-2013, 12:54:03
    Author     : digesitpp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>entrada detalle</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <s:if test="%{BCentrada.desp ==0}">
            &#9660;<a href="EliminarEntradaPropia.action?CMproveedor.buscar=&identrada=<s:property value="%{BCentrada.identrada}"/>&BCentradadetalle.identrada=<s:property value="%{BCentrada.identrada}"/>" onclick="if(!confirm('Eliminar la entrada propia <s:property value="%{BCentrada.identrada}"/>'))return false">Eliminar entrada propia</a>
        </s:if>
        <s:if test="%{BCentrada.desp ==1}">
            Ésta entrada ya ha sido enviada al Stock.... verifique bien.... No se puede actualizar...
            <META HTTP-EQUIV="Refresh" CONTENT="2;URL=entrada_propia.action"/>
        </s:if>
        <table align="center" cellpadding="1" cellspacing="1" width="60%">
            <tr>
                <td align="center"><b>Entrada propia N° </b><s:property value="%{BCentrada.identrada}"/></td>
                <td><b>Fecha: </b> <s:property value="%{BCentrada.fecha}"/></td>
                <td><b>Fecha Registro: </b> <s:property value="%{BCentrada.fecha_reg}"/></td>
            </tr>
        </table>
        <hr>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
            <tr>
                <th>CANT.</th>
                <th>UNIDAD</th>
                <th width="300">DESCRIPCION</th>
                <th>T. UNIDADES</th>
                <th>OPCIONES</th>
            </tr>
            <s:iterator value="%{ReporteEntradaDetalles}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center"><b><s:property value="cantidad_xmay"/></b></td>
                    <td align="center"><s:property value="id_unidad"/></td>
                    <td align="left"><s:property value="nombre_producto"/> X <s:property value="cantidad_xmen"/></td>
                    <td align="center"><s:property value="total_unidades"/></td>
                    <td align="center">
                        <b>&lt;</b><a href="editarEntradaDetallePropia.action?BCmostrador.buscar=&identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.id_producto=<s:property value="id_producto"/>">Editar</a><b>&gt;</b>
                        <b>&lt;</b><a href="BorrarEntradaDetallePropia.action?BCmostrador.buscar=&identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.id_producto=<s:property value="id_producto"/>" onclick="if(!confirm('Eliminar <s:property value="cantidad_xmay"/> <s:property value="id_unidad"/> <s:property value="nombre_producto"/>'))return false">Borrar</a><b>&gt;</b>
                    </td>
                </tr> 
            </s:iterator>
        </table>

        <table align="center" width="100%">
            <tr>
                <td width="100%" align="right">
                    <table>
                        <tr>
                            <td>
                                <form name="form" action="TerminarEntradaPropia.action" method="post">
                                    <input type="hidden" name="identrada" value="<s:property value="%{BCentrada.identrada}"/>"/>
                                    <input type="hidden" name="BCentradadetalle.identrada" value="<s:property value="%{BCentrada.identrada}"/>"/>
                                    <input type="submit" name="Cerrar" value="Terminar"/>
                                </form> 
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <hr>
        <table align="center"  cellpadding="2" cellspacing="1">
            <tr>
                <th witdh="400">PRODUCTO EXISTENTE</th>
            </tr>
            <tr>
                <td valign="top">
                    <s:if test="%{msg=='editar'}">
                        <s:form name="form" action="actualizarDetalleEntradaPropia.action" method="post"  cssClass="alinear">
                            <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
                            <s:hidden name="identrada" value="%{BCentradadetalle.identrada}"></s:hidden>
                            <s:hidden name="BCentradadetalle.identrada" value="%{BCentradadetalle.identrada}"></s:hidden>
                            <s:hidden name="BCentradadetalle.id_productoup" value="%{BCentradadetalle.id_producto}"></s:hidden>
                            <s:select size="4" name="BCentradadetalle.id_producto" list="ReporteProductosMostrador"  listKey="idproducto" listValue="nombre_producto" headerKey="" headerValue="" label="Producto" cssClass="bord"></s:select>
                            <s:textfield name="BCentradadetalle.cantidad_xmay" value="%{BCentradadetalle.cantidad_xmay}" maxLength="5" size="5" label="Cantidad x Mayor" cssClass="bord"></s:textfield>
                            <s:select name="BCentradadetalle.id_unidad" list="ReporteUnidades"  listKey="id_unidad" listValue="nombre_unidad" headerKey="" headerValue="" label="Unidad" cssClass="bord"></s:select>
                            <s:textfield name="BCentradadetalle.cantidad_xmen" value="%{BCentradadetalle.cantidad_xmen}" maxLength="5" size="5" label="Cantidad x Menor" cssClass="bord"></s:textfield>
                            <s:hidden name="BCentradadetalle.costo" value="0"></s:hidden>
                            <s:submit value="Actualizar" align="center"></s:submit>
                        </s:form>
                    </s:if>
                    <s:else>
                        <s:form name="buscar" action="BuscarProductoEntradaPropia.action" method="post" cssClass="alinear">
                            <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                            <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                                <input type="text" name="BCmostrador.buscar" value="" maxLength="10" class="bord"/>
                                <input type="submit" value="Buscar" align="center"/>
                        </s:form>
                        <s:form name="form" action="agregarDetalleEntradaPropia.action" method="post"  cssClass="alinear">
                            <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
                            <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                            <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                            <s:select size="4" name="BCentradadetalle.id_producto" list="ReporteProductosMostrador"  listKey="idproducto" listValue="nombre_producto" headerKey="" headerValue="" label="Producto" cssClass="select"></s:select>
                            <s:textfield name="BCentradadetalle.cantidad_xmay" value="" maxLength="5" size="5" label="Cantidad x Mayor" cssClass="bord"></s:textfield>
                            <s:select name="BCentradadetalle.id_unidad" list="ReporteUnidades"  listKey="id_unidad" listValue="nombre_unidad" headerKey="" headerValue="" label="Unidad" cssClass="bord"></s:select>
                            <s:textfield name="BCentradadetalle.cantidad_xmen" value="" maxLength="5" size="5" label="Cantidad x Menor" cssClass="bord"></s:textfield>
                            <s:hidden name="BCentradadetalle.costo" value="0"></s:hidden>
                            <s:submit value="Agregar" align="center"></s:submit>
                        </s:form>  
                    </s:else>
                </td>
             </tr>
        </table>
        <s:if test="%{msg=='producto'}">
            <script LANGUAGE="JavaScript">
                alert("<s:property value="resultado"/>")
            </script>
        </s:if>
        <script>
            document.buscar.BCmostrador.buscar.focus()
            document.buscar.BCmostrador.buscar.select()
        </script>
    </body>
</html>
