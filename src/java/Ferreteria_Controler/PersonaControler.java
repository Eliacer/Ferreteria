/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Controler;


import Ferreteria_Entidad.Entidad.CatCliente;
import Ferreteria_Entidad.Entidad.Persona;
import Ferreteria_Entidad.Entidad.Usuario;
import Ferreteria_Negocio.General.PersonaDao;
import Ferreteria_Negocio.General.UsuarioDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class PersonaControler {
    
    Persona persona = new Persona();
    CatCliente catCliente = new CatCliente();
    Usuario usuario = new Usuario();
    PersonaDao personaDao;
    UsuarioDao usuarioDao;
    List<Persona> ReportePersonas = new ArrayList<Persona>();
    List<Persona> ReporteUsuarios = new ArrayList<Persona>();
    List<CatCliente> ReporteCatClientes = new ArrayList<CatCliente>();
    String sms = "", result = "", window="";

    public PersonaControler() {
        personaDao = new PersonaDao();
        usuarioDao = new UsuarioDao();
    }  
    
    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public CatCliente getCatCliente() {
        return catCliente;
    }

    public void setCatCliente(CatCliente catCliente) {
        this.catCliente = catCliente;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public PersonaDao getPersonaDao() {
        return personaDao;
    }

    public void setPersonaDao(PersonaDao personaDao) {
        this.personaDao = personaDao;
    }

    public UsuarioDao getUsuarioDao() {
        return usuarioDao;
    }

    public void setUsuarioDao(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public List<Persona> getReporteUsuarios() {
        return ReporteUsuarios;
    }

    public void setReporteUsuarios(List<Persona> ReporteUsuarios) {
        this.ReporteUsuarios = ReporteUsuarios;
    }

    public List<CatCliente> getReporteCatClientes() {
        return ReporteCatClientes;
    }

    public void setReporteCatClientes(List<CatCliente> ReporteCatClientes) {
        this.ReporteCatClientes = ReporteCatClientes;
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
    
    //Metodos
    
    public String ReportePersonas() {
        sms = "ver";
        ReportePersonas = personaDao.ListarPersona();
        return "fin";
    }
    public String ReporteUsuarios() {
        sms = "ver";
        ReporteUsuarios = personaDao.ListarUsuario();
        return "fin";
    }

    public String nuevaPersona() {
        sms = "nueva";
        
        return "fin";
    }

    public String editarPersona() {
        sms = "editar";
        persona = personaDao.ObtenerPersonaId(persona);
        return "fin";
    }

    public String registrarPersona() {
        sms = "ver";
        if (personaDao.InsertarPersona(persona)) {
            result = " * Los datos fueron registrados.";
        } else {
            window = "ver";
            result = "**** Error al registrar la persona, porque hay datos que coinciden: Dni o Ruc";
        }
        ReportePersonas = personaDao.ListarPersona();
        return "fin";
    }

    public String actualizarPersona() {
        sms = "ver";
        if (personaDao.UpdatePersona(persona)) {
            result = " * Los datos fueron actualizados.";
        } else {
            window = "ver";
            result = "**** Error al actualizar la persona, porque faltaron datos obligatorios o hay datos que coinciden: Dni o Ruc";
        }
        ReportePersonas = personaDao.ListarPersona();
        return "fin";
    }

    public String eliminarPersona() {
        sms = "ver";
        if (personaDao.DeletePersona(persona)) {
            result = "La persona fue eliminada.";
        } else {
            window = "ver";
            result = "**** Error: No se puede eliminar esta persona, porque es cliente o usuario del sistema.";
        }
        ReportePersonas = personaDao.ListarPersona();
        return "fin";
    }

    public String Logeo() {
        if (usuarioDao.logeo(usuario)) {
            return "menu";
            
        } else {
            sms="Sus credenciales son incorrectos";
            return "login";
        }
    }
    public String Comprobar_sesion() {
        if (usuarioDao.comprobar_sesion(usuario)) {
            return "fin";
            
        } else {
            window="ver";
            result="* Su sesion ha sido cerrada, inicie nuevamente.";
            return "malfin";
            
        }
    }
    public String CerrarSesion() {
       usuarioDao.CerrarSesion();
       return "fin";
     }
    
}
