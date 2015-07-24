<%-- 
    Document   : impEntradaVista
    Created on : 14-may-2013, 9:00:49
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/impresion.css" rel="STYLESHEET"  type="text/css"/>
        <title>Impresión entrada</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <br><br>
    <center>

        <s:if test="%{BCentrada.desp ==0}">
            <s:label name="oo" value="Todabía no ha sido cargado al stock"></s:label>
            <s:form name="form" action="BuscarProductoEntrada.action" method="post">
                <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                <s:hidden name="desp" value="%{BCentrada.desp}"></s:hidden>
                    <input type="hidden" name="BCmostrador.buscar" value="" maxLength="10"/>
                    <input type="submit" value="Ir al detalle de productos" align="center"/>
            </s:form>
           <s:form name="form" action="CargarProductosStockReporte.action" method="post">
               <s:hidden name="identrada" value="%{BCentrada.identrada}"></s:hidden>
                <s:hidden name="BCentradadetalle.identrada" value="%{BCentrada.identrada}"></s:hidden>
                <s:hidden name="desp" value="%{BCentrada.desp}"></s:hidden>
                    <input type="hidden" name="BCmostrador.buscar" value="" maxLength="10"/>
            <s:submit value="Enviar Productos al stock" name="eeee"></s:submit>
           </s:form>
       </s:if>
        <s:if test="%{BCentrada.desp ==1}">
            [<s:a href="entradas.action?buscar=">Volver atrás</s:a>]<br>
            <s:label name="oo" value="Ésta compra ya fue cargado al stock"> </s:label>
       </s:if>
    </center>
    <center>
        <iframe src="impEntrada.action?identrada=<s:property value="%{BCentrada.identrada}"/>&BCentradadetalle.identrada=<s:property value="%{BCentrada.identrada}"/>" width="70%" height="500"/>
    </center>

</body>
</html>
