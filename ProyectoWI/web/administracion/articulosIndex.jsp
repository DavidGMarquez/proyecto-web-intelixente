<%-- 
    Document   : listUsuarios.jsp
    Created on : 26-mar-2011, 13:06:10
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
        <script type="application/x-javascript" src="../script/administracion/articulos.js"></script>
        <title>Administracion de articulos</title>
    </head>
    <body onload="recuperaArticulos(<c:out value='${pagina}'/>)">
        <div id="titulo">Administración: Artículos</div>
        <%@ include file="menu.jsp"%>
        <div id="comentario"><span><c:out value="${comentario}"/></span></div>
        <div id="lista">Cargando...</div>
    </body>
</html>
