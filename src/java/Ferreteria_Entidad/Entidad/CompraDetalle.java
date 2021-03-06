package Ferreteria_Entidad.Entidad;

public class CompraDetalle {

     private String id_compra="";
     private String id_producto="";
     private String producto="";
     private String id_unidad="";
     private Integer cantMayor;
     private Integer cantMenor;
     private Double costoMayor;
     private Double costoUnidad=0.0;
     private Double costototal=0.0;
     private Double valor_moneda=0.0;
     private Double importe=0.0;
     private String pf="";
     
     private Double igv;
     
     private double psugerido;
     
     private  String precio;
     private  String abrev;
     

    public CompraDetalle() {
    }

    public String getId_compra() {
        return id_compra;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }
    
    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }
    
    public Double getCostototal() {
        return costototal;
    }

    public void setCostototal(Double costototal) {
        this.costototal = costototal;
    }
    
    public void setId_compra(String id_compra) {
        this.id_compra = id_compra;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(String id_unidad) {
        this.id_unidad = id_unidad;
    }

    public Integer getCantMayor() {
        return cantMayor;
    }

    public void setCantMayor(Integer cantMayor) {
        this.cantMayor = cantMayor;
    }

    public Integer getCantMenor() {
        return cantMenor;
    }

    public void setCantMenor(Integer cantMenor) {
        this.cantMenor = cantMenor;
    }

    public Double getCostoMayor() {
        return costoMayor;
    }

    public void setCostoMayor(Double costoMayor) {
        this.costoMayor = costoMayor;
    }

    public Double getCostoUnidad() {
        return costoUnidad;
    }

    public void setCostoUnidad(Double costoUnidad) {
        this.costoUnidad = costoUnidad;
    }

    public double getPsugerido() {
        return psugerido;
    }

    public void setPsugerido(double psugerido) {
        this.psugerido = psugerido;
    }

    public Double getValor_moneda() {
        return valor_moneda;
    }

    public void setValor_moneda(Double valor_moneda) {
        this.valor_moneda = valor_moneda;
    }

    public String getPf() {
        return pf;
    }

    public void setPf(String pf) {
        this.pf = pf;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public Double getIgv() {
        return igv;
    }

    public void setIgv(Double igv) {
        this.igv = igv;
    }

    public String getAbrev() {
        return abrev;
    }

    public void setAbrev(String abrev) {
        this.abrev = abrev;
    }
    
    
}


