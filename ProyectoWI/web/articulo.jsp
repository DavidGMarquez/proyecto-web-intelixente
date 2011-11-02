<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
    Document   : articulo
    Created on : 01-abr-2011, 16:04:11
    Author     : harry
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
    	<title>Proyecto DAWA</title>
        <link href="css/default.css" media="screen" rel="stylesheet" type="text/css">
        <link href="css/starRate.css" media="screen" rel="stylesheet" type="text/css">
        <script type="application/x-javascript" src="./script/jquery-1.5.1.js"></script>
        <script type="application/x-javascript" src="./script/menu.js"></script>
        <!-- Scripts de YUI -->
		<script src="http://yui.yahooapis.com/2.9.0/build/yahoo/yahoo-min.js"></script>
        <!--script type="text/javascript" src="script/yahoo/yahoo-min.js"></script-->
		<script src="http://yui.yahooapis.com/2.9.0/build/dom/dom-min.js"></script>
		<!--script type="text/javascript" src="script/dom/dom-min.js"></script-->
		<script src="http://yui.yahooapis.com/2.9.0/build/event/event-min.js" ></script>
		<!--script type="text/javascript" src="script/event/event-min.js"></script-->
		<script src="http://yui.yahooapis.com/2.9.0/build/connection/connection-min.js"></script>
		<!--script type="text/javascript" src="script/connection/connection-min.js"></script-->
		<script src="http://yui.yahooapis.com/2.9.0/build/animation/animation-min.js" type="text/javascript"></script>
		<!--script type="text/javascript" src="script/animation/animation-min.js"></script-->
		<script type="text/javascript" src="script/rating.js"></script>
        <!-- Fin de scripts de YUI -->
    </head>

    <body>
        <%@ include file="partes/menuTienda.jsp"%>
            <div id="articulo" class="borde cuerpo">
                <c:choose>
                    <c:when test="${empty articulo.pelicula.imagen}">
                        <img class="cover" src="img/caratula.png"/>
                    </c:when>
                    <c:otherwise>
                        <img class="cover" src="${articulo.pelicula.imagen}"/>
                    </c:otherwise>
                </c:choose>
                <div class="datos">
                        <p class="title"><span>Titulo: </span><span>${articulo.pelicula.titulo}</span></p>
                        <p><span>Año: </span><span>${articulo.pelicula.anho}</span></p>
                        <p><span>Precio: </span><span><fmt:formatNumber pattern="$0.00" value="${articulo.precio}"/></span></p>
                        <p><span>Puntuación general: </span><span>${valoracionGeneral}</span></p>
                        <c:choose>
                                <c:when test="${not empty usuario}">
                                    <%-- <p>Puntúe el articulo, introduzca un valor entre 0 y 9: 
                                    <form name="formulario" method="POST" action="controlador?page=articulo&action=valorar&usuario=${usuario.idUsuario}&codigo=${articulo.codigoArticulo}">
                                        <input type="text" value="${valoracionUsuario}" name="valoracion"/>
                                        <input type="button" value="Puntuar" onclick="compruebaPuntuacion();"/>
                                    </form>
                                    </p>--%>
                                    <div id="ratingdiv">
                                                            <form id="rating" action="controlador?page=articulo&action=valorar&usuario=${usuario.idUsuario}&codigo=${articulo.codigoArticulo}" method="post" title="Average: 3.4">
                                                                    <label for="id_rating">Valoración:</label>
                                                                    <select name="valoracion" id="id_rating">
                                                                            <option value="1">1 - Mala</option>
                                                                            <option value="2">2 - Pasable</option>
                                                                            <option value="3">3 - Buena</option>
                                                                            <option value="4">4 - Muy buena</option>
                                                                            <option value="5">5 - Excelente</option>
                                                                    </select>
                                                                    <input type="submit" value="Puntuar" />
                                                            </form>
                                                    </div>
                                    </c:when>
                            </c:choose>
                    </div>
                </div>
                <div id="bajoArticulo" class="cuerpo">
                    <div id="recomendaciones" class="borde">
                        <c:choose>
                            <c:when test="${not empty recomendaciones}">
                                <h3>Películas relacionadas</h3>
                                <ul>
                                    <c:forEach items="${recomendaciones}" var="i">
                                        <li>
                                        <c:choose>
                                                <c:when test="${empty i.pelicula.imagen}">
                                                        <img src="img/caratula.png" class="cover" name="${i.codigoArticulo}"/>
                                                </c:when>
                                                <c:otherwise>
                                                        <img src="${i.pelicula.imagen}" class="cover" name="${i.codigoArticulo}"/>
                                                </c:otherwise>
                                        </c:choose>
                                        <span><c:out value="${i.pelicula.titulo}"/></span>
                                        </li>
                                    </c:forEach>
                                </ul>        
                            </c:when>
                            <c:otherwise>
                                <p>No hay recomendaciones</p>
                            </c:otherwise>
                        </c:choose>    
                    </div>

                    <div id="comentarios" class="borde">
                        <h3>Comentarios</h3>
                        <c:choose>
                        <c:when test="${not empty comentarios}">
                                    <c:forEach items="${comentarios}" var="x">
                                        <p><span style="font-weight: bold">${x.nombreUsuario}:</span> ${x.comentario}</p>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                        <p>No hay ningún comentario</p>
                                </c:otherwise>
                        </c:choose>
                        <c:choose>
                        <c:when test="${not empty usuario}">
                                    <form action="controlador?page=articulo&action=comentar&codigo=${articulo.codigoArticulo}" method="POST">
                                        <!-- <label for="comentario">Comenta: </label> -->
                                        <!-- <input name="comentario" type="text"/> -->
                                        <textarea name="comentario" rows="3" cols="15"></textarea>
                                        <input type="submit" value="Comentar">
                                    </form>
                                </c:when>
                                <c:otherwise>
                                        <p>Necesita registrarse o iniciar sesión para poder comentar</p>
                                </c:otherwise>
                        </c:choose>
                    </div>
                </div>

	</body>
</html>
