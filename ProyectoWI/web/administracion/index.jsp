<%-- 
    Document   : index.jsp
    Created on : 26-mar-2011, 12:56:43
    Author     : Vanesa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link href="../css/administracion/administracion.css" media="screen" rel="stylesheet" type="text/css">-->
        <link href="css/administracion/administracion.css" media="screen" rel="stylesheet" type="text/css">
        <title>Administracion</title>
    </head>
    <body>
        <div id="titulo">Administración</div>
        <ul id="indice">
            <li>
                <a href="administracion/controladorAdmin?action=usuariosIndex">Administrar usuarios</a>
            </li>
            <li>
                <a href="administracion/controladorAdmin?action=articulosIndex">Administrar artículos</a>
            </li>
            <li>
                <a href="administracion/controladorAdmin?action=valoracionesIndex">Administrar valoraciones</a>
            </li>
            <li>
                <a href="administracion/controladorAdmin?action=settings">Configuración</a>
            </li>
        </ul>
    </body>
</html>
