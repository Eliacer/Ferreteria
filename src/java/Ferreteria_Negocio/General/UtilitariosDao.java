/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;

import Ferreteria_Entidad.Entidad.Categoria;
import Ferreteria_Entidad.Entidad.Comprobante;
import Ferreteria_Entidad.Entidad.FormaPago;
import Ferreteria_Entidad.Entidad.Marca;
import Ferreteria_Entidad.Entidad.TipoMoneda;
import Ferreteria_Entidad.Entidad.Ubicacion;
import Ferreteria_Entidad.Entidad.UndMedida;
import Ferreteria_Entidad.Entidad.Unidad;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class UtilitariosDao {
    
    public List<Comprobante> ReporteComprobante() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_comprobante,initcap(nombre) as nombre from comprobante ";
        List<Comprobante> lista = new ArrayList<Comprobante>();
        Comprobante comp= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                comp = new Comprobante();              
                comp.setIdComprobante(conn.getCol("id_comprobante"));
                comp.setNombreComprobante(conn.getCol("nombre"));           
                lista.add(comp);   
            }
        conn.Close(1, 1, 1);  
        return lista; 
    
    }

    public ArrayList<Marca> ReporteMarca() {

        Conexion conn = Configuracion.Datos();
        String sql = "select id_marca,initcap(nombre_marca) as nombre,estado from marca where estado='1' "
                + "order by id_marca asc ";
        ArrayList<Marca> lista = new ArrayList<Marca>();
        Marca ma = null;
        conn.execQuery(sql);
        while (conn.getNext()) {
            ma = new Marca();
            ma.setIdMarca(conn.getCol("id_marca"));
            ma.setNombreMarca(conn.getCol("nombre"));
            ma.setEstado(conn.getCol("estado"));
            lista.add(ma);
        }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<Categoria> ReporteCategoria() {

        Conexion conn = Configuracion.Datos();
        String sql = "select id_categoria,initcap(nombre_categoria) as nombre,estado from categoria where estado='1' "
                + "order by nombre_categoria asc ";
        List<Categoria> lista = new ArrayList<Categoria>();
        Categoria ca = null;
            conn.execQuery(sql);
            while (conn.getNext()) {
                ca = new Categoria();
                ca.setIdCategoria(conn.getCol("id_categoria"));
                ca.setNombreCategoria(conn.getCol("nombre"));
                ca.setEstado(conn.getCol("estado"));
                lista.add(ca);
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<Ubicacion> ReporteUbicacion() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_ubicacion,initcap(nombre_ubicacion) as nombre,estado from ubicacion where estado='1' "
                + "order by id_ubicacion asc";
        List<Ubicacion> lista = new ArrayList<Ubicacion>();
        Ubicacion ub = null;
            conn.execQuery(sql);
            while (conn.getNext()) {
                ub = new Ubicacion();
                ub.setId_ubicacion(conn.getCol("id_ubicacion"));
                ub.setNombre_ubicacion(conn.getCol("nombre"));
                ub.setEstado(conn.getCol("estado"));
                lista.add(ub);
            }
        conn.Close(1, 1, 1);    
        return lista;
    }

    public List<UndMedida> ReporteUndMedida() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_unidad_medida,initcap(nombre_und_medida) as nombre,abreviatura from unidad_medida "
                + "where estado='1' order by nombre asc";
        List<UndMedida> lista = new ArrayList<UndMedida>();
        UndMedida um = null;
            conn.execQuery(sql);
            while (conn.getNext()) {
                um = new UndMedida();
                um.setIdUndMedida(conn.getCol("id_unidad_medida"));
                um.setNombre(conn.getCol("nombre"));
                um.setAbreviatura(conn.getCol("abreviatura"));
                lista.add(um);
            }
        conn.Close(1, 1, 1);    
        return lista;
    }

    public List<Unidad> ReporteUnidad() {

        Conexion conn = Configuracion.Datos();
        String sql = "select id_unidad as id_unidad , initcap(nombre_unidad) as nombre_unidad, abreviatura "
                + "from unidad ";
        List<Unidad> lista = new ArrayList<Unidad>();
        Unidad um = null;
            conn.execQuery(sql);
            while (conn.getNext()) {
                um = new Unidad();
                um.setId_unidad(conn.getCol("id_unidad"));
                um.setNombre_unidad(conn.getCol("nombre_unidad"));
                um.setAbrev_unidad(conn.getCol("abreviatura"));
                lista.add(um);
            }
        conn.Close(1, 1, 1);  
        return lista;
    }

    public boolean Add_Caracteristicas(String nombre, String dato) {

        Conexion conn = Configuracion.Datos();
        String query = "insert into " + nombre + " values ('','" + dato + "','')";
        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1); 
            return true;
        } catch (Exception e) {
            conn.RollBack();
            conn.Close(1, 1, 1); 
            System.out.println(e.getMessage() + ":Tipo **** Error: " + e.getLocalizedMessage());
            System.out.println(query);
            return false;
        }
    }
    public List<FormaPago> ReporteFormapago() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_forma_pago,initcap(nombre) as nombre from forma_pago ";
        List<FormaPago> lista = new ArrayList<FormaPago>();
        FormaPago tp= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                tp = new FormaPago();              
                tp.setIdFormaPago(conn.getCol("id_forma_pago"));
                tp.setNombre(conn.getCol("nombre"));           
                lista.add(tp);   
            }  
        conn.Close(1, 1, 1);  
        return lista; 
    }

    public boolean RegistrarMoneda(TipoMoneda moneda) {
        
        Conexion conn = Configuracion.Datos();
        String query="insert into tipo_moneda "
                    + "(nombre, "
                    + "valor_actual, "
                    + "abrev) "
                    + "values('"+moneda.getNombre()+"',"
                    + moneda.getValorActual()+","
                    + "'"+moneda.getAbrev()+"')";
        
        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1); 
            return true;
        } catch (Exception e) {
            conn.RollBack();
            conn.Close(1, 1, 1); 
            System.out.println(e.getMessage() + ":Tipo **** Error: " + e.getLocalizedMessage());
            System.out.println(query);
            return false;
        }
    }
    
    public boolean ActualizarMoneda(TipoMoneda moneda) {
        
        Conexion conn = Configuracion.Datos();
        String query="update tipo_moneda "
                    + " set nombre='"+moneda.getNombre()+"',"
                    + " valor_actual="+moneda.getValorActual()+","
                    + " abrev='"+moneda.getAbrev()+"' where id_moneda='"+moneda.getIdMoneda()+"'";
        
        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1); 
            return true;
        } catch (Exception e) {
            conn.RollBack();
            conn.Close(1, 1, 1); 
            System.out.println(e.getMessage() + ":Tipo **** Error: " + e.getLocalizedMessage());
            System.out.println(query);
            return false;
        }
    }
       
    public TipoMoneda BuscarMonedaid(String id_moneda) {
        
        Conexion conn = Configuracion.Datos();
        String sql="select * from tipo_moneda where id_moneda='"+id_moneda+"'";
        TipoMoneda moneda = null;      
        conn.execQuery(sql);
        conn.getNext();                   
        moneda = new TipoMoneda();              
        moneda.setIdMoneda(conn.getCol("id_moneda"));
        moneda.setNombre(conn.getCol("nombre")); 
        moneda.setValorActual(Double.parseDouble(conn.getCol("valor_actual")));   
        moneda.setAbrev(conn.getCol("abrev"));                
        conn.Close(1, 1, 1);  
        return moneda;
    }
    
    public boolean EliminarMoneda(String id_moneda) {
        
        Conexion conn = Configuracion.Datos();
        String query="delete from tipo_moneda where id_moneda='"+id_moneda+"'";
        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1); 
            return true;
        } catch (Exception e) {
            conn.RollBack();
            conn.Close(1, 1, 1); 
            System.out.println(e.getMessage() + ":Tipo **** Error: " + e.getLocalizedMessage());
            System.out.println(query);
            return false;
        }
    }
    
    public List<TipoMoneda> ReporteMoneda() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_moneda,initcap(nombre) as nombre,abrev,valor_actual from tipo_moneda where estado='1'";
        List<TipoMoneda> lista = new ArrayList<TipoMoneda>();
        TipoMoneda tm= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                tm = new TipoMoneda();              
                tm.setIdMoneda(conn.getCol("id_moneda"));
                tm.setNombre(conn.getCol("nombre")); 
                tm.setAbrev(conn.getCol("abrev"));
                tm.setValorActual(Double.parseDouble(conn.getCol("valor_actual")));
                lista.add(tm);   
            } 
        conn.Close(1, 1, 1); 
        return lista; 
    }
}
