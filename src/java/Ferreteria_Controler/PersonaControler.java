/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Controler;


import Ferreteria_Entidad.Entidad.CatCliente;
import Ferreteria_Entidad.Entidad.Persona;
import Ferreteria_Entidad.Entidad.TipoDocumento;
import Ferreteria_Entidad.Entidad.Usuario;
import Ferreteria_Negocio.General.PersonaDao;
import Ferreteria_Negocio.General.UsuarioDao;
import Ferreteria_Negocio.General.UtilitariosDao;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eliacer Fernandez
 */
public class PersonaControler implements ModelDriven<Persona>{
    
    Persona persona = new Persona();
    CatCliente catCliente = new CatCliente();
    Usuario usuario = new Usuario();
    TipoDocumento tipoDocumento = new TipoDocumento();
    PersonaDao personaDao;
    UsuarioDao usuarioDao;
    UtilitariosDao utilitariosDao;
    List<Persona> ReportePersonas = new ArrayList<Persona>();
    List<Persona> ReporteUsuarios = new ArrayList<Persona>();
    List<CatCliente> ReporteCatClientes = new ArrayList<CatCliente>();
    List<TipoDocumento> ReporteTipoDocumento = new ArrayList<TipoDocumento>();
    String sms = "", result = "", window="";

    @Override
    public Persona getModel() {
        return persona;
    }
    
    public PersonaControler() {
        personaDao = new PersonaDao();
        usuarioDao = new UsuarioDao();
        utilitariosDao = new UtilitariosDao();
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

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public UsuarioDao getUsuarioDao() {
        return usuarioDao;
    }

    public void setUsuarioDao(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public List<Persona> getReportePersonas() {
        return ReportePersonas;
    }

    public void setReportePersonas(List<Persona> ReportePersonas) {
        this.ReportePersonas = ReportePersonas;
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

    public List<TipoDocumento> getReporteTipoDocumento() {
        return ReporteTipoDocumento;
    }

    public void setReporteTipoDocumento(List<TipoDocumento> ReporteTipoDocumento) {
        this.ReporteTipoDocumento = ReporteTipoDocumento;
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
    
    public String Reporte() {
        sms = "ver";
        ReportePersonas = personaDao.ReportePersona(persona);
        return "fin";
    }
    public String ReporteUsuarios() {
        sms = "ver";
        ReporteUsuarios = personaDao.ListarUsuario();
        return "fin";
    }

    public String NuevaPersona() {
        sms = "nueva";
        ReporteTipoDocumento = utilitariosDao.ReporteTipoDocumento();
        return "fin";
    }

    public String EditarPersona() {
        sms = "editar";
        ReporteTipoDocumento = utilitariosDao.ReporteTipoDocumento();
        persona = personaDao.ObtenerPersonaId(persona);
        return "fin";
    }

    public String RegistrarPersona() {
        sms = "ver";
        if (personaDao.RegistrarPersona(persona)) {
            result = " * Los datos fueron registrados.";
        } else {
            window = "ver";
            result = "**** Error al registrar la persona, porque hay datos que coinciden: Dni o Ruc";
        }
        ReportePersonas = personaDao.ReportePersona(persona);
        return "fin";
    }

    public String ActualizarPersona() {
        sms = "ver";
        if (personaDao.UpdatePersona(persona)) {
            window = "ver";
            result = " * Los datos fueron actualizados.";
        } else {
            window = "ver";
            result = "**** Error al actualizar la persona, porque faltaron datos obligatorios o hay datos que coinciden: Dni o Ruc";
        }
        ReportePersonas = personaDao.ReportePersona(persona);
        return "fin";
    }

    public String EliminarPersona() {
        sms = "ver";
        if (personaDao.DeletePersona(persona)) {
            result = "La persona fue eliminada.";
        } else {
            window = "ver";
            result = "**** Error: No se puede eliminar esta persona, porque es cliente o usuario del sistema.";
        }
        ReportePersonas = personaDao.ReportePersona(persona);
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
