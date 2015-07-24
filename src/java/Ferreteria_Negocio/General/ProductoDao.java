
package Ferreteria_Negocio.General;

import Ferreteria_Entidad.Entidad.Producto;
import Ferreteria_Entidad.Entidad.Rep_Inventario;
import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author Eliacer Fernandez
 */
public class ProductoDao{

    public boolean AgregarProducto(Producto producto) {
        
        Conexion conn = Configuracion.Datos();
        String query = "insert into producto "
                + "values ('','"+producto.getCodigo()
                +"','" +producto.getNombre()
                +"','" +producto.getId_unidad_medida()
                +"',0,0,0," +producto.getPorc_ganacia()
                +",'','" +producto.getId_categoria()
                +"','" +producto.getId_marca()
                +"','" +producto.getId_ubicacion()
                +"','" +producto.getDescripcion()+"')";

        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1);
            return true;
        } catch (Exception e) {
           conn.RollBack();
           conn.Close(1, 1, 1);
            System.out.println(query);
            return false;
        }
    } 
  
    public Producto ObtenerProducto (Producto producto)
    {
        Conexion conn = Configuracion.Datos();
        String query = "select * from producto where id_producto='"+producto.getId_producto()+"'";
        Producto pr = null;
        conn.execQuery(query);
                      
            while (conn.getNext()) {
                pr= new Producto();
                pr.setId_producto(conn.getCol("id_producto"));
                pr.setCodigo(conn.getCol("codigo"));
                pr.setNombre(conn.getCol("nombre"));
                pr.setId_unidad_medida(conn.getCol("id_unidad_medida"));
                pr.setPorc_ganacia(Double.parseDouble((conn.getCol("porc_ganancia"))));
                pr.setPrecio(Double.parseDouble(conn.getCol("precio")));
                pr.setStock_actual(Integer.parseInt(conn.getCol("stock_actual")));
                pr.setFecha_reg(conn.getCol("fecha_reg"));
                pr.setId_categoria(conn.getCol("id_categoria"));
                pr.setId_marca(conn.getCol("id_marca"));
                pr.setId_ubicacion(conn.getCol("id_ubicacion"));
                pr.setDescripcion(conn.getCol("descripcion"));              
            }
        conn.Close(1, 1, 1);
        return pr;
    }
 
    public boolean EliminarProducto(Producto producto) {
        
        Conexion conn = Configuracion.Datos();
        String query="delete from producto where id_producto='"+producto.getId_producto()+"'";  
        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1);
            return true;
        } catch (Exception e) {
           conn.RollBack();
           conn.Close(1, 1, 1);
            System.out.println(query);
            return false;
        }
    }

    public boolean ActualizarProducto(Producto producto) {
            
        Conexion conn = Configuracion.Datos();
        String query = "update producto set "
                +"  codigo=upper('"+producto.getCodigo()
                +"'),nombre=upper('"+producto.getNombre()
                +"'),id_unidad_medida='"+producto.getId_unidad_medida()
                +"',porc_ganancia="+producto.getPorc_ganacia()
                +",id_categoria='"+producto.getId_categoria()
                +"',id_marca='"+producto.getId_marca()
                +"',id_ubicacion='"+producto.getId_ubicacion()
                +"',descripcion='"+producto.getDescripcion()
                +"' where id_producto='"+producto.getId_producto()+"'";
        try {
            conn.execC(query);
            conn.Commit();
            conn.Close(1, 1, 1);
            return true;
        } catch (Exception e) {
           conn.RollBack();
           conn.Close(1, 1, 1);
            System.out.println(query);
            return false;
        }
      
    }

    public List<Producto> ReporteProductos(Producto pr) {
         
        Conexion conn = Configuracion.Datos();
        List<Producto> lista = new ArrayList<Producto>();
        String query = "select p.id_producto as id_producto,p.nombre ||' ' ||um.abreviatura as producto, upper(m.nombre_marca) as marca, "
                     + "p.precio as precio, p.stock_actual as stock, p.porc_ganancia as pgan,u.nombre_ubicacion as ubicacion "
                     + "from producto p, marca m, ubicacion u,unidad_medida um "
                     + "where m.id_marca=nvl(p.id_marca,'00001') and "
                     + "u.id_ubicacion=nvl(p.id_ubicacion,'00001') and um.id_unidad_medida=p.id_unidad_medida and "
                     + "upper(p.nombre||m.nombre_marca||um.abreviatura||p.precio||p.stock_actual||u.nombre_ubicacion||p.porc_ganancia) like upper('%"+pr.getNombre()+"%') order by nombre asc";   
        int nro = 1;
        conn.execQuery(query);
            while (conn.getNext()) { 
                Producto producto= new Producto();
                producto.setId_producto(conn.getCol("id_producto"));
                producto.setNro(nro++);
                producto.setNombre(conn.getCol("producto"));
                producto.setId_marca(conn.getCol("marca"));
                producto.setPorc_ganacia(Double.parseDouble(conn.getCol("pgan")));
                producto.setPrecio(Double.parseDouble(conn.getCol("precio")));
                producto.setStock_actual(Integer.parseInt(conn.getCol("stock")));           
                producto.setId_ubicacion(conn.getCol("ubicacion"));
                lista.add(producto);      
            }
        conn.Close(1, 1, 1);
        return lista;
    }
    
    public Producto DatosProducto(Producto producto) {
         Conexion conn = Configuracion.Datos();
        String query = "select * from producto where id_producto='"+producto.getId_producto()+"'";
        Producto pr = null;
        conn.execQuery(query);
            conn.getNext();
            pr= new Producto();
            pr.setId_producto(conn.getCol("id_producto"));
            pr.setCodigo(conn.getCol("codigo"));
            pr.setNombre(conn.getCol("nombre"));
            pr.setId_categoria(conn.getCol("id_categoria"));
            pr.setId_marca(conn.getCol("id_marca"));
            pr.setId_unidad_medida(conn.getCol("id_unidad_medida"));
            pr.setId_ubicacion(conn.getCol("id_ubicacion"));
            pr.setPorc_ganacia(Double.parseDouble(conn.getCol("porc_ganancia")));
            pr.setPrecio(Double.parseDouble(conn.getCol("precio")));
            pr.setStock_actual(Integer.parseInt(conn.getCol("stock_actual")));
            pr.setDescripcion(conn.getCol("descripcion"));
        conn.Close(1, 1, 1);
        return pr;
    
    }


    public List<Rep_Inventario> InventarioProducto() {
        
        Conexion conn = Configuracion.Datos();
        List<Rep_Inventario> lista = new ArrayList<Rep_Inventario>();
    
        Rep_Inventario producto = null;
        String query = "select id_producto,nombre_producto(id_producto) as producto,stock_actual, trunc(costo_promedio(id_producto),2) as costo, "
                     + "trunc(precio_promedio(id_producto),2) as precio, "
                     + "trunc(porcentaje_utilidad(id_producto),2) as utilidad from producto order by producto asc";
        conn.execQuery(query);
            while (conn.getNext()) { 
                producto = new Rep_Inventario();
                producto.setId_producto(conn.getCol("id_producto"));
                producto.setProducto(conn.getCol("producto"));
                producto.setPrecio(Double.parseDouble(conn.getCol("precio")));
                producto.setStock_actual(Integer.parseInt(conn.getCol("stock_actual")));           
                producto.setCosto(Double.parseDouble(conn.getCol("costo")));
                producto.setUtilidad(Double.parseDouble(conn.getCol("utilidad")));
                lista.add(producto);      
            }
            conn.Close(1, 1, 1);
        return lista;
    }

    public List<Producto> ProductosPotenciales() {
        
        Conexion conn = Configuracion.Datos();
        List<Producto> lista = new ArrayList<Producto>();
       
        Producto producto = null;
        String query = "select * from ( select distinct p.nombre as producto,nombre_marca(p.id_marca) as marca, "
                    + "trunc(monto_producto(p.id_producto),2) as monto "
                    + "from venta_detalle vd, producto p where p.id_producto=vd.id_producto order by monto desc) "
                    + "where rownum<=4";  
        
            conn.execQuery(query);    
            while (conn.getNext()) { 
                producto = new Producto();
                producto.setNombre(conn.getCol("producto"));
                producto.setId_marca(conn.getCol("marca"));
                producto.setPrecio(Double.parseDouble(conn.getCol("monto")));
                lista.add(producto);      
            }
        
        conn.Close(1, 1, 1);
        return lista;
    }
    
    
    
    
}