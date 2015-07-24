<%-- 
    Document   : ReporteSalidasDosFechas
    Created on : 11-jun-2013, 16:30:26
    Author     : digesitpp
--%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<s:include id="cab.jsp" value="cab.jsp"></s:include>
<link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="js/calendar/tcal.css" />
        <script type="text/javascript" src="js/calendar/tcal.js"></script>
        <title>Todas las ventas diarias entre 2 fechas</title>
        <script> 
            function listar(){ 
                document.Listar.submit() 
            } 
        </script> 
    </head>
    <body>
        <table width="100%" align="center" class="alinear">
            <tr>
                <td width="10%" align="center">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<a href="#" onclick="listar()">Actualizar</a>
                </td>                    
                <td width="80%" align="center"><b>VENTAS ENTRE 2 FECHAS</b></td>                    
                <td width="10%" align="center">
                    <a href="ReporteSalidasDosFechasImp.action?tipo_cliente=<s:property value="%{tipo_cliente}"/>&fecha_ini=<s:property value="%{fecha_ini}"/>&fecha_fin=<s:property value="%{fecha_fin}"/>" target="_blank">Imprimir</a>
                </td>                   
            </tr>
        </table>
        <table align="center">
            <tr>
                <td>
                    <s:form name="Listar" action="ReporteSalidasDosFechas" method="post" cssClass="alinear">
                        <s:textfield name="fecha_ini" value="%{fecha_ini}" maxLength="10" size="10" label="Fecha Inicial" cssClass="tcal"></s:textfield>
                        <s:textfield name="fecha_fin" value="%{fecha_fin}" maxLength="10" size="10" label="Fecha Final" cssClass="tcal"></s:textfield>
                        <s:select  name="tipo_cliente" list="ReporteTipo_persona"  listKey="id_tipo_persona" listValue="nombre_tipo_persona" headerKey="" headerValue="" label="Tipo de cliente" onchange="document.Listar.submit();" cssClass="bord"></s:select>
                    </s:form>
                </td>
            </tr>
        </table>
        <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
            <tr>
                <th>#</th>
                <th>APELLIDOS Y NOMBRES DEL CLIENTE</th>
                <th>TOTAL</th>
                <th width="200">FECHA</th>

            </tr>
            <s:iterator value="%{ReporteSalidasDosFechas}">
                <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#eee';"
                    onmouseout="this.style.backgroundColor='White';">
                    <td align="center" width="20"><s:property value="snro"/></td>
                    <td align="left"><s:property value="id_cliente"/></td>
                    <td align="right"><s:property value="total"/></td>
                    <td align="center"><s:property value="fecha_reg"/></td>

                </tr> 
            </s:iterator>
            <tr>
                <td colspan="2"></td>
                <td align="right" bgcolor="yellow">S/ <b><s:property value="%{BCsalida.total}"/></b></td>
                <td align="center"></td>
            </tr>
        </table>
    </body>
</html>
