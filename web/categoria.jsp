<%-- 
    Document   : categoria
    Created on : 07-may-2013, 8:42:38
    Author     : Percy
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Categorías</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%>  
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <table width="100%">
            <tr>
                <td width="100%" align="left">
                    &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                    &#9660;<s:a href="categoria.action">Ver lista</s:a>
                    &#9660;<s:a cssClass="resal" href="NuevaCategoria.action">Añadir</s:a>
                    <div class="error"><s:property value="resultado"/></div>
                </td>
            </tr>
        </table>

        <s:if test="%{msg=='ver'}">
            <table align="center" class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>Nombre categoría</th>
                    <th>Descripcion</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReporteCategoria}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="30"><s:property value="nro"/></td>
                        <td align="left" width="300"><s:property value="nombre"/></td>
                        <td align="center" width="250"><s:property value="descripcion"/></td>
                        <td align="center"><a href="editarCategoria.action?idcategoria=<s:property value="idcategoria"/>"><img src="imag/editar.png" height="16" title="Editar"/></a></td>
                        <td align="center"><a href="eliminarCategoria.action?idcategoria=<s:property value="idcategoria"/>" onclick="if(!confirm('Eliminar categoría:\n  <s:property value="nombre"/>'))return false"><img src="imag/borrar.png" height="16" title="Borrar"/></a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nueva'}">
        <center>
            <table align="center"><tr><th width="360">NUEVA CATEGORÍA</th></tr></table>
            <s:form name="form" action="agregarCategoria" method="post" cssClass="alinear">
                <s:textfield name="nombre" value="" maxLength="50" size="35" label="Nombre categoría"></s:textfield>
                <s:textarea name="descripcion" cols="28" rows="3" label="Descripción"></s:textarea>
                <s:submit name="Agregar" value="Agregar" align="center" onclick="registrar_categoria();"></s:submit>
            </s:form>
            <div id="e_nombre" class="falta"></div>
        </center>
    </s:elseif>

    <s:elseif test="%{msg=='editar'}">
        <center>
            <table align="center"><tr><th width="360">ACTUALIZAR CATEGORÍA</th></tr></table>
            <s:form name="form" action="actualizarCategoria" method="post" cssClass="alinear">
                <s:hidden name="idcategoria" value="%{BCcategoria.idcategoria}"></s:hidden>
                <s:textfield name="nombre" value="%{BCcategoria.nombre}" maxLength="50" size="35" label="Nombre categoría" cssClass="alinear"></s:textfield>
                <s:textarea name="descripcion" cols="28" rows="3" label="Descripción" value="%{BCcategoria.descripcion}"></s:textarea>
                <s:submit name="Actualizar" value="Actualizar" align="center" onclick="registrar_categoria();"></s:submit>
            </s:form>
            <div id="e_nombre" class="falta"></div>
        </center>
    </s:elseif>

</body>
</html>
