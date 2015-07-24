<%-- 
    Document   : persona
    Created on : 17-may-2013, 9:47:48
    Author     : Percy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personas</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        
        <form name="form" action="persona.action" method="post">
            <table width="100%">
                <tr>
                    <td width="50%" align="left">
                        &#9660;<s:a href="inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                        &#9660;<s:a href="persona.action?buscar=">Lista de personas</s:a>
                        &#9660;<s:a  href="nuevaPersona.action">Añadir</s:a>
                        <s:if test="%{ventana!='ver'}"><div class="error"><s:property value="resultado"/></div></s:if>
                    </td>
                    <td width="50%" align="right">
                        <input type="text" name="buscar" value="" size="12" maxlength="20"/>
                        <input type="submit" value="Buscar"/>
                    </td>
                </tr>
            </table>
        </form>
        <s:if test="%{msg=='ver'}">
            <table align="center"  class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>NOMBRES</th>
                    <th>DNI</th>
                    <th>RUC</th>
                    <th>RAZÓN SOCIAL</th>
                    <th>TELÉFONO</th>
                    <th>CÓDIGO</th>
                    <th>DISTRITO</th>
                    <th>DIRECCIÓN</th>
                    <th>TIPO PERSONA</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReportePersonas}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="nro"/>.</td>
                        <td align="left" width="220"><s:property value="nombres"/> <s:property value="apepat"/> <s:property value="apemat"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="dni"/></td>
                        <td nowrap="nowrap" align="left" width="90"><s:property value="ruc"/></td>
                        <td nowrap="nowrap" align="center"><s:property value="razon_social"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="telefono"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="codigo"/></td>
                        <td nowrap="nowrap" align="left"><s:property value="id_distrito"/></td>
                        <td nowrap="nowrap" align="left"><s:property value="direccion"/></td>
                        <td nowrap="nowrap" align="center"><s:property value="id_tipo_persona"/></td>
                        <td nowrap="nowrap" align="center"><a href="editarPersona.action?id_persona=<s:property value="id_persona"/>"><img src="imag/editar.png" height="16" title="Editar"/></a></td>
                        <td nowrap="nowrap"align="center"><a href="eliminarPersona.action?buscar=&id_persona=<s:property value="id_persona"/>" onclick="if(!confirm('Eliminar Persona: \n  <s:property value="nombres"/>, <s:property value="apepat"/> <s:property value="apemat"/>'))return false"><img src="imag/borrar.png" height="16" title="Borrar"/></a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{msg=='nueva'}">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th>NUEVA PERSONA</th>
                </tr>
                <tr>
                    <td>
                        <s:form name="persona" method="post" action="registrarPersona.action" cssClass="alinear">
                            <s:hidden name="buscar" value=""></s:hidden>
                            <s:textfield name="nombres" maxLength="40" label="Nombres" size="30"></s:textfield>
                            <s:textfield name="apepat" maxLength="30" label="Apellido paterno" size="25"></s:textfield>
                            <s:textfield name="apemat" maxLength="30" label="Apellido materno" size="25"></s:textfield>
                            <s:textfield name="dni" maxLength="8" label="Dni" size="8"></s:textfield>
                            <s:textfield name="ruc" maxLength="13" label="Ruc" size="13"></s:textfield>
                            <s:textfield name="razon_social" maxLength="40" label="Razón Social" size="40"></s:textfield>
                            <s:textfield name="telefono" maxLength="10" label="Teléfono" size="10"></s:textfield>
                            <s:textfield name="codigo" maxLength="12" label="Código Uni." size="12"></s:textfield>
                            <s:select  name="id_distrito" list="ReporteDistritos"  listKey="id_distrito" listValue="nombre_distrito" headerKey="" headerValue="" label="Distrito"></s:select>
                            <s:textfield name="direccion" maxLength="40" label="Dirección" size="30"></s:textfield>
                            <s:select  name="id_tipo_persona" list="ReporteTipo_persona"  listKey="id_tipo_persona" listValue="nombre_tipo_persona" headerKey="" headerValue="" label="Tipo persona"></s:select>
                            <s:submit value="Registrar" align="center" onclick="PersonaRegistrar();"></s:submit>
                        </s:form>
                    </td>
                </tr>
                <tr>
                    <td><div id="e_resul" class="falta"></div></td>
                </tr>
            </table>
            
        </s:elseif>
        <s:elseif test="%{msg=='editar'}">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th>ACTUALIZAR PERSONA</th>
                </tr>
                <tr>
                    <td>
                        <s:form name="persona" method="post" action="actualizarPersona.action" cssClass="alinear">
                            <s:hidden name="buscar" value=""></s:hidden>
                            <s:hidden name="id_persona" value="%{CMpersona.id_persona}"></s:hidden>
                            <s:textfield name="nombres" value="%{CMpersona.nombres}" maxLength="40" label="Nombres" size="30"></s:textfield>
                            <s:textfield name="apepat" value="%{CMpersona.apepat}" maxLength="30" label="Apellido paterno" size="25"></s:textfield>
                            <s:textfield name="apemat" value="%{CMpersona.apemat}" maxLength="30" label="Apellido materno" size="25"></s:textfield>
                            <s:textfield name="dni" value="%{CMpersona.dni}" maxLength="8" label="Dni" size="8"></s:textfield>
                            <s:textfield name="ruc" value="%{CMpersona.ruc}" maxLength="13" label="Ruc" size="13"></s:textfield>
                            <s:textfield name="razon_social" value="%{CMpersona.razon_social}" maxLength="40" label="Razón Social" size="40"></s:textfield>
                            <s:textfield name="telefono" value="%{CMpersona.telefono}" maxLength="10" label="Teléfono" size="10"></s:textfield>
                            <s:textfield name="codigo" value="%{CMpersona.codigo}" maxLength="12" label="Código Uni." size="12"></s:textfield>
                            <s:select  name="CMpersona.id_distrito" list="ReporteDistritos"  listKey="id_distrito" listValue="nombre_distrito" headerKey="" headerValue="" label="Distrito"></s:select>
                            <s:textfield name="direccion" value="%{CMpersona.direccion}" maxLength="40" label="Dirección" size="30"></s:textfield>
                            <s:select  name="CMpersona.id_tipo_persona" list="ReporteTipo_persona"  listKey="id_tipo_persona" listValue="nombre_tipo_persona" headerKey="" headerValue="" label="Tipo persona"></s:select>
                            <s:submit value="Actualizar" align="center" onclick="PersonaRegistrar();"></s:submit>
                        </s:form>
                    </td>
                </tr>
                <tr>
                    <td><div id="e_resul" class="falta"></div></td>
                </tr>
            </table>
        </s:elseif>
                    <s:elseif test="%{msg=='nuevoCliente'}">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th>NUEVO CLIENTE  <s:a href="salida.action?buscar=">Volver</s:a></th>
                </tr>
                <tr>
                    <td>
                        <s:form name="persona" method="post" action="registrarCliente.action" cssClass="alinear">
                            <s:hidden name="buscar" value=""></s:hidden>
                            <s:textfield name="CMpersona.nombres" maxLength="40" label="* Nombres" size="30"></s:textfield>
                            <s:textfield name="CMpersona.apepat" maxLength="30" label="* Apellido paterno" size="25"></s:textfield>
                            <s:textfield name="CMpersona.apemat" maxLength="30" label="* Apellido materno" size="25"></s:textfield>
                            <s:textfield name="CMpersona.dni" maxLength="8" label="Dni" size="8"></s:textfield>
                            <s:textfield name="CMpersona.ruc" maxLength="13" label="Ruc" size="13"></s:textfield>
                            <s:textfield name="CMpersona.razon_social" maxLength="40" label="Razón Social" size="40"></s:textfield>
                            <s:textfield name="CMpersonatelefono" maxLength="10" label="Teléfono" size="10"></s:textfield>
                            <s:textfield name="CMpersona.codigo" maxLength="12" label="Código Uni." size="12"></s:textfield>
                            <s:select  name="CMpersona.id_distrito" list="ReporteDistritos"  listKey="id_distrito" listValue="nombre_distrito" headerKey="" headerValue="" label="* Distrito"></s:select>
                            <s:textfield name="CMpersona.direccion" maxLength="40" label="Dirección" size="30"></s:textfield>
                            <s:select  name="CMpersona.id_tipo_persona" list="ReporteTipo_persona"  listKey="id_tipo_persona" listValue="nombre_tipo_persona" headerKey="" headerValue="" label="* Tipo persona"></s:select>
                            <s:submit value="Registrar" align="center"></s:submit>
                        </s:form>
                    </td>
                </tr>
            </table>
                    </s:elseif>
         <s:if test="%{ventana=='ver'}">
            <script LANGUAGE="JavaScript">
                alert("<s:property value="resultado"/>")
            </script>
        </s:if>
        <script>
                document.persona.nombres.focus()
                document.persona.nombres.select()
        </script>
    </body>
</html>

