<%-- 
    Document   : distrito
    Created on : 30-may-2013, 12:25:25
    Author     : digesitpp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Distritos</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%>  
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <table width="100%">
            <tr>
                <td width="100%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<s:a href="distrito.action">Ver lista</s:a>
                    &#9660;<s:a cssClass="resal" href="NuevoDistrito.action">Nuevo distrito</s:a>
                </td>
            </tr>
        </table>

        <s:if test="%{msg=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>Nombre distrito</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReporteDistritos}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="30"><s:property value="snro"/></td>
                        <td align="left"  width="300"><s:property value="nombre_distrito"/></td>
                        <td align="center" width="50"><a href="editarDistrito.action?id_distrito=<s:property value="id_distrito"/>">Editar</a></td>
                        <td align="center" width="50"><a href="eliminarDistrito.action?id_distrito=<s:property value="id_distrito"/>">Borrar</a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nuevo'}">
        <center>
            <table align="center"><tr><th>NUEVO DISTRITO</th></tr><tr><td>
                        <s:form name="distrito" action="agregarDistrito" method="post" cssClass="alinear">
                            <s:textfield name="nombre_distrito" value="" maxLength="40" size="35" label="Nombre distrito"></s:textfield>
                            <s:submit name="Agregar" value="Agregar" align="center" ></s:submit>
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
                document.distrito.nombre_distrito.focus()
                document.distrito.nombre_distrito.select()
        </script>
</body>
</html>
