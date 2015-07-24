<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <link rel="shortcut icon" type="image/x-icon" href="imag/icon.ico">
        <link href="css/vitrina.css" rel="STYLESHEET"  type="text/css"/>
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
                    <td width="6%" class="head" align="center">
                        <img src="imag/logo_upeu.png" height="40"/>
                    </td>
                    <td  width="12%" class="head" align="left">
                        <b>SISTEMA DE CAFETÍN</b><br>
                        <em>Universidad Peruana Unión</em>
                    </td>
                    <td width="82%" align="right" class="head">
                        Jr. Los Mártires 218 - Santa Lucía, Morales.<br>
                        <s:property value="%{#session.usuario}"></s:property>
                        
                    </td>
                </tr>
                <tr>
                    <td class="head1" height="4" colspan="3">.</td>
                </tr>
            </tbody>
        </table>

    </body>
</html>