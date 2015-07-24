<%-- 
    Document   : salida
    Created on : 28/05/2013, 10:14:03 AM
    Author     : DIGESI - TARAPOTO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<s:include id="cab.jsp" value="cab.jsp"></s:include>
    <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Salidas</title>
        </head>
        <body>
            <table width="100%">
                <tr>
                    <td width="50%" align="left">
                         &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    <div class="error"><s:property value="resultado"/></div>
                </td>                    
            </tr>
        </table>
                
    <center>
        <s:if test="%{msg=='ver'}">
            <s:form action="nuevaSalida.action" name="salidas" method="post">
                <table align="center" border="0">
                    <tr><th colspan="3">REGISTRO DE SALIDAS</th></tr>
                    <tr><td>
                            <table>
                                <s:autocompleter label="Cliente" cssStyle="select" autoComplete="false" list="listaCliente"  listKey="id_persona" listValue="nombres" keyName="BCsalida.id_cliente" onchange=""></s:autocompleter>
                                
                            </table>
                            </td>
                            <td align="left" rowspan="rowspan"><table>
                                <s:a href="nuevoCliente.action"><img src="imag/cliente.png" title="Nuevo Cliente" width="16"/></s:a>
                                </table>
                            </td>
                        </tr>
                        <tr><td colspan="2" rowspan="rowspan"><table>
                                <s:autocompleter label="Producto" cssStyle="select" autoComplete="false" list="listaProducto"  listKey="idproducto" listValue="nombre_producto" keyName="BCsalida.id_producto" onchange=""></s:autocompleter>
                                <s:textfield name="BCsalida.cantidad" maxLength="5" label="Cantidad" size="5" value=""></s:textfield>
                                <s:hidden name="BCsalida.id_usuario" value="%{#session.id_usuario}"></s:hidden>
                                <s:hidden name="BCsalida.id_local" value="BAZ01"></s:hidden>
                                <s:submit value="Añadir" name="Salida" align="center"></s:submit>
                                </table>
                            </td>
                        </tr>
                    </table>
            </s:form>
        </s:if>
        <s:elseif test="%{msg=='nuevo'}">
            <s:form action="nuevaSalidaDetalle.action" name="salidas" method="post">
                <table align="center" border="0">
                    <tr>
                        <th colspan="3">REGISTRO DE SALIDAS</th>
                    </tr>
                    <tr>
                        <s:autocompleter label="Producto" cssStyle="select" autoComplete="false" list="listaProducto"  listKey="idproducto" listValue="nombre_producto" keyName="BCsalida.id_producto" onchange=""></s:autocompleter>
                        <s:textfield name="BCsalida.cantidad" maxLength="5" label="Cantidad" size="5"></s:textfield>
                        <s:hidden name="BCsalida.id_usuario" value="%{#session.id_usuario}"></s:hidden>
                        <s:hidden name="BCsalida.id_local" value="BAZ01"></s:hidden>
                        <s:submit value="Añadir" name="Salida" align="center"></s:submit>
                    </tr>
                 </table>
            </s:form>
        </s:elseif>

        <s:elseif test="%{msg=='productos'}">
            <center>
                <table align="center" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC" width="50%">
                    <tr>
                        <th width="3%">#</th>
                        <th width="32%">DESCRIPCION</th>
                        <th width="5%">P. UNIT</th>
                        <th width="5%">TOTAL</th>
                        <th width="5%">OPCION</th>
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
                            <td align="right">S/  <s:property value="costo"/></td>
                            <td align="right">S/  <s:property value="subtotal"/></td>
                            <td align="center">
                                <b>&lt;</b><a href="editarEntradaDetalle.action?BCmostrador.buscar=&identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.id_producto=<s:property value="id_producto"/>">Editar</a><b>&gt;</b>
                                <b>&lt;</b><a href="BorrarEntradaDetalle.action?BCmostrador.buscar=&identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.identrada=<s:property value="BCentrada.identrada"/>&BCentradadetalle.id_producto=<s:property value="id_producto"/>" onclick="if(!confirm('Eliminar <s:property value="cantidad_xmay"/> <s:property value="id_unidad"/> <s:property value="nombre_producto"/>'))return false">Borrar</a><b>&gt;</b>
                            </td>
                        </tr> 
                    </s:iterator>
                </table>
            </center>
        </s:elseif>
        <s:head theme="ajax"></s:head>
    </body>
</html>
