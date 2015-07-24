<%-- 
    Document   : entradadetalle
    Created on : 10-may-2013, 12:49:13
    Author     : Percy
--%>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <title>entrada detalle</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <s:if test="%{BCentrada.desp ==0}">
           &#9660;<a href="EliminarEntrada.action?CMproveedor.buscar=&identrada=<s:property value="%{BCentrada.identrada}"/>&BCentradadetalle.identrada=<s:property value="%{BCentrada.identrada}"/>" onclick="if(!confirm('Eliminar <s:property value="%{BCentrada.id_comprobante_tipo}"/>: <s:property value="%{BCentrada.nro}"/> del Proveedor <s:property value="%{BCentrada.id_proveedor}"/>'))return false">Eliminar entrada</a>
        </s:if>
        <s:if test="%{BCentrada.desp ==1}">
            Ésta entrada ya ha sido enviada al Stock.... verifique bien.... No se puede actualizar...
           <META HTTP-EQUIV="Refresh" CONTENT="2;URL=entrada.action?CMproveedor.buscar="/>
        </s:if>
       <table align="center" cellpadding="1" cellspacing="1" width="60%">
           <tr>
                <td width="320"><font color="#000080" size="3"><b><s:property value="%{BCentrada.id_proveedor}"/></b></font></td>
                <td align="center"><b>RUC. </b><s:property value="%{BCentrada.ruc}"/></td>
                <td align="center"><b><s:property value="%{BCentrada.id_comprobante_tipo}"/></b></td>
            </tr>
            <tr>
                <td><em><s:property value="%{BCentrada.eslogan}"/></em></td>
                <td align="center"><s:property value="%{BCentrada.direccion}"/> - <b><s:property value="%{BCentrada.id_distrito}"/></b></td>
                <td align="center"><b>&#8470; <font color="#FF0000"><s:property value="%{BCentrada.nro}"/></font></b></td>
            </tr>
            <tr>
                <td><b>FECHA DE COMPRA:</b> <s:property value="%{BCentrada.fecha}"/></td>
                <td align="center"><b>&#9742;</b> <s:property value="%{BCentrada.telefono}"/> <b>&#x2706;</b> <s:property value="%{BCentrada.celular}"/></td>
                <td align="center"><b>Regist. </b> <s:property value="%{BCentrada.id_usuario}"/></td>
            </tr>
        </table>
        <hr>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
            <tr>
                <th>CANT.</th>
                <th>UNIDAD</th>
                <th width="300">DESCRIPCION</th>
                <th>T. UNIDADES</th>
                <th>C./UNIDAD</th>
                <th>PRECIO</th>
                <th>C. UNIT</th>
                <th>P.TOTAL</th>
                <th>OPCIONES</th>
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
            <tr>
                <td align="right" colspan="7">Sub Total:  </td>
                <td align="right" bgcolor="White">S/  <b><s:property value="%{BCentrada.sub_total}"/></b></td>
            </tr>
            <tr>
                <td align="right"  colspan="7">Igv (%)</td>
                <td align="right" bgcolor="White">S/  <b><s:property value="%{BCentrada.igv}"/></b></td>
            </tr>
            <tr>
                <td align="right" colspan="7">Total: </td>
                <td align="right" bgcolor="White">S/  <b><s:property value="%{BCentrada.total}"/></b></td>
            </tr>
        </table>

        <table align="center" width="100%">
            <tr>
                <td width="100%" align="center">
                    <table>
                        <tr>
                            <td>
                                <form name="form" action="CalcularIgvEntrada.action" method="get">
                                    <input type="hidden" name="identrada" value="<s:property value="%{BCentrada.identrada}"/>"/>
                                    <input type="hidden" name="BCentradadetalle.identrada" value="<s:property value="%{BCentrada.identrada}"/>"/>
                                    <input type="hidden" name="BCmostrador.buscar" value=""/> 
                                        IGV (%)<input type="text" name="igv" value="18" maxlength="2" size="2" class="bord"/>
                                        <input type="submit" name="Calcular" value="Calcular"/>
                                    </form>
                                </td>
                                <td>
                                    <form name="form" action="TerminarEntrada.action" method="post">
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
                <th witdh="400">NUEVO PRODUCTO</th>
            </tr>
            <tr>
                <td valign="top">
                    <s:if test="%{msg=='editar'}">
                    <s:form name="form" action="actualizarDetalleEntrada.action" method="post"  cssClass="alinear">
                        <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
                        <s:hidden name="identrada" value="%{BCentradadetalle.identrada}"></s:hidden>
                        <s:hidden name="BCentradadetalle.identrada" value="%{BCentradadetalle.identrada}"></s:hidden>
                        <s:hidden name="BCentradadetalle.id_productoup" value="%{BCentradadetalle.id_producto}"></s:hidden>
                        <s:select size="4" name="BCentradadetalle.id_producto" list="ReporteProductosMostrador"  listKey="idproducto" listValue="nombre_producto" headerKey="" headerValue="" label="Producto" cssClass="bord"></s:select>
                        <s:textfield name="BCentradadetalle.cantidad_xmay" value="%{BCentradadetalle.cantidad_xmay}" maxLength="5" size="5" label="Cantidad x Mayor" cssClass="bord"></s:textfield>
                        <s:select name="BCentradadetalle.id_unidad" list="ReporteUnidades"  listKey="id_unidad" listValue="nombre_unidad" headerKey="" headerValue="" label="Unidad" cssClass="bord"></s:select>
                        <s:textfield name="BCentradadetalle.cantidad_xmen" value="%{BCentradadetalle.cantidad_xmen}" maxLength="5" size="5" label="Cantidad x Menor" cssClass="bord"></s:textfield>
                        <s:textfield name="BCentradadetalle.costo" value="%{BCentradadetalle.costo}" maxLength="5" size="5" label="Costo x Mayor" cssClass="bord"></s:textfield>
                        <s:submit value="Actualizar" align="center"></s:submit>
                    </s:form>
                    </s:if>
                    <s:else>
                    <s:form name="buscar" action="BuscarProductoEntrada.action" method="post" cssClass="alinear">
                        <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                        <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                        <input type="text" name="BCmostrador.buscar" value="" maxLength="10" class="bord"/>
                        <input type="submit" value="Buscar" align="center"/>
                    </s:form>
                      <s:form name="form" action="agregarDetalleEntrada.action" method="post"  cssClass="alinear">
                        <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
                        <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                        <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                        <s:select size="4" name="BCentradadetalle.id_producto" list="ReporteProductosMostrador"  listKey="idproducto" listValue="nombre_producto" headerKey="" headerValue="" label="Producto" cssClass="select"></s:select>
                        <s:textfield name="BCentradadetalle.cantidad_xmay" value="" maxLength="5" size="5" label="Cantidad x Mayor" cssClass="bord"></s:textfield>
                        <s:select name="BCentradadetalle.id_unidad" list="ReporteUnidades"  listKey="id_unidad" listValue="nombre_unidad" headerKey="" headerValue="" label="Unidad" cssClass="bord"></s:select>
                        <s:textfield name="BCentradadetalle.cantidad_xmen" value="" maxLength="5" size="5" label="Cantidad x Menor" cssClass="bord"></s:textfield>
                        <s:textfield name="BCentradadetalle.costo" value="" maxLength="5" size="5" label="Costo x Mayor" cssClass="bord"></s:textfield>
                        <s:submit value="Agregar" align="center"></s:submit>
                    </s:form>  
                    </s:else>
                </td>
                <td valign="top">
                    <s:form name="form" action="agregarProductoEntradaDetalle.action" method="post" cssClass="alinear">
                        <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                        <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                        <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
                        <s:hidden name="buscar" value=""></s:hidden>

                        <s:textfield name="BCproducto.nombre_producto" value="" maxLength="50" size="35" label="Nombre" cssClass="bord"></s:textfield>
                        <s:textfield name="BCproducto.conc" value="" maxLength="6" size="6" label="Concen." cssClass="bord"></s:textfield>
                        <s:select name="BCproducto.id_unidad_medida" list="ReporteUnidades_medida"  listKey="id_unidad_medida" listValue="descripcion" headerKey="" headerValue="" label="Unidad de medida" cssClass="bord"></s:select>
                        <s:textfield name="BCproducto.codigo_producto" value="" maxLength="15" size="15" label="Código" cssClass="bord"></s:textfield>
                        <s:textarea name="BCproducto.descripcion" cols="35" rows="2" label="Descripción" cssClass="bord"></s:textarea>
                        <s:hidden name="BCproducto.valor_pre" value="0"></s:hidden>
                        <s:select  name="BCproducto.idcategoria" list="ReporteCategoria"  listKey="idcategoria" listValue="nombre" headerKey="" headerValue="" label="Categoría" cssClass="bord"></s:select>
                        <s:hidden name="BCproducto.costo" value="0"></s:hidden>
                        <s:hidden name="BCproducto.precio" value="0"></s:hidden>
                        <s:textfield name="BCproducto.prec_porc" value="25" maxLength="4" size="4" label="Precio (%)" cssClass="bord"></s:textfield>
                        <s:submit value="Agregar" align="center"></s:submit>
                    </s:form>
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
