<%-- 
    Document   : error
    Created on : 28-mar-2011, 23:54:01
    Author     : Vanesa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/administracion/administracion.css" media="screen" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="titulo">Administración</div>
        <%@ include file="menu.jsp"%>
        <h2><c:out value="${error.titulo}"/></h2>
        <c:out value="${error.texto}"/><br/>
        <a href="${error.url}">Volver</a>
    </body>
</html>
