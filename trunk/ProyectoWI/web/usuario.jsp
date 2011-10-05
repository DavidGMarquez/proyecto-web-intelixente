<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
    Document   : usuario
    Created on : 28-mar-2011, 18:51:18
--%>

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
        <c:choose>
            <c:when test="${param.action == 'logueo'}">
                <div id="identificate" class="seccion borde divA cuerpo">
                    <p>Introduce los datos de tu cuenta o <a href="controlador?page=usuario&action=registro">REGÍSTRATE</a>.</p>
                    <form id="formularioLogueo" class="formulario" method="post" action="controlador?page=usuario&action=loguear" onsubmit="return validarLogueo();">
                        <p><label for="email">Email:</label><input type="text" name="email" id="email"></p>
                        <p><label for="password">Contraseña:</label><input type="password" name="password" id="password"></p>
                        <p>
                        	<input class="boton" type="reset" value="Borrar todo"/>
                        	<input class="boton" type=SUBMIT value="Acceder"/>
                        </p>
                    </form>
                </div>
            </c:when>

            <c:when test="${param.action == 'registro'}">
                <div id="identificate" class="seccion borde divA cuerpo">
                    <form class="formulario" method="post" action="controlador?page=usuario&action=registrar" onsubmit="return validarRegistro();">
                        <p><label for="email">Email:</label><input type="text" name="email" id="email"></p>
                        <p><label for="passwrod">Contraseña:</label><input type="password" name="password" id="password"></p>
                        <p><label for="nombre">Nombre:</label><input type="text" name="nombre" id="nombre"></p>
                        <p><label for="telefono">Telefono:</label><input type="text" name="telefono" id="telefono"></p>
                        <p><label for="calle">Calle y nº:</label><input type="text" name="calle" id="calle"></p>
                        <p><label for="localidad">Localidad:</label><input type="text" name="localidad" id="localidad"></p>
                        <p><label for="provincia">Provincia:</label><input type="text" name="provincia" id="provincia"></p>
                        <p><label for="cp">CP:</label><input type="text" name="cp" id="cp"></p>
                        <p>
                        	<input class="boton" type="reset" value="Borrar todo"/>
                        	<input class="boton" type=SUBMIT value="Registrar"/>
                        </p>
                        <br/>Todos los campos son obligatorios.
                    </form>
                </div>
            </c:when>

	
            <c:when test="${param.action == 'ver'}">
                <div id="identificate" class="seccion borde divA cuerpo">
                    <p>Estos son tus datos:</p> 
                    <p><span>Email:</span><span><c:out value="${usuario.email}"/></span></p>
                    <p><span>Nombre:</span><span><c:out value="${usuario.nombre}"/></span></p>
                    <p><span>Teléfono:</span><span><c:out value="${usuario.telefono}"/></span></p>
                    <p><span>Calle:</span><span><c:out value="${usuario.direccion.direccion}"/></span></p>
                    <p><span>Localidad:</span><span><c:out value="${usuario.direccion.localidad}"/></span></p>
                    <p><span>Provincia:</span><span><c:out value="${usuario.direccion.provincia}"/></span></p>
                    <p><span>CP:</span><span><c:out value="${usuario.direccion.cp}"/></span></p>
                    <p><span>Tipo de usuario:</span><span><c:out value="${usuario.tipo}"/></span></p>
                </div>
            </c:when>
        </c:choose>
    </body>
</html>
