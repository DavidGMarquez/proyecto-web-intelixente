<%-- 
    Document   : valoracionesLista
    Created on : 29-nov-2011, 19:35:30
    Author     : nessa
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:choose>
    <c:when test="${empty valoraciones}">
        <div><h1>Lista de valoraciones vacia</h1></div>
    </c:when>
    <c:otherwise>
        <h2>Lista de valoraciones</h2>
        <div class="lista">
            <div id="centrar">
                <c:forEach var="p" begin="1" end="${paginas}" step="1">
                    <c:choose>
                        <c:when test="${p==pagina}">
                            <c:out value="${p}"/> |
                        </c:when>
                        <c:otherwise>
                            <a href="#" onclick="recuperaValoraciones(${p})" ><c:out value="${p}"/></a> |
                        </c:otherwise>
                    </c:choose>
                </c:forEach> 
                
                <table>
                    <tr >
                        <th class="resaltarCelda">IdUsuario</th>
                        <th class="text resaltarCelda">Titulo de la película</th>                                
                        <th class="resaltarCelda">Valoración</th>
                    <tr/>

                    <c:set var="inicio" value="${(pagina-1)*registros}"/>
                    <c:set var="fin" value="${pagina*registros}"/>

                    <c:forEach items="${valoraciones}" var="valoracion" begin="${inicio}" end="${fin-1}" step="1">
                        <tr>
                            <td><c:out value="${valoracion.idUsuario}"/></td>
                            <td><c:out value="${valoracion.tituloPelicula}"/></td>
                            <td><c:out value="${valoracion.valoracion}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </c:otherwise>
</c:choose>

