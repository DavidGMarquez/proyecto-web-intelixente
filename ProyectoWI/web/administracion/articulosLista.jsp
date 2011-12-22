<%-- 
    Document   : listUsuarios.jsp
    Created on : 26-mar-2011, 13:06:10
    Author     : Vanesa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<c:choose>
    <c:when test="${empty articulos}">
        <div><h1>Lista de articulos vacia</h1></div>
    </c:when>
    <c:otherwise>
        <h2>Lista de articulos</h2>
        <div class="lista">
            <div id="centrar">
                <%@ include file="paginacion.jsp"%>
                <form action="controladorAdmin?action=insertarArticuloForm" method="post">
                    <input type="submit" name="insertar" value="Añadir nuevo articulo"/>
                </form>
                <table>
                    <tr>
                        <th class="resaltarCelda">Código</th>
                        <th class="resaltarCelda text">Película</th>
                        <th class="resaltarCelda">Precio</th>
                        <th class="resaltarCelda">Unidades</th>
                        <th class="resaltarCelda">Activar</th>
                        <th class="resaltarCelda">Editar</th>
                        <th class="resaltarCelda">Borrar</th>
                    <tr/>

                    <c:set var="inicio" value="${(pagina-1)*registros}"/>
                    <c:set var="fin" value="${pagina*registros}"/>

                    <c:forEach items="${articulos}" var="item" begin="${inicio}" end="${fin-1}" step="1">
                        <tr>
                            <td><c:out value="${item.codigoArticulo}"/></td>
                            <td class="text"><c:out value="${item.pelicula.titulo}"/></td>
                            <td><fmt:formatNumber pattern="$0.00" value="${item.precio}"/></td>
                            <td><c:out value="${item.unidades}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.activo==false}">
                                        <a href="controladorAdmin?action=activarArticulo&pagina=<c:out value='${pagina}'/>&idArticulo=<c:out value='${item.codigoArticulo}'/>">activar</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="controladorAdmin?action=desactivarArticulo&pagina=<c:out value='${pagina}'/>&idArticulo=<c:out value='${item.codigoArticulo}'/>">desactivar</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><a href="controladorAdmin?action=editarArticulo&pagina=<c:out value='${pagina}'/>&idArticulo=<c:out value='${item.codigoArticulo}'/>">editar</a></td>
                            <td><a href="controladorAdmin?action=borrarArticulo&pagina=<c:out value='${pagina}'/>&idArticulo=<c:out value='${item.codigoArticulo}'/>">borrar</a></td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
    </c:otherwise>
</c:choose>
