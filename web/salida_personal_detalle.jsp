<%-- 
    Document   : salida_personal_detalle
    Created on : 06-jun-2013, 12:12:59
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
        <title>Salida detalle Personal</title>
    </head>
    <body>
        <s:head theme="ajax"></s:head>
        <table align="center">
            <tr>
                <td align="left"><b>CAFETÍN UNIVERSIDAD PERUANA UNIÓN</b></td>  
                <td width="100"></td>
                <td align="left"><b>Fecha:</b> <s:property value="%{BCsalida.fecha_reg}"/></td>                    
            </tr>
            <tr>
                <td align="left">TARAPOTO - SAN MARTÍN</td> 
                <td></td>
                <td align="left"><b>Vendedor:</b> <s:property value="%{BCsalida.id_usuario}"/></td>                    
            </tr>
            <tr>
                <td align="left"><b>Cliente (personal):</b> <s:property value="%{BCsalida.id_cliente}"/></td> 
                <td></td>
                <td align="left"></td>                    
            </tr>
        </table>
        <hr>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
            <tr>
                <th>CANT.</th>
                <th width="300">DESCRIPCION</th>
                <th>P. UNIT</th>
                <th>TOTAL</th>
                <th colspan="2">OPCIONES</th>
            </tr>
            <s:iterator value="%{ReporteSalidaDetalles}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center"><b><s:property value="cantidad"/></b></td>
                    <td width="300"><s:property value="nombre_product"/></td>
                    <td align="right"><s:property value="precio"/></td>
                    <td align="right"><s:property value="subtotal"/></td>
                    <td align="center"><a href="editarSalidaDetalle.action?id_salida=<s:property value="BCsalida.id_salida"/>&id_producto=<s:property value="id_producto"/>"><img src="imag/editar.png" height="16" title="Editar"/></a></td>
                    <td align="center"><a href="borrarSalidaDetalle.action?id_salida=<s:property value="BCsalida.id_salida"/>&id_producto=<s:property value="id_producto"/>" onclick="if(!confirm('Eliminar <s:property value="cantidad"/> <s:property value="nombre_product"/>'))return false"><img src="imag/borrar.png" height="16" title="Borrar"/></a>
                    </td>
                </tr> 
            </s:iterator>
            <tr>
                <td colspan="3" align="right"><b>Sub Total </b></td>
                <td align="right" bgcolor="white">S/ <s:property value="%{BCsalida.sub_total}"/></td>
                <td align="center"></td>
            </tr> 
            <tr>
                <td colspan="3" align="right"><b>Igv </b></td>
                <td align="right" bgcolor="white">S/ <s:property value="%{BCsalida.igv}"/></td>
                <td align="center"></td>
            </tr> 
            <tr>
                <td colspan="3" align="right"><b>Total </b></td>
                <td align="right" bgcolor="yellow">S/ <b><s:property value="%{BCsalida.total}"/></b></td>
                <td align="center"></td>
            </tr> 
        </table>
        <table align="center">
            <tr>
                <td>
                    <form name="anular" action="AnularSalida.action" method="post">
                        <input type="hidden" name="id_salida" value="<s:property value="%{BCsalida.id_salida}"/>"/>
                        <input type="submit" name="Anular" value="Anular venta" onclick="if(!confirm('¿Anular la venta al personal?'))return false"/>
                    </form>
                </td>
                <td>
                    <form name="anular" action="TerminarSalida.action" method="post">
                        <input type="hidden" name="id_salida" value="<s:property value="%{BCsalida.id_salida}"/>"/>
                        <input type="submit" name="Terminar" value="Terminar"/>
                    </form>
                </td>
            </tr>
        </table>
        <hr>
        <s:if test="%{nuevo=='editar'}">
            <table align="center">
                <tr><th colspan="3">ACTUALIZAR PRODUCTO</th></tr>
                <tr><td>
                        <s:form action="actualizarVentaDetallePersonal" name="venta_personal" method="post"  cssClass="alinear">
                            <s:hidden name="id_salida" value="%{BCsalida.id_salida}"></s:hidden>
                            <s:hidden name="id_producto" value="%{BCsalidadetalle.idproducto}"></s:hidden>
                            <s:hidden name="id_local" value="001"></s:hidden>
                            <s:textfield label="Producto" cssStyle="select" value="%{BCsalidadetalle.nombre_product}" size="40" disabled="true"></s:textfield>
                            <s:textfield name="cantidad" maxLength="5" label="Cantidad" size="5" value="%{BCsalidadetalle.cantidad}"></s:textfield>
                            <s:submit value="Actualizar" name="Salida" align="center" onclick="ventaPersonal();"></s:submit>
                        </s:form>
                    </td>
                </tr>
                <tr>
                    <td><div id="salida" class="falta"></div></td>
                </tr>
            </table>
        </s:if>
        <s:else>
            <table align="center">
                <tr><th colspan="3">AGREGAR PRODUCTOS</th></tr>
                <tr><td>
                        <s:form action="registarVentaDetallePersonal" name="venta_personal" method="post"  cssClass="alinear">
                            <s:autocompleter label="Producto" cssStyle="select"  list="listaProducto"  listKey="idproducto" listValue="nombre_producto" keyName="id_producto" onchange="" onclick="ventaPersonal();"></s:autocompleter>
                            <s:textfield name="cantidad" maxLength="5" label="Cantidad" size="5" value=""></s:textfield>
                            <s:hidden name="id_salida" value="%{BCsalida.id_salida}"></s:hidden>
                            <s:hidden name="id_local" value="001"></s:hidden>
                            <s:submit value="Añadir" name="Salida" align="center" onclick="ventaPersonal();"></s:submit>
                        </s:form>
                    </td>
                </tr>
                <tr>
                    <td><div id="salida" class="falta"></div></td>
                </tr>
            </table>
        </s:else>
        <s:if test="%{ventana=='ver'}">
            <script LANGUAGE="JavaScript">
                alert("<s:property value="resultado"/>")
            </script>
        </s:if>
    </body>
</html>