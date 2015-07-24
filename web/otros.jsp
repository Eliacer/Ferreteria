<%-- 
    Document   : index
    Created on : 02-may-2013, 15:18:53
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>  
        <title>Menu principal</title>
        <s:head theme="ajax" />
    </head>
    <body>
    <center>
    
         <%@taglib uri="/struts-tags" prefix="s"%>  
         <s:include id="cab.jsp" value="cab.jsp"></s:include>
        <hr>
            <s:a href="categoria.action"><img src="menu/categoria.png" title="Categorías" width="90"/></s:a>
            <s:a href="unidad_medida.action?buscar="><img src="menu/unidades_medida.png" title="unidades de medida" width="90"/></s:a>
            <s:a href="producto.action?buscar="><img src="menu/productos.png" title="Productos" width="90"/></s:a>
            <s:a href="mostrador.action?buscar="><img src="menu/mostrador.png" title="Mostrador Stocks" width="90"/></s:a>
            <s:a href="inventario.action?buscar="><img src="menu/inventario.png" title="Ver inventario" width="90"/></s:a>
            <hr>
            <s:a href="persona.action?buscar="><img src="menu/persona.png" title="Registrar persona" width="90"/></s:a>
            <s:a href="proveedor.action?CMproveedor.buscar="><img src="menu/proveedor.png" title="Registrar proveedor" width="90"/></s:a>
            <s:a href="entradas.action?buscar="><img src="menu/lista_entradas.png" title="Lista de entradas" width="90"/></s:a>
            <s:a href="entrada.action?CMproveedor.buscar="><img src="menu/entradas.png" title="Registrar entrada" width="90"/></s:a>
            <hr>
            
        &#9660;<s:a href="CerrarSesion.action">Cerrar</s:a>
        <hr>
        </center>
            <s:datetimepicker name="myBirthday" label="Seleccione la fecha" displayFormat="dd/MM/yyyy"></s:datetimepicker>
            <s:form>
                <s:doubleselect label="Select Item"
                                headerValue="--- Please Select ---"
                                headerKey="1" list="{'Color','Fruits'}"
                                doubleName="dishes"
                                doubleList="top == 'Color' ? {'Black','Green','White',
                                'Yellow','Red','Pink'} : { 'Apple','Banana','Grapes','Mango'}" />
            </s:form>
    </body>
</html>

