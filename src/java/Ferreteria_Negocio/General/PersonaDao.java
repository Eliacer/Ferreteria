
package Ferreteria_Negocio.General;



import Ferreteria_Entidad.Entidad.CatCliente;
import Ferreteria_Entidad.Entidad.Cliente;
import Ferreteria_Entidad.Entidad.Persona;
import Ferreteria_Entidad.Entidad.Proveedor;
import Ferreteria_Entidad.Entidad.Usuario;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Eliacer Fernandez
 */
public class PersonaDao{
    
    public boolean InsertarPersona(Persona persona) {
        
        Conexion conn = Configuracion.Datos();
        String query = "insert into persona "
                    + " (nombres, "
                    + " apellidos, "
                    + " razon_social, "
                    + " genero, "
                    + " fecha_nac, "
                    + " telefono, "
                    + " celular, "
                    + " id_tipo_doc, "
                    + " numero_doc, "
                    + " ruc, "
                    + " direccion) "
                    + " values('"+ persona.getNombres()+"',"
                    + " '"+ persona.getApellidos()          +"',"
                    + " '"+ persona.getRazon_social()       +"',"
                    + " '"+ persona.getGenero()             +"',"
                    + " to_date('"+ persona.getFecha_nac()+"','yyyy-mm-dd'),"
                    + " '"+ persona.getTelefono()           +"',"
                    + " '"+ persona.getCelular()            +"',"
                    + " '"+ persona.getId_tipo_doc()        +"',"
                    + " '"+ persona.getNumero_doc()         +"',"
                    + " '"+ persona.getRuc()                +"',"
                    + " '"+ persona.getDireccion()          +"')";
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

    public List<Persona> ListarPersona() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "SELECT id_persona as id,nombres||' '||apellidos ||' '||razon_social as nombres, numero_doc as doc, "
                   + "to_char(fecha_nac,'dd/mm/yyyy') as fecha, "
                   + "telefono||' / '||celular as tel, direccion, estado FROM persona order by fecha_nac desc";
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setId_persona(conn.getCol("id"));
                persona.setNombres(conn.getCol("nombres"));
                persona.setFecha_nac(conn.getCol("fecha"));
                persona.setTelefono(conn.getCol("tel"));
                persona.setNumero_doc(conn.getCol("doc"));
                persona.setDireccion(conn.getCol("direccion"));
                persona.setEstado(conn.getCol("estado"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public boolean UpdatePersona(Persona persona) {
        
        Conexion conn = Configuracion.Datos();
        String query = "update persona set "
                +"  nombres=initcap('"+persona.getNombres()
                +"'),apellidos=initcap('"+persona.getApellidos()
                //+"',fecha_nac= to_date('"+persona.getFecha_nac()+"','yyyy-mm-dd')"
                +"'),razon_social=upper('"+persona.getRazon_social()
                +"'),genero='"+persona.getGenero()
                +"',telefono='"+persona.getTelefono()
                +"',celular='"+persona.getCelular()
                +"',id_tipo_doc='"+persona.getId_tipo_doc()
                +"',numero_doc='"+persona.getNumero_doc()
                +"',ruc='"+persona.getRuc()
                +"',direccion=initcap('"+persona.getDireccion()
                +"'),estado='"+persona.getEstado()
                +"' where id_persona='"+persona.getId_persona()+"'";
       
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

    public boolean DeletePersona(Persona persona) {
        
        Conexion conn = Configuracion.Datos();
        String query="delete from persona where id_persona='"+persona.getId_persona()+"'";  
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
    
    public List<Persona> ObtenerPersona (String nombre,String dni){
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_persona, nombres||' '||apellidos as nombre,numero_doc, fecha_nac, "
                        + "telefono||' '||celular as telcel, direccion "
                        + "from persona where upper(nombre_razon)=upper('"+nombre+"') or "
                        + "numero_doc='"+dni+"' "
                        + "rownum <=1";
        Persona per = null;
        List<Persona> lista = new ArrayList<Persona>();
            conn.execQuery(sql);
            while (conn.getNext()) {
                per= new Persona();
                per.setId_persona(conn.getCol("id_persona"));
                per.setNombres(conn.getCol("nombre"));
                per.setNumero_doc(conn.getCol("numero_doc"));
                per.setFecha_nac(conn.getCol("fecha_nac"));
                per.setTelefono(conn.getCol("telcel"));
                per.setDireccion(conn.getCol("direccion"));             
                lista.add(per);
            }
        conn.Close(1, 1, 1); 
        return lista;
    }

    public List<Persona> ListarProveedor(String proveedor) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select pr.id_proveedor as id,p.razon_social||' ( '||p.ruc||' )' as nombre "
                    + "from persona p, proveedor pr "
                    + "where p.id_persona=pr.id_proveedor and "
                    + "upper(p.razon_social) like upper('%"+proveedor+"%') order by nombre asc";
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql); 
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setId_persona(conn.getCol("id"));
                persona.setRazon_social(conn.getCol("nombre"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1); 
        return lista;
    
    }

    public Persona ObtenerPersonaDni(String dni) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from persona where numero_doc='"+dni+"'";
        Persona per = null;
        conn.execQuery(sql);
            conn.getNext();
            per= new Persona();
            per.setId_persona(conn.getCol("id_persona"));
            per.setNombres(conn.getCol("nombres"));
            per.setRazon_social(conn.getCol("razon_social"));
            per.setApellidos(conn.getCol("apellidos"));         
            per.setFecha_nac(conn.getCol("fecha_nac"));
            per.setGenero(conn.getCol("genero"));
            per.setTelefono(conn.getCol("telefono"));
            per.setCelular(conn.getCol("celular"));
            per.setId_tipo_doc(conn.getCol("id_tipo_doc"));
            per.setNumero_doc(conn.getCol("numero_doc"));
            per.setRuc(conn.getCol("ruc"));
            per.setEstado(conn.getCol("estado"));
            per.setDireccion(conn.getCol("direccion")); 
                
        conn.Close(1, 1, 1); 
        return per;
    }
    
    public Persona ObtenerPersonaRuc(String ruc) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from persona where ruc='"+ruc+"'";
        Persona per = null;
            conn.execQuery(sql);
            conn.getNext();
            per= new Persona();
            per.setId_persona(conn.getCol("id_persona"));
            per.setNombres(conn.getCol("nombres"));
            per.setRazon_social(conn.getCol("razon_social"));
            per.setApellidos(conn.getCol("apellidos"));         
            per.setFecha_nac(conn.getCol("fecha_nac"));
            per.setGenero(conn.getCol("genero"));
            per.setTelefono(conn.getCol("telefono"));
            per.setCelular(conn.getCol("celular"));
            per.setId_tipo_doc(conn.getCol("id_tipo_doc"));
            per.setNumero_doc(conn.getCol("numero_doc"));
            per.setRuc(conn.getCol("ruc"));
            per.setEstado(conn.getCol("estado"));
            per.setDireccion(conn.getCol("direccion")); 

        conn.Close(1, 1, 1); 
        return per;
    }

    public boolean RegistrarProveedor(Proveedor proveedor) {
        
        Conexion conn = Configuracion.Datos();
        String query = "insert into proveedor "
                    + " (id_proveedor, "
                    + " correo_electronico, "
                    + " num_cuenta) "
                    + " values('"+ proveedor.getId_proveedor()+"',"
                    + " '"+ proveedor.getCorreo_electronico() +"',"
                    + " '"+ proveedor.getNum_cuenta()         +"')";
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

    public boolean RegistrarUsuario(Usuario usuario) {
        
        Conexion conn = Configuracion.Datos();
        String query = "insert into usuario "
                    + " (id_usuario, "
                    + " login, "
                    + " password, "
                    + " id_rol) "
                    + " values('"+ usuario.getIdUsuario()+"',"
                    + " '"+ usuario.getLogin()           +"',"
                    + " '"+ usuario.getPassword()        +"',"
                    + " '"+ usuario.getIdRol()           +"')";
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

    public Persona ObtenerPersonaId(Persona persona) {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from persona where id_persona='"+persona.getId_persona()+"'";
        Persona per = null;
            
            conn.execQuery(sql);
            conn.getCol(sql);
            per= new Persona();
            per.setId_persona(conn.getCol("id_persona"));
            per.setNombres(conn.getCol("nombres"));
            per.setRazon_social(conn.getCol("razon_social"));
            per.setApellidos(conn.getCol("apellidos"));         
            per.setFecha_nac(conn.getCol("fecha_nac"));
            per.setGenero(conn.getCol("genero"));
            per.setTelefono(conn.getCol("telefono"));
            per.setCelular(conn.getCol("celular"));
            per.setId_tipo_doc(conn.getCol("id_tipo_doc"));
            per.setNumero_doc(conn.getCol("numero_doc"));
            per.setRuc(conn.getCol("ruc"));
            per.setEstado(conn.getCol("estado"));
            per.setDireccion(conn.getCol("direccion")); 
        conn.Close(1, 1, 1); 
        return per;
    }

    public boolean RegistrarCliente(Cliente cliente) {
        
        Conexion conn = Configuracion.Datos();
        String query = "insert into cliente "
                    + " (id_cliente, "
                    + " id_categoria) "
                    + " values('"+ cliente.getIdCliente()+"',"
                    + " '"+ cliente.getIdTipoCliente()   +"')";
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

    public List<Persona> Listarcliente(String cliente) {
       
        Conexion conn = Configuracion.Datos();
        String sql = "select cl.id_cliente as id,p.nombres||' '||p.apellidos||' '||p.razon_social ||'-'||p.numero_doc as nombre "
                    + "from persona p, cliente cl "
                    + "where p.id_persona=cl.id_cliente and "
                    + "(p.numero_doc) like ('%"+cliente+"%') order by nombre asc";
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setId_persona(conn.getCol("id"));
                persona.setRazon_social(conn.getCol("nombre"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<CatCliente> ListarCatCliente() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select id_categoria,initcap(nombre) as nombre, dcto from cat_cliente ";
        List<CatCliente> lista = new ArrayList<CatCliente>();
        CatCliente catc= null;
            conn.execQuery(sql);
            while (conn.getNext()) {                    
                catc = new CatCliente();              
                catc.setIdCategoria(conn.getCol("id_categoria"));
                catc.setNombre(conn.getCol("nombre")); 
                catc.setDescuento(Double.parseDouble(conn.getCol("dcto")));
                lista.add(catc);   
            }  
        conn.Close(1, 1, 1);
        return lista; 
    }

    public List<Persona> ListarCliente() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "SELECT p.nombres||' '||p.apellidos as nombres,p.razon_social as rz,p.numero_doc as doc, "
                   + "to_char(p.fecha_nac,'dd/mm/yyyy') as fecha, "
                   + "p.telefono||' / '||p.celular as tel, p.direccion as dir, p.estado as est "
                   + "FROM persona p,cliente c where p.id_persona=c.id_cliente order by fecha desc";
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setNombres(conn.getCol("nombres"));
                persona.setRazon_social(conn.getCol("rz"));
                persona.setFecha_nac(conn.getCol("fecha"));
                persona.setTelefono(conn.getCol("tel"));
                persona.setNumero_doc(conn.getCol("doc"));
                persona.setDireccion(conn.getCol("dir"));
                persona.setEstado(conn.getCol("est"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<Persona> ListarProveedor() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "SELECT p.razon_social as rz,p.ruc as ruc, "
                   + "pr.correo_electronico as correo,pr.num_cuenta as ncuenta, "
                   + "p.telefono||' / '||p.celular as tel, p.direccion as dir, pr.estado as est "
                   + "FROM persona p,proveedor pr where p.id_persona=pr.id_proveedor and pr.estado='1'";
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setRazon_social(conn.getCol("rz"));
                persona.setTelefono(conn.getCol("tel"));
                persona.setRuc(conn.getCol("ruc"));
                persona.setDireccion(conn.getCol("dir"));
                persona.setCorreo(conn.getCol("correo"));
                persona.setNum_cuenta(conn.getCol("ncuenta"));
                persona.setEstado(conn.getCol("est"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<Persona> ListarUsuario() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "SELECT p.nombres||' '||p.apellidos as nombres,p.numero_doc as doc, "
                   + "to_char(p.fecha_nac,'dd/mm/yyyy') as fecha,u.login as login,nombre_rol(u.id_rol) as rol, "
                   + "p.telefono||' / '||p.celular as tel, p.direccion as dir, p.estado as est "
                   + "FROM persona p,usuario u where p.id_persona=u.id_usuario order by fecha asc";
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setNombres(conn.getCol("nombres"));
                persona.setFecha_nac(conn.getCol("fecha"));
                persona.setTelefono(conn.getCol("tel"));
                persona.setNumero_doc(conn.getCol("doc"));
                persona.setDireccion(conn.getCol("dir"));
                persona.setUsuario(conn.getCol("login"));
                persona.setRol(conn.getCol("rol"));
                persona.setEstado(conn.getCol("est"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<Persona> ListarClientePotencial() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from(select nombre_cliente(c.id_cliente) as cliente, "
                   + "p.numero_doc as dni,p.celular||' '||p.telefono as contacto, "
                   + "trunc(monto_cliente(c.id_cliente),2) as monto "
                   + "from cliente c,persona p where p.id_persona=c.id_cliente "
                   + "order by monto desc) where rownum <=4 ";
        
        List<Persona> lista = new ArrayList<Persona>();
        Persona persona = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                persona = new Persona();
                persona.setNombres(conn.getCol("cliente"));
                persona.setTelefono(conn.getCol("contacto"));
                persona.setNumero_doc(conn.getCol("dni"));
                persona.setEstado(conn.getCol("monto"));
                lista.add(persona);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }

    public List<Proveedor> ListarProveedorPotencial() {
        
        Conexion conn = Configuracion.Datos();
        String sql = "select * from ( select distinct nombre_proveedor(c.id_proveedor) as proveedor,per.ruc as ruc, "
                    + "p.correo_electronico as correo,round(monto_proveedor(c.id_proveedor),2) as monto "
                    + "from compra c,proveedor p,persona per "
                    + "where p.id_proveedor=c.id_proveedor and per.id_persona=p.id_proveedor order by monto desc) "
                    + "where rownum <=4";
        
        List<Proveedor> lista = new ArrayList<Proveedor>();
        Proveedor proveedor = null;
            conn.execQuery(sql);
            while (conn.getNext()) {                
                proveedor = new Proveedor();
                proveedor.setId_proveedor(conn.getCol("proveedor"));
                proveedor.setCorreo_electronico(conn.getCol("correo"));
                proveedor.setNum_cuenta(conn.getCol("ruc"));
                proveedor.setEstado(conn.getCol("monto"));
                lista.add(proveedor);                
            }
        conn.Close(1, 1, 1);
        return lista;
    }
    
}
