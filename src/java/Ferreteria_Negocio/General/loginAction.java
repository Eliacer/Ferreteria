/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Ferreteria_Negocio.General;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

public class loginAction extends ActionSupport {

    private String userId;
    private String password;

    public String abrir_sesion() 
    {
        if ("ULICES".equals(userId) && "ULICES".equals(password)) {
            Map session = ActionContext.getContext().getSession();
            session.put("logged-in", "true");
            return "fin";
        } else {
            return "atras";
        }
    }

    public boolean cerrar_sesion()
    {
        Map session = ActionContext.getContext().getSession();
        session.remove("logged-in");
        return true;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}