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
        <script type="application/x-javascript">
            $(document).ready(function(){
                    var a = "${mensaje}";
                    if(a.length > 0) alert("${mensaje}");
            });
        </script>
    </head>

    <body>
        <%@ include file="partes/menuTienda.jsp"%>
            <div id="articulo" class="borde cuerpo">
                <div class="cntIzquierda">
                    <c:choose>
                        <c:when test="${empty articulo.pelicula.imagen}">
                            <img class="cover2" src="img/caratula.png"/>
                        </c:when>
                        <c:otherwise>
                            <img class="cover2" src="${articulo.pelicula.imagen}"/>
                        </c:otherwise>
                    </c:choose>
                    <div class="cntPrecio">
                        <p><fmt:formatNumber pattern="$0.00" value="${articulo.precio}"/></span></p>
                        <a href="javascript:void(0)" class="boton activar" name="page=${param.page}&action=up&codigo=${articulo.codigoArticulo}" class="boton">Añadir al carrito</a>
                    </div> 
                </div>
                <div class="datos">
                        <p class="title"><span>Titulo: </span>${articulo.pelicula.titulo}</p>
                        <p><span class="resaltar">Año: </span>${articulo.pelicula.anho}</p>
                        <p><span class="resaltar">Precio: </span><fmt:formatNumber pattern="$0.00" value="${articulo.precio}"/></p>
                        <p><span class="resaltar">Puntuación general: </span>${valoracionGeneral}</p>
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
                        <p><span class="resaltar">Tipo: </span>
                            <c:choose>
                                <c:when test="${articulo.tipo eq null}">
                                   Película sin clasificar
                                </c:when>
                                <c:otherwise>
                                    ${articulo.tipoNombre}
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <p class="resaltar">Más info:</p>
                        <table>
                        <tr>
                            <td class="resaltarCelda cab">Director(es)</td>
                            <td class="lista">
                                <c:if test="${not empty articulo.pelicula.directores}">
                                    <ul>
                                        <c:forEach items="${articulo.pelicula.directores}" var="director">
                                            <li><c:out value="${director.nombre}"></c:out></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Actor(es)</td>
                            <td class="lista">
                                <c:if test="${not empty articulo.pelicula.actores}">
                                    <ul>
                                        <c:forEach items="${articulo.pelicula.actores}" var="actor">
                                            <li><c:out value="${actor.nombre}"></c:out></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Género(s)</td>
                            <td class="lista">
                                <c:if test="${not empty articulo.pelicula.generos}">
                                        <c:forEach items="${articulo.pelicula.generos}" var="genero">
                                            <c:out value="${genero}"></c:out>.
                                        </c:forEach>
                                </c:if>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Pais(es)</td>
                            <td class="lista">
                                <c:if test="${not empty articulo.pelicula.paises}">
                                    <ul>
                                        <c:forEach items="${articulo.pelicula.paises}" var="pais">
                                            <li><c:out value="${pais}"></c:out></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </td> 
                        </tr>
                        </table>
                        
                </div>
                           
            </div>
                <div id="bajoArticulo" class="cuerpo">
                    <div id="recomendaciones" class="borde conCabecera">
                        <h3>Películas relacionadas</h3>
                        <div class="contenido">
                        <c:choose>
                            <c:when test="${not empty recomendaciones}">
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
                                        <span class="title"><c:out value="${i.pelicula.titulo}"/></span>
                                        </li>
                                    </c:forEach>
                                </ul>  
                                <div class="oferta">
                                    <h4>Oferta especial 3x2</h4>
                                    <p>Lleve tres y pague dos*</p> 
                                    <form>
                                        <input type="hidden" name="action" value="oferta3x2" />
                                        <input type="hidden" name="page" value="articulo" />
                                        <input type="hidden" name="codigo" value="${articulo.codigoArticulo}" />
                                        <%--<input type="hidden" name="articulo2" value="${recomendaciones[0].codigoArticulo}" />
                                        <input type="hidden" name="articulo3" value="${recomendaciones[1].codigoArticulo}" />--%>
                                        <input class="boton" type="submit" value="Comprar" />
                                    </form>
                                    <p class="nota">*La película gratuita será la de menor precio</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p>No hay recomendaciones</p>
                            </c:otherwise>
                        </c:choose>  
                        </div>
                    </div>

                    <div id="comentarios" class="borde conCabecera">
                        <h3>Comentarios</h3>
                        <div class="contenido">
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
                                            <input class="boton" type="submit" value="Comentar">
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                            <p>Necesita registrarse o iniciar sesión para poder comentar</p>
                                    </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
	</body>
</html>
