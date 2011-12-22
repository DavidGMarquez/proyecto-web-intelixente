<%-- 
    Document   : listUsuarios.jsp
    Created on : 26-mar-2011, 13:06:10
    Author     : Vanesa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<c:choose>
    <c:when test="${empty usuarios}">
        <div><h1>Lista de usuarios vacia</h1></div>
    </c:when>
    <c:otherwise>
        <h2>Lista de usuarios</h2>
        <div class="lista">

            <div id="centrar">

            <%@ include file="paginacion.jsp"%>

                <table>
                    <tr >
                        <th class="resaltarCelda">IdUsuario</th>
                        <th class="text resaltarCelda">Nombre</th>                                
                        <th class="text resaltarCelda">Email</th>

                        <th class="resaltarCelda">Activar</th>
                        <th class="resaltarCelda">Editar</th>
                        <th class="resaltarCelda">Borrar</th>
                    <tr/>

                    <c:set var="inicio" value="${(pagina-1)*registros}"/>
                    <c:set var="fin" value="${pagina*registros}"/>

                    <c:forEach items="${usuarios}" var="usuario" begin="${inicio}" end="${fin-1}" step="1">
                        <tr>
                            <td><c:out value="${usuario.idUsuario}"/></td>
                            <td><c:out value="${usuario.nombre}"/></td>

                            <td><c:out value="${usuario.email}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${usuario.activo==false}">
                                        <a href="controladorAdmin?action=activarUsuario&pagina=<c:out value='${pagina}'/>&idUsuario=<c:out value='${usuario.idUsuario}'/>">activar</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="controladorAdmin?action=desactivarUsuario&pagina=<c:out value='${pagina}'/>&idUsuario=<c:out value='${usuario.idUsuario}'/>">desactivar</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td><a href="controladorAdmin?action=editarUsuario&pagina=<c:out value='${pagina}'/>&idUsuario=<c:out value='${usuario.idUsuario}'/>">editar</a></td>
                            <td><a href="controladorAdmin?action=borrarUsuario&pagina=<c:out value='${pagina}'/>&idUsuario=<c:out value='${usuario.idUsuario}'/>">borrar</a></td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
    </c:otherwise>
</c:choose>