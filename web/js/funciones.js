/***** FUNCIONES DE VALIDACI�N DE DATOS *****/
// FORMULARIO PROYECTO 
function abrirVentana(url) {
    window.open(url, "nuevo", "directories=no, location=no, menubar=no, scrollbars=yes, statusbar=no, tittlebar=no, width=400, height=400");
}
function limpiarproyecto(){
    document.form.reset();
    document.form.idfac.focus();
}
function limpiarcodigo(){
    document.code.reset();
    document.code.idca.focus();
}

function msj(div,mensaje) {
    var val = document.getElementById(div).innerHTML = mensaje;
    return val;
}
function clean_msj(div) {
    return document.getElementById(div).style.display = 'none';
}


function login_index()
{
    var form =  document.form;
    if(i_clave(form)== false){
        return false;
    }
    if(i_usuario(form)== false){
        return false;
    }
        
}

//Validar venta

function nombres(form) {
    var valor;
    if(form.nombres.value==0)	{
        msj('e_nombres',' Nombres');
        form.nombres.value="";
        form.nombres.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_nombres');
    }
    return valor;
}
function apellidos(form) {
    var valor;
    if(form.apellidos.value==0)	{
        msj('e_apellidos',' Apellidos');
        form.apellidos.value="";
        form.apellidos.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_apellidos');
    }
    return valor;
}
function comprobante(form) {
    var valor;
    if(form.f_id_comprobante.value==0)	{
        msj('e_comprobante',' Seleccione');
        form.f_id_comprobante.value="";
        form.f_id_comprobante.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_comprobante');
    }
    return valor;
}

function registrar_venta()
{
    var form =  document.form;
    if(comprobante(form)== false){
        return false;
    }
    if(apellidos(form)== false){
        return false;
    }
    if(nombres(form)== false){
        return false;
    }
}
/*  ----------------------    Validar Categoría*/
function nombre_categoria(form) {
    var valor;
    if(form.nombre.value==0)	{
        msj('e_nombre','* Escriba el nombre de categoria.');
        form.nombre.value="";
        form.nombre.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_nombre');
    }
    return valor;
}
function registrar_categoria()
{
    var form =  document.form;
    if(nombre_categoria(form)== false){
        return false;
    }
}

/*  fin de validar categoria*/

/*  ----------------------    Validar Producto*/
function nombre(form) {
    var valor;
    if(form.nombre.value==0)	{
        msj('e_producto','* Escriba el nombre del producto.');
        form.nombre.value="";
        form.nombre.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_producto');
    }
    return valor;
}

function porc_ganacia(form) {
    var valor;
    if(form.porc_ganacia.value==0)	{
        msj('e_producto','* Ingrese el porcentaje de ganancia.');
        form.porc_ganacia.value="";
        form.porc_ganacia.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_producto');
    }
    return valor;
}
function id_unidad_medida(form) {
    var valor;
    if(form.id_unidad_medida.value==0)	{
        msj('e_producto','* Ingrese la unidad de medida.');
        form.id_unidad_medida.value="";
        form.id_unidad_medida.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_producto');
    }
    return valor;
}

function id_categoria(form) {
    var valor;
    if(form.id_categoria.value==0)	{
        msj('e_producto','* Seleccione la categoria.');
        form.id_categoria.value="";
        form.id_categoria.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_producto');
    }
    return valor;
}

function id_marca(form) {
    var valor;
    if(form.id_marca.value==0)	{
        msj('e_producto','* Seleccione la marca.');
        form.id_marca.value="";
        form.id_marca.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_producto');
    }
    return valor;
}

function id_ubicacion(form) {
    var valor;
    if(form.id_ubicacion.value==0)	{
        msj('e_producto','* Seleccione la ubicacion.');
        form.id_ubicacion.value="";
        form.id_ubicacion.focus();
        event.returnValue=false;
    //valor = false;return false;
    }else{
        clean_msj('e_producto');
    }
    return valor;
}

function registrar_producto()
{
    var form =  document.producto;
    
    
    
    if(id_ubicacion(form)== false){
        return false;
    }
    if(id_marca(form)== false){
        return false;
    }
    
    if(id_categoria(form)== false){
        return false;
    }
    if(id_unidad_medida(form)== false){
        return false;
    }
    if(porc_ganacia(form)== false){
        return false;
    }
    
    if(nombre(form)== false){
        return false;
    }
}

/*  fin de validar producto*/

/*  Registrar Entradas ***********************************/
function NroEntrada(form) {
    var valor;
    if(form.nro.value==0)	{
        msj('e_entrada','* Ingrese numero');
        form.nro.value="";
        form.nro.focus();
        event.returnValue=false;
    }
    return valor;
}
function id_proveedorEntrada(form) {
    var valor;
    if(form.id_proveedor.value==0)	{
        msj('e_entrada','* Seleccione el proveedor');
        form.id_proveedor.value="";
        form.id_proveedor.focus();
        event.returnValue=false;
		
    }
    return valor;
}
function fechaEntrada(form) {
    var valor;
    if(form.fecha.value==0)	{
        msj('e_entrada','* Seleccione la fecha.');
        form.fecha.value="";
        form.fecha.focus();
        event.returnValue=false;
		
    }
    return valor;
}
function id_comprobante_tipoEntrada(form) {
    var valor;
    if(form.id_comprobante_tipo.value==0)	{
        msj('e_entrada','* Seleccione comprobante');
        form.id_comprobante_tipo.value="";
        form.id_comprobante_tipo.focus();
        event.returnValue=false;
		
    }
    return valor;
}
function RegistrarEntrada()
{
    var fo =  document.entrada;
    if(fechaEntrada(fo)== false){
        return false;
    }             
                 
    if(id_proveedorEntrada(fo)== false){
        return false;
    } 
    if(id_comprobante_tipoEntrada(fo)== false){
        return false;
    }
    if(NroEntrada(fo)== false){
        return false;
    }             
}



