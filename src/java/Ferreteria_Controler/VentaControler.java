
package Ferreteria_Controler;


import Ferreteria_Entidad.Entidad.Comprobante;
import Ferreteria_Entidad.Entidad.FormaPago;
import Ferreteria_Entidad.Entidad.Rep_ventas;
import Ferreteria_Entidad.Entidad.TipoMoneda;
import Ferreteria_Entidad.Entidad.Venta;
import Ferreteria_Entidad.Entidad.VentaDetalle;
import Ferreteria_Negocio.General.VentaDao;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;

public class VentaControler implements ModelDriven<Venta>{
    FormaPago FormaPago=new FormaPago();
    Comprobante Comprobante=new Comprobante();
    TipoMoneda TipoMoneda=new TipoMoneda();
    Venta Venta=new Venta();
    VentaDetalle VentaDetalle=new VentaDetalle();
    Rep_ventas Rep_ventas=new Rep_ventas();
    VentaDao VentaDao;
    List<FormaPago> ListarFormapago=new ArrayList<FormaPago>();
    List<Comprobante> ListarCompVenta=new ArrayList<Comprobante>();
    List<TipoMoneda> ListarMoneda=new ArrayList<TipoMoneda>();
    List<Rep_ventas> ListarVentas=new ArrayList<Rep_ventas>();
    String sms = "", result = "", window="";
    public VentaControler() {
        VentaDao =new VentaDao();
    }

    public FormaPago getFormaPago() {
        return FormaPago;
    }

    public void setFormaPago(FormaPago FormaPago) {
        this.FormaPago = FormaPago;
    }

    public Comprobante getComprobante() {
        return Comprobante;
    }

    public void setComprobante(Comprobante Comprobante) {
        this.Comprobante = Comprobante;
    }

    public TipoMoneda getTipoMoneda() {
        return TipoMoneda;
    }

    public void setTipoMoneda(TipoMoneda TipoMoneda) {
        this.TipoMoneda = TipoMoneda;
    }

    public Venta getVenta() {
        return Venta;
    }

    public void setVenta(Venta Venta) {
        this.Venta = Venta;
    }

    public VentaDetalle getVentaDetalle() {
        return VentaDetalle;
    }

    public void setVentaDetalle(VentaDetalle VentaDetalle) {
        this.VentaDetalle = VentaDetalle;
    }

    public Rep_ventas getRep_ventas() {
        return Rep_ventas;
    }

    public void setRep_ventas(Rep_ventas Rep_ventas) {
        this.Rep_ventas = Rep_ventas;
    }

    public List<FormaPago> getListarFormapago() {
        return ListarFormapago;
    }

    public void setListarFormapago(List<FormaPago> ListarFormapago) {
        this.ListarFormapago = ListarFormapago;
    }

    public List<Comprobante> getListarCompVenta() {
        return ListarCompVenta;
    }

    public void setListarCompVenta(List<Comprobante> ListarCompVenta) {
        this.ListarCompVenta = ListarCompVenta;
    }

    public List<TipoMoneda> getListarMoneda() {
        return ListarMoneda;
    }

    public void setListarMoneda(List<TipoMoneda> ListarMoneda) {
        this.ListarMoneda = ListarMoneda;
    }

    public List<Rep_ventas> getListarVentas() {
        return ListarVentas;
    }

    public void setListarVentas(List<Rep_ventas> ListarVentas) {
        this.ListarVentas = ListarVentas;
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
    //metodos 
    public Venta getModel() {
    return Venta;
    }
    public String RegistrarVenta(){
    if(VentaDao.RegistrarVenta(Venta)){
      result = " * Los datos fueron registrados.";
    }else{
      result="No se registro";
    }
    return "exit";
}
    
    public String UpdateVenta(){
    if(VentaDao.UpdateVenta(Venta)){
      result = " * Los datos fueron actualizados.";
    }else{
      result="No se actualizo";
    }
    return "exit";
}
}
