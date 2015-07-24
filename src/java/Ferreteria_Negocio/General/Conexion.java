package Ferreteria_Negocio.General;
import java.io.File;
import java.sql.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Conexion {

    private static Connection cn = null;
    private static Statement st = null;
    private static ResultSet rs = null;
    private static String MError = new String();
    private static CallableStatement cst = null;

    public Conexion(String gestorBD, String host, String puerto, String usuario,String nombreBD,  String clave) {
        try {
            mConection(gestorBD,host,puerto, usuario, nombreBD, clave);
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }
    public Conexion() {
        try {
            mConection("Oracle","localhost","1521", "orcl", "ferreteria", "eliacer");
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }
    //-----------------------------------------------------------------------------------------

    public Conexion(String id) {
        try {

            File fXmlFile = new File("quiroz.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(fXmlFile);

            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("conexion");

            for (int temp = 0; temp < nList.getLength(); temp++) {

                Node nNode = nList.item(temp);

                System.out.println("\nCurrent Element :" + nNode.getNodeName());

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;
                    String idconex = eElement.getAttribute("id");
                    if (idconex.equals(id)) {
                        String gestorBD = eElement.getElementsByTagName("gestorBD").item(0).getTextContent();
                        String host = eElement.getElementsByTagName("host").item(0).getTextContent();
                        String puerto = eElement.getElementsByTagName("puerto").item(0).getTextContent();
                        String usuario = eElement.getElementsByTagName("usuario").item(0).getTextContent();
                        String nombreBD = eElement.getElementsByTagName("nombreBD").item(0).getTextContent();
                        String clave = eElement.getElementsByTagName("clave").item(0).getTextContent();
                        System.out.println(gestorBD + "  /   " + nombreBD + "/" + usuario);
                        try {
                            mConection(gestorBD, host, puerto, usuario, nombreBD, clave);
                        } catch (Exception e) {
                            MError = e.getMessage();
                        }
                        // Conexion cx=new Conexion("Oracle",  "sistema","orcl", "sistema");
                        temp = nList.getLength() + 1;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    ///----------------------------------------------------------------------------------------
    private void mConection(String gestorBD, String host, String puerto, String usuario, String nombreBD, String clave) {

        try {
            if (gestorBD.equals("Mysql"))//compara el tipo de de bd
            {
                Class.forName("com.mysql.jdbc.Driver");
                cn = DriverManager.getConnection("jdbc:mysql://"+host+":"+puerto+"/" + nombreBD + "", usuario, clave);
                System.out.println("Coneccion Exitosa a MySQL");
            } else if (gestorBD.equals("Oracle")) {
                Class.forName("oracle.jdbc.driver.OracleDriver");//permite la conexion
                cn = DriverManager.getConnection("jdbc:oracle:thin:@"+host+":"+puerto+":"+usuario+"", nombreBD, clave);
                System.out.println("Coneccion Exitosa a Oracle  ");
            } else if (gestorBD.equals("Postgresql")) {
                Class.forName("org.postgresql.Driver");
                cn = DriverManager.getConnection("“jdbc:postgresql://"+host+"/"+nombreBD+ "/", usuario, clave);
                MError = "Exito conectando a postgresql";
            }
            cn.setAutoCommit(false);
            st = cn.createStatement();
            MError = "";
        } catch (Exception e) {
            MError = e.getMessage();
        }

    }

    public void Close(int pcn, int pst, int prs)//es para cerrar la conexion
    {
        try {
            if (prs == 1) {
                rs.close();
            }
            if (pst == 1) {
                st.close();
            }
            if (pcn == 1) {
                cn.close();
            }

        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public int execCommand(String com)//conexion por cada objeto de la base de datos
    {
        int result = 0;
        try {
            result = st.executeUpdate(com);//actualiza inserta y elimina los datos
            MError = "";
        } catch (Exception e) {
            MError = e.getMessage();
            System.out.println("Error al insertar/Actualizar" + com);

        }
        return result;
    }
    public  int execC(String com) throws SQLException//conexion por cada objeto de la base de datos
    {
        int rss = st.executeUpdate(com);//actualiza inserta y elimina los datos
      return rss;
    }

    public void execQuery(String com) {
        try {
            rs = st.executeQuery(com);//ejecuta la consulta
            System.out.println(com);
            MError = "";
        } catch (Exception e) {
            MError = e.getMessage();

            System.out.println("no se puedo hacer select " + MError);

        }


    }

    public boolean getNext() {
        boolean valor = false;
        try {
            if (rs.next()) {
                valor = true;
            } else {
                valor = false;
            }
            MError = "";
        } catch (Exception e) {
            MError = e.getMessage();
        }
        return valor;
    }

    public String getCol(String ncol) {
        String valor = new String();
        try {
            valor = rs.getString(ncol);
            if (valor == null) {
                valor = "";
            }
            MError = "";
        } catch (Exception e) {
            MError = e.getMessage();
        }
        return valor;
    }

    public void Commit()//guarda
    {
        try {
            cn.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            RollBack();
        }
    }

    public void RollBack()//desase la memoria temporal
    {
        try {
            cn.rollback();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public String getValorOne(String com) {
        String valor = new String();
        try {
            System.out.println(com);
            rs = st.executeQuery(com);
            rs.next();
            valor = rs.getString(1);
            if (valor == null) {
                valor = "";
            }
            MError = "";
        } catch (Exception e) {
            MError = e.getMessage();
        }
        return valor;
    }

    public String getMError() {
        return MError;
    }
    ///PARA EJECUTAR PROCEDIMIENTOS

    public void procPreparar(String procNombre) {
        // int numParam = paramNom.length;
        try {
            cst = cn.prepareCall("{call " + procNombre + " }");

        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public void procAsignaParam(int nomParam, String valParam) {
        try {
            cst.setString(nomParam, valParam);
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public void procAsignaParam(String nomParam, int valParam) {
        try {
            cst.setInt(nomParam, valParam);
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public void procEjecutar() {
        try {
            cst.execute();
            cn.commit();
            cn.close();
            cst.close();
        } catch (Exception e) {
            try {
                MError = e.getMessage();
                cn.rollback();
                cst.close();
                cn.close();
            } catch (Exception ex) {
                MError += ex.getMessage();
            }
        }


    }
}
