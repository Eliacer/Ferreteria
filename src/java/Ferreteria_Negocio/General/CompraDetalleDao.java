/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;

import Ferreteria_Entidad.Entidad.CompraDetalle;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class CompraDetalleDao {
    
    public boolean RegistrarCompraDetalle(CompraDetalle cd){
    
        Conexion conn = Configuracion.Datos();
        String query="insert into compra_detalle "
                    + "(id_compra, "
                    + "id_producto, "
                    + "id_unidad, "
                    + "cant_mayor, "
                    + "cant_menor, "
                    + "costo_mayor,pf,control) "
                    + "values('"+cd.getId_compra()+"',"
                    + "'"+cd.getId_producto()+"',"
                    + "'"+cd.getId_unidad()+"',"
                    + cd.getCantMayor()+","
                    + cd.getCantMenor()+","
                    + cd.getCostoMayor()+",'0','0')";
        
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
    
    public boolean ActualizarCompraDetalle(CompraDetalle cd){
        
        Conexion conn = Configuracion.Datos();
        String query="update compra_detalle set id_unidad='"+cd.getId_unidad()+"',cant_mayor="+cd.getCantMayor()+
                    ",cant_menor="+cd.getCantMenor()+",costo_mayor="+cd.getCostoMayor()+
                    " where id_compra='"+cd.getId_compra()+"' and id_producto='"+cd.getId_producto()+"'";
        
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
    
    public boolean BorrarCompraDetalle(CompraDetalle cd){
        
        Conexion conn = Configuracion.Datos();
        String query="delete from compra_detalle where id_compra='"+cd.getId_compra()+"' and id_producto='"+cd.getId_producto()+"'";      
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
    
    public boolean BorrarCompraDetalles(CompraDetalle cd){
        
        Conexion conn = Configuracion.Datos();
        String query="delete from compra_detalle where id_compra='"+cd.getId_compra()+"'";      
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
    
    public List<CompraDetalle> ReporteCompraDetalles(CompraDetalle cd){
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_compra,id_producto,cant_mayor as cant,und_producto(id_compra,id_producto) as und, "
                + "substr(nombre_producto(id_producto),0,20) as producto,costo_mayor,cant_mayor*costo_mayor as importe "
                + "from compra_detalle where id_compra='"+cd.getId_compra()+"'";
        List<CompraDetalle> lista = new ArrayList<CompraDetalle>();
        CompraDetalle detalleCompra= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                detalleCompra = new CompraDetalle();              
                detalleCompra.setId_compra(conn.getCol("id_compra"));
                detalleCompra.setCantMayor(Integer.parseInt(conn.getCol("cant"))); 
                detalleCompra.setId_unidad(conn.getCol("und"));   
                detalleCompra.setId_producto(conn.getCol("id_producto")); 
                detalleCompra.setProducto(conn.getCol("producto")); 
                detalleCompra.setCostoMayor(Double.parseDouble(conn.getCol("costo_mayor"))); 
                detalleCompra.setImporte(Double.parseDouble(conn.getCol("importe"))); 
                lista.add(detalleCompra);
            }
        conn.Close(1, 1, 1);
        return lista;
    }
    
    public CompraDetalle DatosCompraDetalle(CompraDetalle cd){
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_compra,id_producto,cant_mayor,cant_menor,id_unidad as und,costo_mayor "
                + "from compra_detalle where id_compra='"+cd.getId_compra()+"' and id_producto='"+cd.getId_producto()+"'";
        CompraDetalle detalleCompra= null;
        conn.execQuery(sql);
        conn.getNext();                  
        detalleCompra = new CompraDetalle();              
        detalleCompra.setId_compra(conn.getCol("id_compra"));
        detalleCompra.setId_producto(conn.getCol("id_producto"));
        detalleCompra.setCantMayor(Integer.parseInt(conn.getCol("cant_mayor"))); 
        detalleCompra.setCantMenor(Integer.parseInt(conn.getCol("cant_menor"))); 
        detalleCompra.setId_unidad(conn.getCol("und"));   
        detalleCompra.setCostoMayor(Double.parseDouble(conn.getCol("costo_mayor"))); 
        conn.Close(1, 1, 1);       
        return detalleCompra;
    }
    
}
