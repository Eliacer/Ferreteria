<%-- 
    Document   : comprobante_tipo
    Created on : 29-may-2013, 16:41:58
    Author     : digesitpp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Tipos de comprobantes</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%>  
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <table width="100%">
            <tr>
                <td width="100%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<s:a href="comprobante_tipo.action">Ver lista</s:a>
                    &#9660;<s:a cssClass="resal" href="NuevoComprobante_tipo.action">Nuevo comprobante</s:a>
                </td>
            </tr>
        </table>

        <s:if test="%{msg=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Codigo</th>
                    <th>Abreviatura</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReporteComprobante_tipo}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="30"><s:property value="snro"/></td>
                        <td align="left" width="150"><s:property value="nombre"/></td>
                        <td align="center"><s:property value="codigo"/></td>
                        <td align="left"><s:property value="abreviatura"/></td>
                        <td align="center" width="50"><a href="editarComprobante_tipo.action?id_comprobante_tipo=<s:property value="id_comprobante_tipo"/>">Editar</a></td>
                        <td align="center" width="50"><a href="eliminarComprobante_tipo.action?id_comprobante_tipo=<s:property value="id_comprobante_tipo"/>">Borrar</a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nuevo'}">
        <center>
            <table align="center"><tr><th>NUEVO COMPROBANTE</th></tr><tr><td>
                        <s:form name="comprobante" action="agregarComprobante" method="post" cssClass="alinear">
                            <s:textfield name="nombre" value="" maxLength="20" size="18" label="Nombre"></s:textfield>
                            <s:textfield name="codigo" value="" label="Código" maxLength="20" size="18"></s:textfield>
                            <s:textfield name="abreviatura" value="" label="Abreviatura" maxLength="20" size="18"></s:textfield>
                            <s:submit onclick="agregarComprobante();" name="Agregar" value="Agregar" align="center" ></s:submit>
                        </s:form>
                        <div id="e_unidad" class="falta"></div>
                    </td>

                </tr></table>

        </center>
    </s:elseif>

    <s:elseif test="%{msg=='editar'}">
        <center>
            <table align="center"><tr><th>ACTUALIZAR COMPROBANTE</th></tr><tr><td>
                        <s:form name="comprobante" action="actualizarComprobante" method="post" cssClass="alinear">
                            <s:hidden name="id_comprobante_tipo" value="%{CMcomprobante_tipo.id_comprobante_tipo}"></s:hidden>
                            <s:textfield name="nombre" value="%{CMcomprobante_tipo.nombre}" maxLength="20" size="18" label="Nombre"></s:textfield>
                            <s:textfield name="codigo" value="%{CMcomprobante_tipo.codigo}" label="Código" maxLength="20" size="18"></s:textfield>
                            <s:textfield name="abreviatura" value="%{CMcomprobante_tipo.abreviatura}" label="Abreviatura" maxLength="20" size="18"></s:textfield>
                            <s:submit onclick="agregarComprobante();" name="Actualizar" value="Actualizar" align="center" ></s:submit>
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
                document.comprobante.nombre.focus()
                document.comprobante.nombre.select()
        </script>
</body>
</html>
