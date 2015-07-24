
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <link rel="stylesheet" type="text/css" href="js/calendar/tcal.css" />
        <script type="text/javascript" src="js/calendar/tcal.js"></script>
        <title>Registrar entradas</title>
       
    </head>
    <body>
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
            <form name="form" action="entrada.action" method="post">
                <table width="100%">
                    <tr>
                        <td width="50%" align="left">
                        &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                        </td>
                    <td width="50%" align="right">
                        <input type="text" name="CMproveedor.buscar" value="" size="12" maxlength="20"/>
                        <input type="submit" value="Buscar"/>
                    </td>
                </tr>
            </table>
        </form>
        <s:if test="%{msg=='nueva'}">
        <center>
            <table align="center"><tr><th>REGISTRO DE COMPRA</th></tr><tr><td>
            <s:form name="entrada" action="agregarEntrada" method="post" cssClass="alinear">
                <s:hidden name="id_usuario" value="%{#session.id_usuario}"></s:hidden>
                <s:textfield name="nro" value="" maxLength="10" size="10" label="N° Doc." cssClass="bord"></s:textfield>
               <s:select   name="id_comprobante_tipo" list="ReporteComprobante_tipo"  listKey="id_comprobante_tipo" listValue="nombre" headerKey="" headerValue="" label="Tipo Comprob" cssClass="bord"></s:select>
               <s:autocompleter label="Proveedor" cssStyle="select" autoComplete="false" list="ReporteProveedores"  listKey="id_proveedor" listValue="nombre_proveedor" keyName="id_proveedor" onchange=""></s:autocompleter>
                <s:textfield name="fecha" value="" maxLength="10" size="10" label="Fecha" cssClass="tcal" readonly="true"></s:textfield>
                <s:submit value="Aceptar" align="center" onclick="RegistrarEntrada();"></s:submit>
                <s:hidden name="CMproveedor.buscar" value=""></s:hidden>
                <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
             </s:form>
            </td></tr></table>
            <div id="e_entrada" class="falta"></div>
        </center>
    </s:if>
        <s:head theme="ajax"></s:head>   
        <s:if test="%{ventana=='ver'}">
        <script LANGUAGE="JavaScript">
            alert("<s:property value="resultado"/>")
        </script>
    </s:if>
</body>
</html>