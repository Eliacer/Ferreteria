<%-- 
    Document   : index
    Created on : 02-may-2013, 15:18:53
    Author     : Percy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <link href="menu/main.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Menu principal</title>
        <s:head theme="ajax" />
    </head>
    <body>
    <center>

        <%@taglib uri="/struts-tags" prefix="s"%>  
        <s:include id="cab.jsp" value="cab.jsp"></s:include>
            <table width="100%">
                <tr>
                    <td width="100%" align="right">&#9660;<s:a href="CerrarSesion.action">Cerrar sesión</s:a></td>
                </tr>
            </table>
            <table align="center"  cellpadding="3" cellspacing="1">
                <tr>
                    <td valign="top" align="left">
                        <div class="wrapper">
                            <ul class="dropdown">
                                <li class="active"><span><img src="imag/editar.png" height="25" title="Registros"/> <b>Registros</b></span></li>
                                <li class="first"><s:a href="Persona.action?buscar=" cssClass="menu">Personas</s:a></li>
                            <li class="first"><s:a href="Proveedor.action?CMproveedor.buscar=" cssClass="menu">Proveedores</s:a></li>
                            <li class="first"><s:a href="Categoria.action" cssClass="menu">Categorías</s:a></li>
                            <li class="first"><s:a href="Producto.action?buscar=" cssClass="menu">Productos</s:a></li>
                            <li class="first"><s:a href="mostrador.action?buscar=" cssClass="menu">Mostrador</s:a></li>
                            <li class="first"><s:a href="Inventario.action" cssClass="menu">Inventario</s:a></li>
                            <li class="first"><s:a href="Unidad_Medida.action?buscar=" cssClass="menu">Unidad de medida</s:a></li>
                            <li class="first"><s:a href="Unidad.action" cssClass="menu">Unidad</s:a></li>

                            </ul>
                    </td>
                    <td valign="top" align="left">
                        <div class="wrapper">
                            <ul class="dropdown">
                                <li class="active"><span><b>Entradas....</b></span></li>
                                <li class="first"><s:a href="entrada.action?CMproveedor.buscar=" cssClass="menu">Registrar compras</s:a></li>
                            <li class="first"><s:a href="entradas.action" cssClass="menu">Lista de compras</s:a></li>
                            <li class="first"><s:a href="entrada_propia.action" cssClass="menu">Registrar entradas propias</s:a></li>
                            <li class="first"><s:a href="entradas_propias.action" cssClass="menu">Lista de entradas propias</s:a></li>
                            </ul>
                    </td>
                    <td valign="top" align="left">
                        <div class="wrapper">
                            <ul class="dropdown">
                                <li class="active"><span><b>Salidas....</b></span></li>
                                <li class="first"><s:a href="salida.action?CMproveedor.buscar=" cssClass="menu">Venta general</s:a></li>
                                <li class="first"><s:a href="salidaclienteybeca18.action?CMproveedor.buscar=" cssClass="menu">Venta con Cliente y Beca 18</s:a></li>
                                <li class="first"><s:a href="salida_personal.action" cssClass="menu">Venta al personal</s:a></li>
                                <li class="first"><s:a href="salida_area.action?CMproveedor.buscar=" cssClass="menu">Venta interdepartamental</s:a></li>
                            </ul>
                    </td>
                    <td valign="top" align="left">
                        <div class="wrapper">
                            <ul class="dropdown">
                                <li class="active"><span><b>Reportes</b></span></li>
                                <li class="first"><s:a href="ReporteSalidas.action" cssClass="menu">Todas las ventas</s:a></li>
                            <li class="first"><s:a href="ReporteSalidasDiarias.action" cssClass="menu">Ventas diarias</s:a></li>
                            <li class="first"><s:a href="ReporteSalidasDosFechas.action" cssClass="menu">Ventas entre 2 fechas</s:a></li>
                            <li class="first"><s:a href="ReporteSalidasDosFechasCliente.action" cssClass="menu">Ventas entre 2 fechas por cliente</s:a></li>
                            </ul>
                    </td>
                    <td valign="top" align="left">
                        <div class="wrapper">
                            <ul class="dropdown">
                                <li class="active"><span><img src="imag/adm.png" height="25" title="Administración"/> <b>Admin....</b></span></li>
                                <li class="first"><s:a href="comprobante_tipo.action" cssClass="menu">Comprobantes</s:a></li>
                            <li class="first"><s:a href="distrito.action" cssClass="menu">Distritos</s:a></li>
                            <li class="first"><s:a href="usuario.action" cssClass="menu">Usuarios</s:a></li>
                        </ul>
                </td>

            </tr>
        </table>

        <script type="text/javascript" src="menu/jquery.js"></script>
        <script type="text/javascript" src="menu/main.js"></script>

    </body>
</html>

