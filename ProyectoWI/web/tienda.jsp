<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Proyecto DAWA</title>
        <link href="css/default.css" media="screen" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="./script/jquery-1.5.1.js"></script>
        <script type="text/javascript" src="./script/menu.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	var a = "${mensaje}";
            	if(a.length > 0) alert("${mensaje}");
            });
        </script>
    </head>

    <body>
        <%@ include file="partes/menuTienda.jsp"%>
        <div id="lista">
            <%@ include file="partes/catalogo.jsp"%>
        </div>
        <c:if test="${param.page == 'busca'}">
        	<%@ include file="partes/busqueda.jsp" %>
        </c:if>
        <%@ include file="partes/cesta.jsp"%>
        <%@ include file="partes/recomendacion.jsp"%>
    </body>
</html>