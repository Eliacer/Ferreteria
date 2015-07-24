<%-- 
    Document   : Ventana
    Created on : 15-may-2013, 12:47:18
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function mostrarVentana()
            {
                var ventana = document.getElementById('miVentana');
                ventana.style.marginTop = "100px";
                ventana.style.left = ((document.body.clientWidth-350) / 2) +  "px";
                ventana.style.display = 'block';
            }
            function ocultarVentana()
            {
                var ventana = document.getElementById('miVentana');
                ventana.style.display = 'none';
            }
            function limita(maximoCaracteres) {
                var elemento = document.getElementById("texto");
                if(elemento.value.length >= maximoCaracteres ) {
                    return false;
                }
                else {
                    return true;
                }
            }
        </script> 
    </head>
    <body>
        <textarea id="texto" rows="30" cols="12" onkeypress="return limita(10);"></textarea>

        <div id="miVentana" style="position: fixed; top: 0; left: 0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: normal; border: #333333 3px solid; background-color: #FAFAFA; color: #000000; display:none;">
            <form name="ini" method="post" action="inicio.action">
                <table aling="center">
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" maxlength="20"/></td>
                    </tr>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" maxlength="20"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" maxlength="Ingresar"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <input type="submit" onclick="mostrarVentana();"/>
        <input type="submit" onclick="ocultarVentana();"/>
    </body>
</html>
