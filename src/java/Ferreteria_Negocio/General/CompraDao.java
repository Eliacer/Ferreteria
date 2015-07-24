/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;

import Ferreteria_Entidad.Entidad.Compra;
import Ferreteria_Entidad.Entidad.Rep_compras;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Eliacer Fernandez
 */
public class CompraDao{

    public Compra ObtenerCompraPorNumComprobante(String num_com) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from compra where num_comprobante='"+num_com+"'";
        Compra compra= null;
        conn.getNext();                   
        compra = new Compra();              
        compra.setId_compra(conn.getCol("id_compra"));
        compra.setId_usuario(conn.getCol("id_usuario")); 
        compra.setId_proveedor(conn.getCol("id_proveedor"));   
        compra.setId_tipoMoneda(conn.getCol("id_moneda")); 
        compra.setId_comprobante(conn.getCol("id_comprobante")); 
        compra.setNumComprobante(conn.getCol("num_comprobante")); 
        compra.setId_formaPago(conn.getCol("id_forma_pago")); 
        compra.setFechaCompra(conn.getCol("fecha_compra"));
        compra.setDescripcion(conn.getCol("descripcion"));
        compra.setIgv(conn.getCol("igv"));
        compra.setFlete(conn.getCol("flete"));   
        conn.Close(1, 1, 1); 
        return compra; 
    
    }
    
    public Compra ObtenerCompraPorId(String id_compra) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from compra where id_compra='"+id_compra+"'";
        Compra compra= null;
        conn.execQuery(sql);
        conn.getNext();                   
        compra = new Compra();              
        compra.setId_compra(conn.getCol("id_compra"));
        compra.setId_usuario(conn.getCol("id_usuario")); 
        compra.setId_proveedor(conn.getCol("id_proveedor"));   
        compra.setId_tipoMoneda(conn.getCol("id_moneda")); 
        compra.setId_comprobante(conn.getCol("id_comprobante")); 
        compra.setNumComprobante(conn.getCol("num_comprobante")); 
        compra.setId_formaPago(conn.getCol("id_forma_pago")); 
        compra.setFechaCompra(conn.getCol("fecha_compra"));
        compra.setDescripcion(conn.getCol("descripcion"));
        compra.setIgv(conn.getCol("igv"));
        compra.setFlete(conn.getCol("flete"));   
        conn.Close(1, 1, 1); 
        return compra; 
    
    }

    public Rep_compras DatosCompra(String id_compra) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_compra, nombre_usuario(id_usuario) as usuario,nombre_proveedor(id_proveedor) as proveedor, "
                    + "nombre_tipo_moneda(id_moneda) as moneda, valor_moneda, nombre_comp(id_comprobante) as comprobante, "
                    + "num_comprobante, nombre_forma_pago(id_forma_pago) as fpago, to_char(fecha_compra,'dd/mm/yyyy') as fecha_compra, "
                    + "igv, flete,direccion_proveedor(id_proveedor) as direccion,abrev_moneda(id_moneda) as abrev "
                    + "from compra where id_compra='"+id_compra+"'";
        Rep_compras rep_compras= null;
        conn.execQuery(sql);
        conn.getNext();                    
        rep_compras = new Rep_compras();              
        rep_compras.setId_compra(conn.getCol("id_compra"));
        rep_compras.setNombre_usuario(conn.getCol("usuario")); 
        rep_compras.setNombre_proveedor(conn.getCol("proveedor"));   
        rep_compras.setNombre_tipo_moneda(conn.getCol("moneda")); 
        rep_compras.setValor_moneda(Double.parseDouble(conn.getCol("valor_moneda")));
        rep_compras.setAbrev_moneda(conn.getCol("abrev"));
        rep_compras.setNombre_comprobante(conn.getCol("comprobante")); 
        rep_compras.setNum_com(conn.getCol("num_comprobante")); 
        rep_compras.setNombre_forma_pago(conn.getCol("fpago")); 
        rep_compras.setFecha_compra(conn.getCol("fecha_compra"));
        rep_compras.setIgv(conn.getCol("igv"));
        rep_compras.setFlete(conn.getCol("flete"));  
        rep_compras.setDireccion_prov(conn.getCol("direccion")); 
        conn.Close(1, 1, 1);
        return rep_compras;
    }

    public List<Rep_compras> ReporteComprasDosFechas(String f_in,String f_fn) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_compra, to_char(fecha_compra,'dd/mm/yyyy') as fecha_compra,nombre_comp(id_comprobante) as comprobante, "
                    + "num_comprobante,nombre_usuario(id_usuario) as usuario,nombre_proveedor(id_proveedor) as proveedor, "
                    + "nombre_tipo_moneda(id_moneda) as moneda, nombre_forma_pago(id_forma_pago) as fpago,igv from compra "
                    + "where fecha_compra between to_date('"+f_in+"','yyyy-mm-dd') and to_date('"+f_fn+"','yyyy-mm-dd') " 
                    + "order by fecha_compra asc";
        
        List<Rep_compras> lista= new ArrayList<Rep_compras>();
        Rep_compras rep_compras= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                rep_compras = new Rep_compras();              
                rep_compras.setId_compra(conn.getCol("id_compra"));
                rep_compras.setFecha_compra(conn.getCol("fecha_compra"));
                rep_compras.setNombre_comprobante(conn.getCol("comprobante"));
                rep_compras.setNum_com(conn.getCol("num_comprobante")); 
                rep_compras.setNombre_usuario(conn.getCol("usuario")); 
                rep_compras.setNombre_proveedor(conn.getCol("proveedor")); 
                rep_compras.setNombre_tipo_moneda(conn.getCol("moneda")); 
                rep_compras.setNombre_forma_pago(conn.getCol("fpago")); 
                rep_compras.setIgv(conn.getCol("igv"));
                lista.add(rep_compras);
            } 
            conn.Close(1, 1, 1);
        return lista;
    }

    public List<Compra> ReporteCompras (){
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_compra, to_char(fecha_compra,'dd/mm/yyyy') as fecha_compra,nombre_comp(id_comprobante) as comprobante, "
                    + "num_comprobante,nombre_usuario(id_usuario) as usuario,nombre_proveedor(id_proveedor) as proveedor, "
                    + "nombre_tipo_moneda(id_moneda) as moneda, nombre_forma_pago(id_forma_pago) as fpago,igv from compra";
        
        List<Compra> lista= new ArrayList<Compra>();
        Compra compra= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                compra = new Compra();              
                compra.setId_compra(conn.getCol("id_compra"));
                compra.setFechaCompra(conn.getCol("fecha_compra"));
                compra.setId_comprobante(conn.getCol("comprobante"));
                compra.setNumComprobante(conn.getCol("num_comprobante")); 
                compra.setId_usuario(conn.getCol("usuario")); 
                compra.setId_proveedor(conn.getCol("proveedor")); 
                compra.setId_tipoMoneda(conn.getCol("moneda")); 
                compra.setId_formaPago(conn.getCol("fpago")); 
                compra.setIgv(conn.getCol("igv"));
                lista.add(compra);
            } 
            conn.Close(1, 1, 1);
        return lista;
    }
    
    public List<Compra> ReporteComprasPropias (){
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_compra, to_char(fecha_compra,'dd/mm/yyyy') as fecha_compra,nombre_comp(id_comprobante) as comprobante, "
                    + "num_comprobante,nombre_usuario(id_usuario) as usuario,nombre_proveedor(id_proveedor) as proveedor, "
                    + "nombre_tipo_moneda(id_moneda) as moneda, nombre_forma_pago(id_forma_pago) as fpago,igv from compra";
        
        List<Compra> lista= new ArrayList<Compra>();
        Compra compra= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                compra = new Compra();              
                compra.setId_compra(conn.getCol("id_compra"));
                compra.setFechaCompra(conn.getCol("fecha_compra"));
                compra.setId_comprobante(conn.getCol("comprobante"));
                compra.setNumComprobante(conn.getCol("num_comprobante")); 
                compra.setId_usuario(conn.getCol("usuario")); 
                compra.setId_proveedor(conn.getCol("proveedor")); 
                compra.setId_tipoMoneda(conn.getCol("moneda")); 
                compra.setId_formaPago(conn.getCol("fpago")); 
                compra.setIgv(conn.getCol("igv"));
                lista.add(compra);
            } 
            conn.Close(1, 1, 1);
        return lista;
    }
    
    public Compra TotalCompras(){
        
        Conexion conn = Configuracion.Datos();
        String sql = "select to_char(sum(total),'999,999,999.99') from compra";
        Compra compra= null;
        conn.execQuery(sql);
        conn.getNext();                   
        compra = new Compra();              
        compra.setId_compra(conn.getCol("id_compra"));
        compra.setId_usuario(conn.getCol("id_usuario")); 
        compra.setId_proveedor(conn.getCol("id_proveedor"));   
        compra.setId_tipoMoneda(conn.getCol("id_moneda")); 
        compra.setId_comprobante(conn.getCol("id_comprobante")); 
        compra.setNumComprobante(conn.getCol("num_comprobante")); 
        compra.setId_formaPago(conn.getCol("id_forma_pago")); 
        compra.setFechaCompra(conn.getCol("fecha_compra"));
        compra.setDescripcion(conn.getCol("descripcion"));
        compra.setIgv(conn.getCol("igv"));
        compra.setFlete(conn.getCol("flete"));   
        conn.Close(1, 1, 1); 
        return compra; 
        
    }
    
    public boolean RegistrarCompra(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="insert into compra "
                    + "(id_usuario, "
                    + "id_proveedor, "
                    + "id_moneda, "
                    + "id_comprobante, "
                    + "num_comprobante, "
                    + "id_forma_pago, "
                    + "fecha_compra, "
                    + "descripcion, "
                    + "igv, "
                    + "flete) "
                    + "values('"+compra.getId_usuario()+"',"
                    + "'"+compra.getId_proveedor()+"',"
                    + "'"+compra.getId_tipoMoneda()+"',"
                    + "'"+compra.getId_comprobante()+"',"
                    + "'"+compra.getNumComprobante()+"',"
                    + "'"+compra.getId_formaPago()+"',"
                    + "to_date('"+compra.getFechaCompra()+"','yyyy-mm-dd'),"
                    + "'"+compra.getDescripcion()+"',"
                    + ""+Double.parseDouble(compra.getIgv())+","
                    + ""+Double.parseDouble(compra.getFlete())+")";
        
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

    public boolean ActualizarCompra(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="update compra set id_usuario='"+compra.getId_usuario()+"', "
                    + "id_proveedor='"+compra.getId_proveedor()+"', "
                    + "id_moneda='"+compra.getId_tipoMoneda()+"', "
                    + "id_comprobante='"+compra.getId_comprobante()+"', "
                    + "id_forma_pago='"+compra.getId_formaPago()+"', "
                    + "valor_moneda=valor_mon('"+compra.getId_tipoMoneda()+"'), "
                    + "igv="+compra.getIgv()+", "
                    + "flete="+compra.getFlete()
                    + " where id_compra='"+compra.getId_compra()+"'";
        
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
    
    public boolean RegistrarCompraPropia(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="insert into compra "
                    + "(id_usuario, "
                    + "id_proveedor, "
                    + "id_moneda, "
                    + "id_comprobante, "
                    + "num_comprobante, "
                    + "id_forma_pago, "
                    + "fecha_compra, "
                    + "descripcion, "
                    + "igv, "
                    + "flete) "
                    + "values('"+compra.getId_usuario()+"',"
                    + "'"+compra.getId_proveedor()+"',"
                    + "'"+compra.getId_tipoMoneda()+"',"
                    + "'"+compra.getId_comprobante()+"',"
                    + "'"+compra.getNumComprobante()+"',"
                    + "'"+compra.getId_formaPago()+"',"
                    + "to_date('"+compra.getFechaCompra()+"','yyyy-mm-dd'),"
                    + "'"+compra.getDescripcion()+"',"
                    + ""+Double.parseDouble(compra.getIgv())+","
                    + ""+Double.parseDouble(compra.getFlete())+")";
        
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
    
    public boolean CargarProductosStock(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="BEGIN CargarProductosStock('"+compra.getId_compra()+"'); END;";
        
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

    public boolean CancelarCargarProductosStock(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="BEGIN CancelarCargarProductosStock('"+compra.getId_compra()+"'); END;";
        
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

    public boolean CargarProductosPropiosStock(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="BEGIN CargarProductosPropiosStock('"+compra.getId_compra()+"'); END;";
        
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

    public boolean CancelarCargarProductosPropiosStock(Compra compra) {
        
        Conexion conn = Configuracion.Datos();
        String query="BEGIN CancelarCargarProductosPropiosStock('"+compra.getId_compra()+"'); END;";
        
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

    

    
    
    
    
    
}
