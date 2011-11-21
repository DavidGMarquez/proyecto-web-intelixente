<%-- 
    Document   : editUsuario
    Created on : 28-mar-2011, 21:14:27
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
        <script type="application/x-javascript" src="../script/administracion/editarArticulo.js"></script>
        <title>Administracion: Editar Artículo</title>
    </head>
    <body>
        <div id="titulo">Administración: Articulos</div>
        <%@ include file="menu.jsp"%>
        <h2>Administración: Editar Articulo</h2>
        <div id="lista">
            <div class="centrar" id="edit">
                <form method="post" action="#" name="formulario">
                    <input type="hidden" name="pagina" value="${pagina}"/>
                    <table>
                        <c:choose>
                            <c:when test="${acc=='modificar'}">
                                <input type="hidden" name="idArticulo" value="${articulo.codigoArticulo}"/>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td class="resaltarCelda cab">Código de artículo:</td>
                                    <td><input type="text" name="codigo" value="">*</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <td class="resaltarCelda cab">Precio:</td>
                            <td><input type="text" name="precio" value="${articulo.precio}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Unidades:</td>
                            <td><input type="text" name="unidades" value="${articulo.unidades}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Activo:</td>
                            <td>
                                <c:choose>
                                    <c:when test="${articulo.activo==true}">
                                        <input type="checkbox" name="activo" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="activo" >
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td class="resaltarCelda cab">Año:</td>
                            <td><input type="text" name="anho" value="${articulo.pelicula.anho}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Imagen:</td>
                            <td><input type="text" name="imagen" class="size" value="${articulo.pelicula.imagen}"></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Directores:</td>
                            <td>
                                <c:if test="${not empty articulo.pelicula.actores}">
                                    <ul>
                                        <c:forEach items="${articulo.pelicula.directores}" var="director">
                                            <li><c:out value="${director}"></c:out></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Actores</td>
                            <td>
                                <c:if test="${not empty articulo.pelicula.actores}">
                                    <ul>
                                        <c:forEach items="${articulo.pelicula.actores}" var="actor">
                                            <li><c:out value="${actor}"></c:out></li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </td> 
                        </tr>
                    </table>
                    <div id="cntButons">
                        <input type="button" value="Cancelar" name="cancelar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                        <c:choose>
                            <c:when test="${acc=='modificar'}">
                                <input type="button" value="Modificar" name="modificar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                            </c:when>
                            <c:otherwise>
                                <input type="button" value="Insertar" name="insertar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <p class="footer">* Los campos marcados con asterisco son obligatorios.</p>
                </form>
            </div>
        </div>
    </body>
</html>
