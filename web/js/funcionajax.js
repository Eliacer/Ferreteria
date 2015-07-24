/**
 * 
 */
var peticion = false;
var  testPasado = false;
try {
  peticion = new XMLHttpRequest();
  } catch (trymicrosoft) {
  try {
  peticion = new ActiveXObject("Msxml2.XMLHTTP");
  } catch (othermicrosoft) {
  try {
  peticion = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (failed) {
  peticion = false;
  } 
  }
}
if (!peticion)
alert("ERROR AL INICIALIZAR!");

function cargarCombo (url, comboAnterior, element_id) { 
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior);
    var x = valordepende.value;
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x;
    element.innerHTML = '<img src="http://investigacion.upeu.edu.pe/images/loader.gif" width="20" height="20"/>'; 
    //abrimos la url
    peticion.open("GET", fragment_url); 
    peticion.onreadystatechange = function() { 
     	if (peticion.readyState == 4) {
		//escribimos la respuesta
		element.innerHTML = peticion.responseText;
      } 
    };
   peticion.send(null); 
}

function cargarCombo2 (url, comboAnterior, element_id) { 
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior);
    var x = valordepende.value;
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'&Id='+x;
    element.innerHTML = '<img name="loader" src="loader.gif" width="20" height="20"/>'; 
    //abrimos la url
    peticion.open("GET", fragment_url); 
    peticion.onreadystatechange = function() { 
     	if (peticion.readyState == 4) {
		//escribimos la respuesta
		element.innerHTML = peticion.responseText;
      } 
    };
   peticion.send(null); 
}
function ruta_images(imagen){
	var ruta = document.imagen.src;
	return ruta;
}