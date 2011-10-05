<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="css/default.css" media="screen" rel="stylesheet" type="text/css">
        <script type="application/x-javascript" src="./script/jquery-1.5.1.js"></script>
        <script type="application/x-javascript" src="./script/menu.js"></script>
        <title>Proyecto DAWA</title>
        <script type="application/x-javascript">
            $(document).ready(function(){
                    var a = "${mensaje}";
                    if(a.length > 0) alert("${mensaje}");
            });
        </script>
    </head>
    <body>
		<%@ include file="partes/menuTienda.jsp"%>
        <div id="info" class="seccion borde divA cuerpo">
             <p>Para crear una cuenta de usuario tienes que registrarte y esperar a que el administrador te dé de alta en el sistema.</p>
             <p>En un inicio, tendrás una cuenta básica, sin ninguna ventaja, pero cuando acumules más de 100 euors en compras, tú cuenta pasará a ser VIP, y tendrá un descuento del 20% en todas tus compras.</p>
        </div>
    </body>
</html>
