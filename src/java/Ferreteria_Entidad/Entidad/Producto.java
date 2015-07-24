package Ferreteria_Entidad.Entidad;

public class Producto {

     private int nro;
     private String id_producto="";
     private String codigo;
     private String nombre="";
     private String id_unidad_medida="";
     private Double porc_ganacia;
     private Double precio=0.0;
     private int stock_actual;
     private int stock_min;
     private String fecha_reg="";
     private String id_categoria="";
     private String id_marca="";
     private String id_ubicacion="";
     private String descripcion;
     

    public Producto() {
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getId_unidad_medida() {
        return id_unidad_medida;
    }

    public void setId_unidad_medida(String id_unidad_medida) {
        this.id_unidad_medida = id_unidad_medida;
    }

    public Double getPorc_ganacia() {
        return porc_ganacia;
    }

    public void setPorc_ganacia(Double porc_ganacia) {
        this.porc_ganacia = porc_ganacia;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getStock_actual() {
        return stock_actual;
    }

    public void setStock_actual(int stock_actual) {
        this.stock_actual = stock_actual;
    }

    public int getStock_min() {
        return stock_min;
    }

    public void setStock_min(int stock_min) {
        this.stock_min = stock_min;
    }

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

    public String getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(String id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getId_marca() {
        return id_marca;
    }

    public void setId_marca(String id_marca) {
        this.id_marca = id_marca;
    }

    public String getId_ubicacion() {
        return id_ubicacion;
    }

    public void setId_ubicacion(String id_ubicacion) {
        this.id_ubicacion = id_ubicacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getNro() {
        return nro;
    }

    public void setNro(int nro) {
        this.nro = nro;
    }

    
}


