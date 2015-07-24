<%-- 
    Document   : unidad_medida
    Created on : 23-may-2013, 8:14:48
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Unidad de medida</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%>  
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <table width="100%">
            <tr>
                <td width="100%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<s:a href="unidad_medida.action">Ver lista</s:a>
                    &#9660;<s:a cssClass="resal" href="NuevaUnidad_medida.action">Añadir</s:a>
                    </td>
                </tr>
            </table>
                    

        <s:if test="%{msg=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>Nombre unidad</th>
                    <th>Descripcion</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReporteUnidades_medida}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="30"><s:property value="snro"/></td>
                        <td align="center"><s:property value="nombre_unidad_medida"/></td>
                        <td align="center" width="140"><s:property value="descripcion"/></td>
                        <td align="center" width="50"><a href="editarUnidad_medida.action?BCunidad_medida.id_unidad_medida=<s:property value="id_unidad_medida"/>">Editar</a></td>
                        <td align="center" width="50"><a href="eliminarUnidad_medida.action?BCunidad_medida.id_unidad_medida=<s:property value="id_unidad_medida"/>" onclick="if(!confirm('Eliminar la Unidad de medida: \n  <s:property value="descripcion"/>'))return false">Borrar</a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nueva'}">
        <center>
            <table align="center"><tr><th>NUEVA UNIDAD DE MEDIDA</th></tr><tr><td>
                        <s:form name="form" action="agregarUnidad_medida" method="post" cssClass="alinear">
                            <s:textfield name="BCunidad_medida.nombre_unidad_medida" value="" maxLength="10" size="8" label="Nombre unidad"></s:textfield>
                            <s:textfield name="BCunidad_medida.descripcion" value="" label="Descripción" maxLength="30" size="25"></s:textfield>
                            <s:submit name="Agregar" value="Agregar" align="center"></s:submit>
                        </s:form>
                    </td></tr></table>

        </center>
    </s:elseif>

    <s:elseif test="%{msg=='editar'}">
        <center>
            <table align="center"><tr><th>ACTUALIZAR UNIDAD DE MEDIDA</th></tr><tr><td>
                        <s:form name="form" action="actualizarUnidad_medida" method="post" cssClass="alinear">
                            <s:hidden name="BCunidad_medida.id_unidad_medida" value="%{BCunidad_medida.id_unidad_medida}"></s:hidden>
                            <s:textfield name="BCunidad_medida.nombre_unidad_medida" value="%{BCunidad_medida.nombre_unidad_medida}" maxLength="10" size="8" label="Nombre unidad"></s:textfield>
                            <s:textfield name="BCunidad_medida.descripcion" value="%{BCunidad_medida.descripcion}" label="Descripción" maxLength="30" size="25"></s:textfield>
                            <s:submit name="Agregar" value="Actualizar" align="center"></s:submit>
                        </s:form>
                    </td></tr></table>

        </center>
    </s:elseif>
    <s:if test="%{alerta=='ver'}">
        <script LANGUAGE="JavaScript">
            alert("<s:property value="resultado"/>")
        </script>
    </s:if>
</body>
</html>
