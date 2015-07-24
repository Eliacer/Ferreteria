/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Controler;

import Ferreteria_Entidad.Entidad.Producto;
import Ferreteria_Negocio.General.ProductoDao;

/**
 *
 * @author Eliacer Fernandez
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        NewMain main = new NewMain();
        main.listarProducto();
    }
    
    
    public void listarProducto (){
        
        Producto productoq = new Producto();
        ProductoDao dao = new ProductoDao();
        
        for (Producto producto : dao.ReporteProductos(productoq)) {
            System.out.println("id_produto"+producto.getId_producto());
        }
    }
    
}
