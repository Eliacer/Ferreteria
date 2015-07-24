<%-- 
    Document   : persona
    Created on : 17-may-2013, 9:47:48
    Author     : Percy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="js/calendar/tcal.css" />
         <script type="text/javascript" src="js/calendar/tcal.js"></script>
        <title>Personas</title>
    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%> 
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
        
        <form name="form" action="Persona.action" method="post">
            <table width="100%">
                <tr>
                    <td width="50%" align="left">
                        &#9660;<s:a href="Inicio.action?SGusuario.id_usuario=%{#session.id_usuario}">Inicio</s:a>
                        &#9660;<s:a href="Persona.action?buscar=">Lista de personas</s:a>
                        &#9660;<s:a  href="NuevaPersona.action">Añadir</s:a>
                        <s:if test="%{window!='ver'}"><div class="error"><s:property value="resultado"/></div></s:if>
                    </td>
                    <td width="50%" align="right">
                        <input type="text" name="buscar" value="" size="12" maxlength="20"/>
                        <input type="submit" value="Buscar"/>
                    </td>
                </tr>
            </table>
        </form>
        <s:if test="%{sms=='ver'}">
            <table align="center"  class="reporte" cellpadding="1" cellspacing="1" bgcolor="#F5F5DC">
                <tr>
                    <th>#</th>
                    <th>NOMBRES</th>
                    <th>DNI</th>
                    <th>RUC</th>
                    <th>RAZÓN SOCIAL</th>
                    <th>TELÉFONO/CELULAR</th>
                    <th>FECHA DE NAC.</th>
                    <th>DIRECCIÓN</th>
                    <th>TIPO PERSONA</th>
                    <th colspan="2">Opciones</th>
                </tr>
                <s:iterator value="%{ReportePersonas}">
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor='#EEE8AA';"
                        onmouseout="this.style.backgroundColor='White';">
                        <td align="center" width="25"><s:property value="nro"/>.</td>
                        <td align="left" width="220"><s:property value="nombres"/> <s:property value="apellidos"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="numero_doc"/></td>
                        <td nowrap="nowrap" align="left" width="90"><s:property value="ruc"/></td>
                        <td nowrap="nowrap" align="center"><s:property value="razon_social"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="telefono"/> <s:property value="celular"/></td>
                        <td nowrap="nowrap" align="center" width="90"><s:property value="fecha_nac"/></td>
                        <td nowrap="nowrap" align="left"><s:property value="direccion"/></td>
                        <td nowrap="nowrap" align="center"><s:property value="id_tipo_persona"/></td>
                        <td nowrap="nowrap" align="center"><a href="EditarPersona.action?id_persona=<s:property value="id_persona"/>"><img src="imag/editar.png" height="16" title="Editar"/></a></td>
                        <td nowrap="nowrap"align="center"><a href="EliminarPersona.action?buscar=&id_persona=<s:property value="id_persona"/>" onclick="if(!confirm('Eliminar Persona: \n  <s:property value="nombres"/>, <s:property value="apellidos"/>'))return false"><img src="imag/borrar.png" height="16" title="Borrar"/></a></td>
                    </tr>
                </s:iterator>
            </table>
        </s:if>
        <s:elseif test="%{sms=='nueva'}">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th>NUEVA PERSONA</th>
                </tr>
                <tr>
                    <td>
                        <s:form name="persona" method="get" action="RegistrarPersona.action" cssClass="alinear">
                            <s:hidden name="buscar" value=""></s:hidden>
                            <s:textfield name="nombres" maxLength="40" label="Nombres" size="25"></s:textfield>
                            <s:textfield name="apellidos" maxLength="30" label="Apellidos" size="25"></s:textfield>
                            <s:select name="id_tipo_doc" list="ReporteTipoDocumento"  listKey="id_tipo_doc" listValue="nombre" headerKey="" headerValue="" label="Tipo Documento" cssClass="bord"></s:select>
                            <s:textfield name="numero_doc" maxLength="8" label="Dni" size="13"></s:textfield>
                            <s:textfield name="fecha_nac" value="" maxLength="10" size="11" label="Fecha de Nacimiento" cssClass="tcal" readonly="true"></s:textfield>
                            <s:textfield name="ruc" maxLength="13" label="Ruc" size="13"></s:textfield>
                            <s:textfield name="razon_social" maxLength="40" label="Razón Social" size="25"></s:textfield>
                            <s:textfield name="telefono" maxLength="10" label="Teléfono" size="13"></s:textfield>
                            <s:textfield name="celular" maxLength="12" label="Celular" size="13"></s:textfield>
                            <s:textarea name="direccion" label="Dirección" cols="27" rows="2"></s:textarea>
                            <s:submit value="Registrar" align="center" onclick="PersonaRegistrar();"></s:submit>
                        </s:form>
                    </td>
                </tr>
                <tr>
                    <td><div id="e_resul" class="falta"></div></td>
                </tr>
            </table>
            
        </s:elseif>
        <s:elseif test="%{sms=='editar'}">
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th>ACTUALIZAR PERSONA</th>
                </tr>
                <tr>
                    <td>
                        <s:form name="persona" method="post" action="ActualizarPersona.action" cssClass="alinear">
                            <s:hidden name="buscar" value=""></s:hidden>
                            <s:hidden name="id_persona" value="%{persona.id_persona}"></s:hidden>
                            <s:textfield name="nombres" value="%{Persona.nombres}" maxLength="40" label="Nombres" size="25"></s:textfield>
                            <s:textfield name="apellidos" value="%{Persona.apellidos}" maxLength="30" label="Apellidos" size="25"></s:textfield>
                            <s:select name="Persona.id_tipo_doc" list="ReporteTipoDocumento"  listKey="id_tipo_doc" listValue="nombre" headerKey="" headerValue="" label="Tipo Documento" cssClass="bord"></s:select>
                            <s:textfield name="numero_doc" value="%{Persona.numero_doc}" maxLength="8" label="Dni" size="13"></s:textfield>
                            <s:textfield name="fecha_nac" value="%{Persona.fecha_nac}" maxLength="10" size="11" label="Fecha de Nacimiento" cssClass="tcal" readonly="true"></s:textfield>
                            <s:textfield name="ruc" value="%{Persona.ruc}" maxLength="13" label="Ruc" size="13"></s:textfield>
                            <s:textfield name="razon_social" value="%{Persona.razon_social}" maxLength="40" label="Razón Social" size="25"></s:textfield>
                            <s:textfield name="telefono" value="%{Persona.telefono}" maxLength="10" label="Teléfono" size="13"></s:textfield>
                            <s:textfield name="celular" value="%{Persona.celular}" maxLength="12" label="Celular" size="13"></s:textfield>
                            <s:textarea name="direccion" value="%{Persona.direccion}" label="Dirección" cols="27" rows="2"></s:textarea>
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
         <s:if test="%{window=='ver'}">
            <script LANGUAGE="JavaScript">
                alert("<s:property value="result"/>")
            </script>
        </s:if>
        <script>
                document.persona.nombres.focus()
                document.persona.nombres.select()
        </script>
    </body>
</html>

