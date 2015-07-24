/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Controler;


import Ferreteria_Entidad.Entidad.Categoria;
import Ferreteria_Entidad.Entidad.Comprobante;
import Ferreteria_Entidad.Entidad.FormaPago;
import Ferreteria_Entidad.Entidad.TipoMoneda;
import Ferreteria_Entidad.Entidad.Ubicacion;
import Ferreteria_Entidad.Entidad.UndMedida;
import Ferreteria_Entidad.Entidad.Unidad;
import Ferreteria_Negocio.General.CompraDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class CompraControler {
    
    Comprobante comprobante = new Comprobante();
    FormaPago formaPago = new FormaPago();
    TipoMoneda tipoMoneda = new TipoMoneda();
    //Marca marca = new Marca();
    Categoria categoria = new Categoria();
    Ubicacion ubicacion = new  Ubicacion();
    Unidad unidad = new Unidad();
    UndMedida undMedida = new UndMedida();
    CompraDao compraDao;
    List<Comprobante> ListarComprobante = new ArrayList<Comprobante>();
    List<TipoMoneda> ListarTipoMoneda = new ArrayList<TipoMoneda>();
    List<FormaPago> ListarFormaPago = new ArrayList<FormaPago>();
    //List<Marca> ListarMarca = new ArrayList<Marca>();
    List<Categoria> ListarCatwgoria = new ArrayList<Categoria>();
    List<Ubicacion> ListarUbicacion = new ArrayList<Ubicacion>();
    List<Unidad> ListarUnidad = new ArrayList<Unidad>();
    List<UndMedida> ListarUndMedida = new ArrayList<UndMedida>();
    String sms = "", result = "", window="";
    
    public CompraControler() {
        compraDao = new CompraDao();
        
    }

    public Comprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }

    public FormaPago getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(FormaPago formaPago) {
        this.formaPago = formaPago;
    }

    public TipoMoneda getTipoMoneda() {
        return tipoMoneda;
    }

    public void setTipoMoneda(TipoMoneda tipoMoneda) {
        this.tipoMoneda = tipoMoneda;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Ubicacion getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(Ubicacion ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Unidad getUnidad() {
        return unidad;
    }

    public void setUnidad(Unidad unidad) {
        this.unidad = unidad;
    }

    public UndMedida getUndMedida() {
        return undMedida;
    }

    public void setUndMedida(UndMedida undMedida) {
        this.undMedida = undMedida;
    }

    public CompraDao getCompraDao() {
        return compraDao;
    }

    public void setCompraDao(CompraDao compraDao) {
        this.compraDao = compraDao;
    }

    public List<Comprobante> getListarComprobante() {
        return ListarComprobante;
    }

    public void setListarComprobante(List<Comprobante> ListarComprobante) {
        this.ListarComprobante = ListarComprobante;
    }

    public List<TipoMoneda> getListarTipoMoneda() {
        return ListarTipoMoneda;
    }

    public void setListarTipoMoneda(List<TipoMoneda> ListarTipoMoneda) {
        this.ListarTipoMoneda = ListarTipoMoneda;
    }

    public List<FormaPago> getListarFormaPago() {
        return ListarFormaPago;
    }

    public void setListarFormaPago(List<FormaPago> ListarFormaPago) {
        this.ListarFormaPago = ListarFormaPago;
    }

    public List<Categoria> getListarCatwgoria() {
        return ListarCatwgoria;
    }

    public void setListarCatwgoria(List<Categoria> ListarCatwgoria) {
        this.ListarCatwgoria = ListarCatwgoria;
    }

    public List<Ubicacion> getListarUbicacion() {
        return ListarUbicacion;
    }

    public void setListarUbicacion(List<Ubicacion> ListarUbicacion) {
        this.ListarUbicacion = ListarUbicacion;
    }

    public List<Unidad> getListarUnidad() {
        return ListarUnidad;
    }

    public void setListarUnidad(List<Unidad> ListarUnidad) {
        this.ListarUnidad = ListarUnidad;
    }

    public List<UndMedida> getListarUndMedida() {
        return ListarUndMedida;
    }

    public void setListarUndMedida(List<UndMedida> ListarUndMedida) {
        this.ListarUndMedida = ListarUndMedida;
    }

    public String getSms() {
        return sms;
    }

    public void setSms(String sms) {
        this.sms = sms;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getWindow() {
        return window;
    }

    public void setWindow(String window) {
        this.window = window;
    }
    
    //Metodos...
    
    
    
    
}
