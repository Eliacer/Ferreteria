<%-- 
    Document   : entrada_propia
    Created on : 04-jun-2013, 12:39:01
    Author     : digesitpp
--%>


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
                        <td width="100%" align="left">
                        &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                        </td>
                    </tr>
            </table>
        </form>
        <center>
            <table align="center"><tr><th>REGISTRO DE ENTRADA PROPIA</th></tr><tr><td>
            <s:form name="entrada" action="agregarEntradaPropia" method="post" cssClass="alinear">
                <s:hidden name="id_usuario" value="%{#session.id_usuario}"></s:hidden>
                <s:textfield name="fecha" value="" maxLength="10" size="10" label="Fecha de entrada propia" cssClass="tcal" readonly="true"></s:textfield>
                <s:submit value="Aceptar" align="center" onclick="RegistrarEntrada();"></s:submit>
                <s:hidden name="CMproveedor.buscar" value=""></s:hidden>
                <s:hidden name="BCmostrador.buscar" value=""></s:hidden>
             </s:form>
            </td></tr></table>
            <div id="e_entrada" class="falta"></div>
        </center>  
        <s:if test="%{ventana=='ver'}">
        <script LANGUAGE="JavaScript">
            alert("<s:property value="resultado"/>")
        </script>
    </s:if>
</body>
</html>