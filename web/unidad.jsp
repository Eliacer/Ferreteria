<%-- 
    Document   : unidad
    Created on : 29-may-2013, 11:06:27
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
                    &#9660;<s:a href="unidad.action">Ver lista</s:a>
                    &#9660;<s:a cssClass="resal" href="NuevaUnidad.action">Nueva unidad</s:a>
                </td>
            </tr>
        </table>

        <s:if test="%{msg=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>Nombre unidad</th>
                    <th>Abreviatura</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReporteUnidades}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="30"><s:property value="snro"/></td>
                        <td align="left"><s:property value="nombre_unidad"/></td>
                        <td align="left" width="140"><s:property value="abre_unidad"/></td>
                        <td align="center" width="50"><a href="editarUnidad.action?id_unidad=<s:property value="id_unidad"/>">Editar</a></td>
                        <td align="center" width="50"><a href="eliminarUnidad.action?id_unidad=<s:property value="id_unidad"/>">Borrar</a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nueva'}">
        <center>
            <table align="center"><tr><th>NUEVA UNIDAD</th></tr><tr><td>
                        <s:form name="unidad" action="agregarUnidad" method="post" cssClass="alinear">
                            <s:textfield name="nombre_unidad" value="" maxLength="40" size="35" label="Nombre unidad"></s:textfield>
                            <s:textfield name="abre_unidad" value="" label="Abreviatura" maxLength="10" size="8"></s:textfield>
                            <s:submit onclick="agregarUnidad();" name="Agregar" value="Agregar" align="center" ></s:submit>
                        </s:form>
                        <div id="e_unidad" class="falta"></div>
                    </td>

                </tr></table>

        </center>
    </s:elseif>

    <s:elseif test="%{msg=='editar'}">
        <center>
            <table align="center"><tr><th>ACTUALIZAR UNIDAD</th></tr><tr><td>
                        <s:form name="unidad" action="actualizarUnidad" method="post" cssClass="alinear">
                            <s:hidden name="id_unidad" value="%{BCunidad.id_unidad}"></s:hidden>
                            <s:textfield name="nombre_unidad" value="%{BCunidad.nombre_unidad}" maxLength="40" size="35" label="Nombre unidad"></s:textfield>
                            <s:textfield name="abre_unidad" value="%{BCunidad.abre_unidad}" label="Abreviatura" maxLength="10" size="8"></s:textfield>
                            <s:submit name="Actualizar" value="Actualizar" align="center" onclick="agregarUnidad();"></s:submit>
                        </s:form>
                        <div id="e_unidad" class="falta"></div>
                    </td>
            </tr></table>
        </center>
    </s:elseif>
    <s:if test="%{ventana=='ver'}">
        <script LANGUAGE="JavaScript">
            alert("<s:property value="resultado"/>")
        </script>
    </s:if>
         <script>
                document.unidad.nombre_unidad.focus()
                document.unidad.nombre_unidad.select()
        </script>
</body>
</html>
