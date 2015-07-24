/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;


import Ferreteria_Entidad.Entidad.CatCliente;
import Ferreteria_Entidad.Entidad.Comprobante;
import Ferreteria_Entidad.Entidad.ComprobanteConfig;
import Ferreteria_Entidad.Entidad.FormaPago;
import Ferreteria_Entidad.Entidad.Rep_ventas;
import Ferreteria_Entidad.Entidad.TipoMoneda;
import Ferreteria_Entidad.Entidad.Venta;
import Ferreteria_Entidad.Entidad.VentaDetalle;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class VentaDao{

    public List<FormaPago> ListarFormapago() {
        
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

    public List<Comprobante> ListarCompVenta() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_configuracion as id,nombre_comp(id_comprobante) as nombre " +
                     "from comprobante_config where estado='1'";
        List<Comprobante> lista = new ArrayList<Comprobante>();
        Comprobante comp= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                comp = new Comprobante();              
                comp.setIdComprobante(conn.getCol("id"));
                comp.setNombreComprobante(conn.getCol("nombre"));           
                lista.add(comp);   
            }  
        conn.Close(1, 1, 1);
        return lista; 
        
        
    }

    public List<TipoMoneda> ListarMoneda() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_moneda,initcap(nombre) as nombre, valor_actual from tipo_moneda ";
        List<TipoMoneda> lista = new ArrayList<TipoMoneda>();
        TipoMoneda tm= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                tm = new TipoMoneda();              
                tm.setIdMoneda(conn.getCol("id_moneda"));
                tm.setNombre(conn.getCol("nombre")); 
                tm.setValorActual(Double.parseDouble(conn.getCol("valor_actual")));
                lista.add(tm);   
            }  
        conn.Close(1, 1, 1);
        return lista; 
    }

    public boolean IniciarVenta(String id_config) {
        
        Conexion conn = Configuracion.Datos();
        String query="BEGIN actualizar_contmax('"+id_config+"'); end;";
        
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
 
    public boolean RegistrarVenta(Venta venta) {
        
        Conexion conn = Configuracion.Datos();
        String query="insert into venta "
                    + "(id_usuario, "
                    + "id_cliente, "
                    + "id_configuracion, "
                    + "id_forma_pago, "
                    + "id_categoria,igv) "
                    + "values('"+venta.getId_usuario()  +"',"
                    + "'"+venta.getId_cliente()         +"',"
                    + "'"+venta.getId_configuracion()   +"',"
                    + "'"+venta.getId_formaPago()       +"',"
                    + "'"+venta.getIdTipoCliente()      +"',"
                    + venta.getIgv()+")";
        
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
    
    public boolean RegistrarDetVenta(VentaDetalle detalleVenta) {
        
        double descuento=0;
        descuento=(detalleVenta.getCantidad()*detalleVenta.getPreciounitario())*(detalleVenta.getDescuento()/100);
        Conexion conn = Configuracion.Datos();
        String query="insert into venta_detalle "
                    + "(id_venta, "
                    + "id_producto, "
                    + "cantidad, "
                    + "precio_unitario, "
                    + "descuento,control) "
                    + "values('"+detalleVenta.getId_venta()  +"',"
                    + "'"+detalleVenta.getId_producto()      +"',"
                    + ""+detalleVenta.getCantidad()          +","
                    + ""+detalleVenta.getPreciounitario()   +","
                    + ""+descuento+",'0')";
        
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

    public boolean Stockventa(String id_venta) {
        
        Conexion conn = Configuracion.Datos();
        String query="BEGIN STOCK_VENTA('"+id_venta+"'); END;";
        
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

    public ComprobanteConfig ObtenerCompConfig(String id_configuracion) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_configuracion,id_comprobante,serie "
                    + "from comprobante_config "
                    + "where id_configuracion='"+id_configuracion+"'";
        
        ComprobanteConfig comprobante= null;
            conn.execQuery(sql);
            conn.getNext();                   
                comprobante = new ComprobanteConfig();              
                comprobante.setIdConfiguracion(conn.getCol("id_configuracion"));
                comprobante.setIdComprobante(conn.getCol("id_comprobante")); 
                comprobante.setSerie(conn.getCol("serie"));   
        conn.Close(1, 1, 1);
        return comprobante;
    }
 
    public Venta ObtenerNumComp(String id_usuario, String id_cliente, String id_config) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select max(num_comprobante) as comp from venta where id_usuario='"+id_usuario+"' "
                    + "and id_cliente='"+id_cliente+"' and id_configuracion=('"+id_config+"')";
        Venta venta= null;
        
            conn.execQuery(sql);
            conn.getNext();                  
            venta = new Venta();              
            venta.setNumComprobante(conn.getCol("comp"));
                
        conn.Close(1, 1, 1);
        return venta;
    }
       
    public Venta ObtenerVentaid(String id_venta) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from venta where id_venta='"+id_venta+"'";
        Venta venta= null;
        
            conn.execQuery(sql);
            conn.getNext();                   
                    venta = new Venta();              
                venta.setId_venta(conn.getCol("id_venta"));
                venta.setId_usuario(conn.getCol("id_usuario"));
                venta.setId_cliente(conn.getCol("id_cliente")); 
                venta.setFechaventa(conn.getCol("fecha_venta")); 
                venta.setId_formaPago(conn.getCol("id_forma_pago"));   
                venta.setId_configuracion(conn.getCol("id_configuracion")); 
                venta.setIdTipoCliente(conn.getCol("id_categoria")); 
                venta.setIgv(Double.parseDouble(conn.getCol("igv")));
                venta.setNumComprobante(conn.getCol("num_comprobante"));
                venta.setEstado(conn.getCol("estado"));
                         
        conn.Close(1, 1, 1);
        return venta;
    }
    
    public Venta ObtenerVenta(String numComp, String config) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_venta from venta where num_comprobante='"+numComp+"' and id_configuracion=('"+config+"')";
        Venta venta= null;
        
        conn.execQuery(sql);
        conn.getNext();                  
                venta = new Venta();              
                venta.setId_venta(conn.getCol("id_venta"));
                         
        conn.Close(1, 1, 1);
        return venta;
    }

    public VentaDetalle ObtenerDetVenta(String id_venta, String id_producto) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_venta,id_producto,cantidad,precio_unitario "
                    + "from venta_detalle where id_venta='"+id_venta+"' and id_producto='"+id_producto+"'";
        VentaDetalle detalleVenta= null;
        conn.execQuery(sql);
        conn.getNext();
                detalleVenta = new VentaDetalle();              
                detalleVenta.setId_venta(conn.getCol("id_venta"));
                detalleVenta.setId_producto(conn.getCol("id_producto"));
                detalleVenta.setCantidad(Integer.parseInt(conn.getCol("cantidad"))); 
                detalleVenta.setPreciounitario(Double.parseDouble(conn.getCol("precio_unitario"))); 
                 
        conn.Close(1, 1, 1);
        return detalleVenta;
    }
   
    public List<VentaDetalle> ListarProductosVenta(String id_venta) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_producto,cantidad,substr(nombre_producto(id_producto),0,20) as producto, "
                    + "precio_unitario,trunc(descuento,2) as dcto,cantidad*precio_unitario as subtotal "
                    + "from venta_detalle where id_venta='"+id_venta+"'";
        List<VentaDetalle> lista = new ArrayList<VentaDetalle>();
        VentaDetalle detalleVenta= null;
        conn.execQuery(sql);
        while (conn.getNext()) {                    
                detalleVenta = new VentaDetalle();              
                detalleVenta.setId_producto(conn.getCol("id_producto")); 
                detalleVenta.setCantidad(Integer.parseInt(conn.getCol("cantidad")));   
                detalleVenta.setProducto(conn.getCol("producto")); 
                detalleVenta.setPreciounitario(Double.parseDouble(conn.getCol("precio_unitario"))); 
                detalleVenta.setDescuento(Double.parseDouble(conn.getCol("dcto"))); 
                detalleVenta.setSubtotal(Double.parseDouble(conn.getCol("subtotal")));
                lista.add(detalleVenta);
            }  
        conn.Close(1, 1, 1);
        return lista;
    }

    public Venta ObtenerDatosVenta(String id_venta) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select nombre_usuario(id_usuario) as us,nombre_cliente(id_cliente) as cliente, "
                   + "to_char(fecha_venta,'dd/mm/yyyy') as fv,nombre_forma_pago(id_forma_pago) as forma, "
                   + "nombre_comp_venta(id_configuracion) as conp,serieventa(id_configuracion) as serie, "
                   + "num_comprobante,igv from venta where id_venta='"+id_venta+"'";
        Venta venta= null;
        
        conn.execQuery(sql);
        conn.getNext();                   
            venta = new Venta();              
            venta.setId_usuario(conn.getCol("us"));
            venta.setId_cliente(conn.getCol("cliente")); 
            venta.setFechaventa(conn.getCol("fv")); 
            venta.setId_formaPago(conn.getCol("forma"));   
            venta.setId_configuracion(conn.getCol("conp")); 
            venta.setSerie(conn.getCol("serie")); 
            venta.setNumComprobante(conn.getCol("num_comprobante"));  
            venta.setIgv(Double.parseDouble(conn.getCol("igv")));
        conn.Close(1, 1, 1);
        return venta;
    }

    public boolean DeleteProdVenta(String id_venta, String id_producto) {
           
        Conexion conn = Configuracion.Datos();
        String query="delete from venta_detalle where id_venta='"+id_venta+"' and id_producto='"+id_producto+"'";
        
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

    public boolean UpdateVenta(Venta venta) {
        
        Conexion conn = Configuracion.Datos();
        String query="update venta set id_usuario='"+venta.getId_usuario()+"', "
                    + "id_cliente='"+venta.getId_cliente()+"', "
                    + "id_configuracion='"+venta.getId_configuracion()+"', "
                    + "id_forma_pago='"+venta.getId_formaPago()+"', "
                    + "id_categoria='"+venta.getIdTipoCliente()+"', "
                    + "igv="+venta.getIgv()+" where id_venta='"+venta.getId_venta()+"'";
        
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
    
    public boolean UpdateDetVenta(VentaDetalle dv) {
        
        double descuento=0;
        descuento=(dv.getCantidad()*dv.getPreciounitario())*(dv.getDescuento()/100);           
        Conexion conn = Configuracion.Datos();
        String query="update venta_detalle set cantidad="+dv.getCantidad()+", "
                    + "precio_unitario="+dv.getPreciounitario()+",descuento="+descuento
                    +" where id_venta='"+dv.getId_venta()+"' and id_producto='"+dv.getId_producto()+"'";
        
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

    public CatCliente ObtenerDcto(String id_venta) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select porc_descuento(id_venta) as dcto from venta where id_venta='"+id_venta+"'";
        CatCliente catCliente= null;
        
        conn.execQuery(sql);
        conn.getNext();                   
                catCliente = new CatCliente();              
                catCliente.setDescuento(Double.parseDouble(conn.getCol("dcto")));
                        
        conn.Close(1, 1, 1);
        return catCliente;
    }  

    public List<Rep_ventas> ListarVentas(String f_in,String f_fn) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select to_char(fecha_venta,'dd/mm/yy') as fecha_venta,nombre_usuario(id_usuario) as usuario, "
                    + "nombre_cliente(id_cliente) as cliente,nombre_comp_venta(id_configuracion) as comprobante, "
                    + "num_comprobante,nombre_forma_pago(id_forma_pago) as forma_pago from venta "
                    + "where fecha_venta between to_date('"+f_in+"','yyyy-mm-dd') and to_date('"+f_fn+"','yyyy-mm-dd') " 
                    + "order by fecha_venta,num_comprobante asc";
        
        List<Rep_ventas> lista= new ArrayList<Rep_ventas>();
        Rep_ventas rep_ventas= null;
        conn.execQuery(sql);
        while (conn.getNext()) {                    
                rep_ventas = new Rep_ventas();              
                rep_ventas.setFecha_venta(conn.getCol("fecha_venta"));
                rep_ventas.setNombre_comprobante(conn.getCol("comprobante"));
                rep_ventas.setNum_com(conn.getCol("num_comprobante")); 
                rep_ventas.setNombre_usuario(conn.getCol("usuario")); 
                rep_ventas.setNombre_cliente(conn.getCol("cliente")); 
                rep_ventas.setNombre_forma_pago(conn.getCol("forma_pago")); 
                lista.add(rep_ventas);
            }  
        conn.Close(1, 1, 1);
        return lista;
    }
}
