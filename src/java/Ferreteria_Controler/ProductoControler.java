/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Controler;

import Ferreteria_Entidad.Entidad.Categoria;
import Ferreteria_Entidad.Entidad.Marca;
import Ferreteria_Entidad.Entidad.Producto;
import Ferreteria_Entidad.Entidad.Ubicacion;
import Ferreteria_Entidad.Entidad.UndMedida;
import Ferreteria_Negocio.General.ProductoDao;
import Ferreteria_Negocio.General.UtilitariosDao;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class ProductoControler implements ModelDriven<Producto> {
    
    Producto producto = new Producto();
    UndMedida undMedida = new UndMedida();
    Marca marca = new Marca();
    Ubicacion ubicacion = new Ubicacion();
    Categoria categoria = new Categoria();
    UtilitariosDao utilitariosDao;
    ProductoDao productoDao;
    List<Ubicacion> ReporteUbicacion = new ArrayList<Ubicacion>();
    List<UndMedida> ReporteUndMedida = new ArrayList<UndMedida>(); 
    List<Marca> ReporteMarca = new ArrayList<Marca>(); 
    List<Producto> ReporteProducto = new ArrayList<Producto>();
    List<Categoria> ReporteCategoria = new ArrayList<Categoria>();
    String sms = "", alert="", result="";

    @Override
    public Producto getModel() {
        return producto;
    }

    public ProductoControler() {
        utilitariosDao = new UtilitariosDao();
        productoDao = new ProductoDao();
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public UndMedida getUndMedida() {
        return undMedida;
    }

    public void setUndMedida(UndMedida undMedida) {
        this.undMedida = undMedida;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public Ubicacion getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(Ubicacion ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public List<Ubicacion> getReporteUbicacion() {
        return ReporteUbicacion;
    }

    public void setReporteUbicacion(List<Ubicacion> ReporteUbicacion) {
        this.ReporteUbicacion = ReporteUbicacion;
    }

    public List<UndMedida> getReporteUndMedida() {
        return ReporteUndMedida;
    }

    public void setReporteUndMedida(List<UndMedida> ReporteUndMedida) {
        this.ReporteUndMedida = ReporteUndMedida;
    }

    public List<Marca> getReporteMarca() {
        return ReporteMarca;
    }

    public void setReporteMarca(List<Marca> ReporteMarca) {
        this.ReporteMarca = ReporteMarca;
    }

    public List<Producto> getReporteProducto() {
        return ReporteProducto;
    }

    public void setReporteProducto(List<Producto> ReporteProducto) {
        this.ReporteProducto = ReporteProducto;
    }

    public List<Categoria> getReporteCategoria() {
        return ReporteCategoria;
    }

    public void setReporteCategoria(List<Categoria> ReporteCategoria) {
        this.ReporteCategoria = ReporteCategoria;
    }

    public String getSms() {
        return sms;
    }

    public void setSms(String sms) {
        this.sms = sms;
    }

    public String getAlert() {
        return alert;
    }

    public void setAlert(String alert) {
        this.alert = alert;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    
    
    
    //Metodos
    
    public String Reporte() {
        sms = "ver";
        ReporteProducto = productoDao.ReporteProductos(producto);
        return "fin";
    }

    public String Nueva() {
        sms = "nueva";
        return "fin";
    }
    
    public String NuevoProducto() {
        sms = "nueva";
        ReporteUbicacion = utilitariosDao.ReporteUbicacion();
        ReporteUndMedida = utilitariosDao.ReporteUndMedida();
        ReporteMarca = utilitariosDao.ReporteMarca();
        ReporteCategoria = utilitariosDao.ReporteCategoria();
        return "fin";
    }
    
    public String AgregarProducto() {
        if (productoDao.AgregarProducto(producto)) {
            result = "Producto registrado";
        } else {
            result = "Producto no registrado";
        }
        sms = "ver";
        ReporteProducto = productoDao.ReporteProductos(producto);
        return "fin";
    }
    
    public String EditarProducto() {
        sms = "editar";
        ReporteUbicacion = utilitariosDao.ReporteUbicacion();
        ReporteUndMedida = utilitariosDao.ReporteUndMedida();
        ReporteMarca = utilitariosDao.ReporteMarca();
        ReporteCategoria = utilitariosDao.ReporteCategoria();
        producto = productoDao.DatosProducto(producto);
        
        return "fin";
    }
    
    public String ActualizarProducto(){
    if (productoDao.ActualizarProducto(producto)) {
            result = "Producto actualizado";
        } else {
            result = "Producto no actualizado";
        }
        sms = "ver";
        ReporteProducto = productoDao.ReporteProductos(producto);
        return "fin";
    }
    
     public String EliminarProducto() {
        if (productoDao.EliminarProducto(producto)) {
            result = "Producto eliminado";
        } else {
            result = "Producto no eliminado";
        }
        sms = "ver";
        ReporteProducto = productoDao.ReporteProductos(producto);
        return "fin";
    }
}