/* Validar Persona*/
function nombres(form) {
    var valor;
    if(form.nombres.value==0)	{
        msj('e_resul','* Ingrese el nombre de la persona.');
        form.nombres.value="";
        form.nombres.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}

function numero_doc(form) {
    var valor;
    if(form.numero_doc.value==0)	{
        msj('e_resul','* Ingrese el DNI');
        form.numero_doc.value="";
        form.numero_doc.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function ruc(form) {
    var valor;
    if(form.ruc.value==0)	{
        msj('e_resul','* Ingrese el RUC');
        form.ruc.value="";
        form.ruc.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}

function razon_social(form) {
    var valor;
    if(form.razon_social.value==0)	{
        msj('e_resul','* Ingrese la razon social');
        form.razon_social.value="";
        form.razon_social.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function id_tipo_doc(form) {
    var valor;
    if(form.id_tipo_doc.value==0)	{
        msj('e_resul','* Seleccione el tipo de documento');
        form.id_tipo_doc.value="";
        form.id_tipo_doc.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function PersonaRegistrar()
{
    var fo =  document.persona;
    
                 
    if(numero_doc(fo)== false){
        return false;
    }                          
      
    if(id_tipo_doc(fo)== false){
        return false;
    }
    if(nombres(fo)== false){
        return false;
    }
}

/**    PROVEEDOR  **********************************************/

function nombre_proveedorProveedor(form) {
    var valor;
    if(form.nombre_proveedor.value==0)	{
        msj('e_proveedor','* Ingrese el nombre del proveedor');
        form.nombre_proveedor.value="";
        form.nombre_proveedor.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function rucProveedor(form) {
    var valor;
    if(form.ruc.value==0)	{
        msj('e_proveedor','* Ingrese el ruc');
        form.ruc.value="";
        form.ruc.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function id_distritoProveedor(form) {
    var valor;
    if(form.id_distrito.value==0)	{
        msj('e_proveedor','* Seleccione el distrito');
        form.id_distrito.value="";
        form.id_distrito.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function direccionProveedor(form) {
    var valor;
    if(form.direccion.value==0)	{
        msj('e_proveedor','* Ingrese la dirección: por Jr. Av. o Calle, etc.');
        form.direccion.value="";
        form.direccion.focus();
        event.returnValue=false;
    //valor = false;return false;
    }
    return valor;
}
function registrarProveedor()
{
    var fo =  document.proveedor;
    if(direccionProveedor(fo)== false){
        return false;
    }             
    if(id_distritoProveedor(fo)== false){
        return false;
    }             
    if(rucProveedor(fo)== false){
        return false;
    }             
    if(nombre_proveedorProveedor(fo)== false){
        return false;
    }             
}
function actualizarProveedor()
{
    var fo =  document.proveedoract;
    if(direccionProveedor(fo)== false){
        return false;
    }             
    if(rucProveedor(fo)== false){
        return false;
    }             
    if(nombre_proveedorProveedor(fo)== false){
        return false;
    }             
}

/** UNIDAD **/
function nombre_unidadUnidad(form) {
    var valor;
    if(form.nombre_unidad.value==0)	{
        msj('e_unidad','* Ingrese el nombre de la unidad.');
        form.nombre_unidad.value="";
        form.nombre_unidad.focus();
        event.returnValue=false;
    }
    return valor;
}
function abre_unidadUnidad(form) {
    var valor;
    if(form.abre_unidad.value==0)	{
        msj('e_unidad','* Ingrese la abreviatura');
        form.abre_unidad.value="";
        form.abre_unidad.focus();
        event.returnValue=false;
    }
    return valor;
}
function agregarUnidad()
{
    var fo =  document.unidad;
    if(abre_unidadUnidad(fo)== false){
        return false;
    }             
    if(nombre_unidadUnidad(fo)== false){
        return false;
    }             
}

/*   Validación de venta para el personal*/
function ventaId_cliente(form) {
    var valor;
    if(form.id_cliente.value==0)	{
        msj('salida','* Seleccione el cliente');
        form.id_cliente.value="";
        form.id_cliente.focus();
        event.returnValue=false;
    }
    return valor;
}
function ventaId_producto(form) {
    var valor;
    if(form.id_producto.value==0)	{
        msj('salida','* Seleccione el producto');
        form.id_producto.value="";
        form.id_producto.focus();
        event.returnValue=false;
    }
    return valor;
}
function ventaCantidad(form) {
    var valor;
    if(form.cantidad.value==0)	{
        msj('salida','* Ingrese la cantidad');
        form.cantidad.value="";
        form.cantidad.focus();
        event.returnValue=false;
    }
    return valor;
}
function ventaPersonal()
{
    var fo =  document.venta_personal;
    if(ventaCantidad(fo)== false){
        return false;
    }             
    if(ventaId_producto(fo)== false){
        return false;
    }             
    if(ventaId_cliente(fo)== false){
        return false;
    }             
}

//***************** CREAR CRONOGRAMA VENTA PERSONAL **************
function fechaVencCronograma(form) {
    var valor;
    if(form.fecha_reg.value==0)	{
        msj('cronograma','* Seleccione la fecha de cobranza.');
        form.fecha_reg.value="";
        form.fecha_reg.focus();
        event.returnValue=false;
    }
    return valor;
}
function RegistrarCronogramaPersonal()
{
    var fo =  document.CrearCronogramaSalida;
    if(fechaVencCronograma(fo)== false){
        return false;
    } 
}



