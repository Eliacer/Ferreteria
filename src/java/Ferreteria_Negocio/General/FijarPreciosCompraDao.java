/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;

import Ferreteria_Entidad.Entidad.Compra;
import Ferreteria_Entidad.Entidad.CompraDetalle;
import Ferreteria_Entidad.Entidad.KardexProducto;
import Ferreteria_Entidad.Entidad.Producto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class FijarPreciosCompraDao {

    public List<Compra> ListarComprasNoFijadasPrecios() {
        
        Conexion conn = Configuracion.Datos();
        List<Compra> lista = new ArrayList<Compra>();
        Compra compra = null;
        String sql = "select id_compra,to_char(fecha_compra,'dd/mm/yyyy') as fc,nombre_comp(id_comprobante) as comp, "
                    + "num_comprobante,nombre_proveedor(id_proveedor) as prov,nombre_forma_pago(id_forma_pago) as fp, "
                    + "precio_fijado from compra where precio_fijado='0'";   
            
            conn.execQuery(sql);
            while (conn.getNext()) { 
                compra = new Compra();
                compra.setId_compra(conn.getCol("id_compra"));
                compra.setFechaCompra(conn.getCol("fc"));
                compra.setId_comprobante(conn.getCol("comp"));
                compra.setNumComprobante(conn.getCol("num_comprobante"));           
                compra.setId_proveedor(conn.getCol("prov"));
                compra.setId_formaPago(conn.getCol("fp"));           
                compra.setPrecio_fijado(conn.getCol("precio_fijado"));
                
                lista.add(compra);      
            }
        conn.Close(1, 1, 1);
        return lista;
    }
    
    public List<CompraDetalle> ListarCompraPrecioSugerido(String id_compra) {
        
        Conexion conn = Configuracion.Datos();
        List<CompraDetalle> lista = new ArrayList<CompraDetalle>();
        CompraDetalle compra = null;
        String sql = "select cd.id_compra,cd.id_producto,nombre_producto(cd.id_producto) as producto,round(cd.costo_und,2) as costo, "
                    + "round(costo_producto(cd.id_producto,cd.id_compra)+(costo_producto(cd.id_producto,cd.id_compra)*(porc_gan(cd.id_producto)/100)),2) as psugerido, "
                    + "cd.pf,round(precio_producto(cd.id_producto),2) as pr,abrev_moneda(c.id_moneda) as abrev "
                    + "from compra_detalle cd,compra c "
                    + "where c.id_compra=cd.id_compra and cd.id_compra='"+id_compra+"'";   
        
            conn.execQuery(sql);
            while (conn.getNext()) { 
                compra = new CompraDetalle();
                compra.setId_compra(conn.getCol("id_compra"));
                compra.setId_producto(conn.getCol("id_producto"));
                compra.setCostoUnidad(Double.parseDouble(conn.getCol("costo")));
                compra.setProducto(conn.getCol("producto"));           
                compra.setPsugerido(Double.parseDouble(conn.getCol("psugerido")));
                compra.setPf(conn.getCol("pf"));
                compra.setPrecio(conn.getCol("pr"));
                compra.setAbrev(conn.getCol("abrev"));
                lista.add(compra);      
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public boolean UpdateProdPrecio(Producto producto) {
        
        Conexion conn = Configuracion.Datos();
        String query = "update producto set "
                +"precio="+producto.getPrecio()
                +" where id_producto='"+producto.getId_producto()+"'";
       
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

    public boolean UpdatePrecio(String id_compra) {
        
        Conexion conn = Configuracion.Datos();
        String query = "update compra set "
                    +"precio_fijado='1', fecha_asig=sysdate where id_compra='"+id_compra+"'";
       
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

    public boolean Updatedetapf(String id_compra, String id_producto) {
        
        Conexion conn = Configuracion.Datos();
        String query = "update compra_detalle set "
                      +"pf='1' where id_compra='"+id_compra+"' and id_producto='"+id_producto+"'";
       
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

    public List<KardexProducto> Kardexproducto(String id_producto) {
        
        Conexion conn = Configuracion.Datos();
        List<KardexProducto> lista = new ArrayList<KardexProducto>();
        KardexProducto kardexProducto = null;
        String sql = "select * from ( "
                + "select p.id_producto as id_producto,c.id_compra as id_movimiento,to_char(c.fecha_compra,'dd-mm-yyyy') as fecha, c.fecha_compra as fech, "
                + "decode(c.e_s,'E','Compra','Venta') as movimiento,p.nombre as producto,cd.cant_mayor as cantidad, "
                + "und_producto(cd.id_compra,cd.id_producto) as und,nombre_comp(c.id_comprobante) as comprobante, "
                + "c.num_comprobante,nombre_proveedor(c.id_proveedor) as proveedor_cliente from compra_detalle cd "
                + "inner join producto p on p.id_producto=cd.id_producto and p.id_producto='"+id_producto+"' "
                + "inner join compra c on c.id_compra=cd.id_compra "
                + "union "
                + "select pr.id_producto as id_producto,v.id_venta as id_movimiento,to_char(v.fecha_venta,'dd-mm-yyyy') as fecha, v.fecha_venta as fech, "
                + "decode(v.e_s,'S','Venta','Compra') as movimiento,pr.nombre as producto,vd.cantidad as cantidad, "
                + "und_producto_venta(pr.id_unidad_medida) as und,nombre_comp_venta(id_configuracion) as comprobante, "
                + "serieventa(v.id_configuracion)||'-'||v.num_comprobante as num_comprobante, "
                + "nombre_cliente(v.id_cliente) as proveedor_cliente from venta_detalle vd "
                + "inner join producto pr on pr.id_producto=vd.id_producto and pr.id_producto='"+id_producto+"' "
                + "inner join venta v on v.id_venta=vd.id_venta) "
                + "order by fech asc"; 
        
        conn.execQuery(sql);
            while (conn.getNext()) { 
                kardexProducto = new KardexProducto();
                kardexProducto.setFecha(conn.getCol("fecha"));
                kardexProducto.setMovimiento(conn.getCol("movimiento"));
                kardexProducto.setProducto(conn.getCol("producto"));
                kardexProducto.setCantidad(Integer.parseInt(conn.getCol("cantidad")));           
                kardexProducto.setUnd(conn.getCol("und"));
                kardexProducto.setComprobante(conn.getCol("comprobante"));           
                kardexProducto.setNum_comp(conn.getCol("num_comprobante"));
                kardexProducto.setProv_cliente(conn.getCol("proveedor_cliente"));
                
                lista.add(kardexProducto);      
            }
        conn.Close(1, 1, 1);
        return lista;
    }
}
