/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;
public class Configuracion {
    public static Conexion Datos()
    {
        //Conexion cx=new Conexion("ventas");
        Conexion cx=new Conexion();
        return cx; 
    }
    
}
