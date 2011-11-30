<%-- 
    Document   : valoracionesIndex
    Created on : 29-nov-2011, 19:02:43
    Author     : nessa
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/administracion/administracion.css" media="screen" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../script/jquery-1.6.2.min.js"></script>
        <script type="application/x-javascript" src="../script/administracion/valoraciones.js"></script>
        <title>Administración | Valoraciones</title>
    </head>
    <body onload="recuperaValoraciones(<c:out value='${pagina}'/>)">
        <div id="titulo">Administración: Valoraciones</div>
        <%@ include file="menu.jsp"%>
        <div id="comentario"><span><c:out value="${comentario}"/></span></div>
        <form class="filtros">
            <label for="idUsuario">Filtrar por usuario: </label>
            <select id="selectUsuarios" name="idUsuario">
                <option value="">No filtrar</option>
                <c:forEach var="usu" items="${listaSimpleUsuarios}">
                    <option value="${usu.idUsuario}">${usu.nombre}</option>
                </c:forEach>
            </select>
            <label for="idPelicula">Filtrar por película: </label>
            <select id="selectPeliculas" name="idPelicula">
                <option value="">No filtrar</option>
                <c:forEach var="peli" items="${listaSimplePeliculas}">
                    <option value="${peli.idPelicula}">${peli.titulo}</option>
                </c:forEach>
            </select>	
            <p>
                <input type="button" onclick="reset();" value="Reset" />
                <input type="button" onclick="recuperaValoraciones(1)" value="Filtrar" />
            </p>
        </form>
        
        <div id="lista">Cargando...</div>
    </body>
</html>
