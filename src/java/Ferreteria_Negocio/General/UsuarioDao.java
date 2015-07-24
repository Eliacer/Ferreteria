/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;
import Ferreteria_Entidad.Entidad.Usuario;
import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 *
 * @author Eliacer Fernandez
 */
public class UsuarioDao{
    
    public boolean logeo(Usuario usuario) {
        Conexion cx = Configuracion.Datos();
        String COMANDO = "select count(*) valor, "
                + "  id_usuario, login, password "
                + "  from usuario where  "
                + " upper(login) = upper('" + usuario.getLogin() + "') AND ESTADO='1' "
                + " and upper(password) = upper('" + usuario.getPassword() + "') "
                + "  group by id_usuario, login, password";
        System.out.print(COMANDO);
        cx.execQuery(COMANDO);
        cx.getNext();
        if (cx.getCol("valor").equals("1")) {
            Map session = ActionContext.getContext().getSession();
            session.put("usuario", "Usuario: " + cx.getCol("usuario"));
            session.put("id_usuario", cx.getCol("id_usuario"));
            cx.Close(1, 1, 1);
            return true;
        } else {
            cx.Close(1, 1, 1);
            return false;
        }

    }

    public boolean comprobar_sesion(Usuario usuario) {
        Conexion cx = Configuracion.Datos();
        String COMANDO = "select count(*) valor "
                + "  from usuario where id_usuario='" + usuario.getIdUsuario() + "'";
        System.out.print(COMANDO);
        cx.execQuery(COMANDO);
        cx.getNext();
        if (cx.getCol("valor").equals("1")) {
            cx.Close(1, 1, 1);
            return true;
        } else {
            cx.Close(1, 1, 1);
            return false;
        }

    }

    public void CerrarSesion() {
        Map session = ActionContext.getContext().getSession();
        session.put("usuario", "Sesión Cerrada");
        session.put("id_usuario", "");
    }

    public List<Usuario> ReporteUsuarios() {
        Conexion cx = Configuracion.Datos();
        List<Usuario> lista = new ArrayList<Usuario>();
        String COMANDO = "select id_usuario, login, id_usuario, decode(estado,'1','Activo','Desactivo') estado from USUARIO";
        cx.execQuery(COMANDO);
        while (cx.getNext()) {
            Usuario us = new Usuario();
            us.setIdUsuario(cx.getCol("id_usuario"));
            us.setLogin(cx.getCol("usuario"));
            us.setPassword(cx.getCol("clave"));
            us.setEstado(cx.getCol("estado"));
            lista.add(us);
        }
        cx.Close(1, 1, 1);
        return lista;
    }
    }
    
    

