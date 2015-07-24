<%-- 
    Document   : login
    Created on : 27-may-2013, 11:03:00
    Author     : Percy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/sehs.css" rel="STYLESHEET"  type="text/css"/>
        <script type="text/javascript" src="js/reloj/clock24.js"></script>
        <script type="text/javascript">
            var clock24_63553 = new clock24('63553',-300,'%dd/%mm/%yyyy %W %HH:%nn:%ss %P','es');
            clock24_63553.daylight('PE'); clock24_63553.refresh();
        </script>
        <title>Ingrese Usuario</title>
    </head>
    <body onload="document.form.SGusuario.usuario.focus();" background="imag/fondologin.jpg">
        <%@taglib uri="/struts-tags" prefix="s"%>
        <br><br><br>
        <s:include id="Login.jsp" value="Login.jsp"></s:include>
    <center><span id="clock24_63553"></span></center>
    <s:if test="%{window=='ver'}">
        <script LANGUAGE="JavaScript">
            alert("<s:property value="result"/>")
        </script>
    </s:if>
</body>
</html>
