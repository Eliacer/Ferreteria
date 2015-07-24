package Ferreteria_Entidad.Entidad;

public class Comprobante  implements java.io.Serializable {


     private String idComprobante;
     private String nombreComprobante;
     

    public Comprobante() {
    }

    public String getIdComprobante() {
        return this.idComprobante;
    }
    
    public void setIdComprobante(String idComprobante) {
        this.idComprobante = idComprobante;
    }
    public String getNombreComprobante() {
        return this.nombreComprobante;
    }
    
    public void setNombreComprobante(String nombreComprobante) {
        this.nombreComprobante = nombreComprobante;
    }
    
}


