<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <link rel="shortcut icon" type="image/x-icon" href="imag/icon.ico">
        <link href="css/vitrina_login.css" rel="STYLESHEET"  type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/sehs.css" />
        <script type="text/javascript" language="javascript" src="js/funciones.js"></script>
        <script type="text/javascript" language="javascript" src="js/funcionajax.js"></script>
        <script type="text/javascript" language="javascript" src="js/jquery-1.2.1.pack.js"></script>

    </head>
    <body>
        <%@taglib uri="/struts-tags" prefix="s"%>  
        <table width="100%" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td colspan="3" height="130"></td>
                </tr>
                <tr>
                    <td height="5" class="head1" align="right" width="100%" colspan="3" >.</td>
                </tr>
                <tr>
                    <td class="head" width="30%"  height="100" valign="top"><b><img src="imag/logo_upeu.png" height="200"/><br></td>
                    <td class="head" width="60%">
                        <table align="center" class="alinear">
                            <tr>
                                <td colspan="2" align="center"><b><em>Sistema de Ferretería</em></b></td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <img src="imag/manzana.png" height="80"/>
                                </td>
                                <td>
                                    <s:form name="form" action="Logeo" method="get" >
                                        <s:textfield name="Usuario.login" maxLength="25" label="Usuario" size="20"/>
                                        <s:password name="Usuario.password" maxLength="25" label="Clave" size="20"/>
                                        <s:submit name="ingresar" value="Ingresar" align="center" title="Ingresar"/>
                                    </s:form>
                                    <div class="error_login"><s:property value="sms"/></div>
                                </td>
                                
                            </tr>
                        </table>
                    </td>
                    <td class="head" width="20%">
                        
                </tr>
            </tbody>
        </table>
        <table width="100%" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td height="5" class="head1" align="right" width="100%">.</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>