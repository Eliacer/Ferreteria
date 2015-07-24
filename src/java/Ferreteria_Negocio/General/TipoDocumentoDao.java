/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;


import Ferreteria_Entidad.Entidad.CatCliente;
import Ferreteria_Entidad.Entidad.Rol;
import Ferreteria_Entidad.Entidad.TipoDocumento;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class TipoDocumentoDao {

    public List<TipoDocumento> ListarTipoDocumento() {   
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from tipo_documento where estado='1'";
        List<TipoDocumento> lista = new ArrayList<TipoDocumento>();
        TipoDocumento td= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                td = new TipoDocumento();              
                td.setId_tipo_doc(conn.getCol("id_tipo_doc"));
                td.setNombre(conn.getCol("nombre"));
                lista.add(td);   
            }  
        conn.Close(1, 1, 1); 
        return lista;
    }

    public List<Rol> ListarRoles() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from rol";
        List<Rol> lista = new ArrayList<Rol>();
        Rol r= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                r = new Rol();              
                r.setIdRol(conn.getCol("id_rol"));
                r.setNombre(conn.getCol("nombre"));
                lista.add(r);   
            } 
        conn.Close(1, 1, 1); 
        return lista;
    }

    public List<CatCliente> ListarCatCliente() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from cat_cliente";
        List<CatCliente> lista = new ArrayList<CatCliente>();
        CatCliente catCliente= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                catCliente = new CatCliente();              
                catCliente.setIdCategoria(conn.getCol("id_categoria"));
                catCliente.setNombre(conn.getCol("nombre"));
                catCliente.setDescuento(Double.parseDouble(conn.getCol("dcto")));
                
                lista.add(catCliente);   
            }  
        conn.Close(1, 1, 1); 
        return lista;
    }
    
}
