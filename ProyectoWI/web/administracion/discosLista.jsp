<%-- 
    Document   : listUsuarios.jsp
    Created on : 26-mar-2011, 13:06:10
    Author     : Vanesa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de discos</title>
    </head>
    <body>

    <c:choose>
        <c:when test="${empty articulos}">
            <div><h1>Lista de articulos vacia</h1></div>
        </c:when>
        <c:otherwise>
            <h2>Lista de articulos</h2>
            <div id="lista">

                <div id="centrar">

                    <c:forEach var="p" begin="1" end="${paginas}" step="1">
                        <c:choose>
                            <c:when test="${p==pagina}">
                                <c:out value="${p}"/> |
                            </c:when>
                            <c:otherwise>
                                <a href="#" onclick="recuperaDiscos(<c:out value="${p}"/>)" ><c:out value="${p}"/></a> |
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <form action="controladorAdmin?action=insertarDiscoForm" method="post">
                        <input type="submit" name="insertar" value="Añadir nuevo disco"/>
                    </form>
                    <table>
                        <tr>
                            <th class="resaltarCelda">Código</th>
                            <th class="text resaltarCelda">Grupo</th>
                            <th class="text resaltarCelda">Álbum</th>
                            <th class="resaltarCelda">Precio</th>
                            <th class="resaltarCelda">Activar</th>
                            <th class="resaltarCelda">Editar</th>
                            <th class="resaltarCelda">Borrar</th>
                        <tr/>

                        <c:set var="inicio" value="${(pagina-1)*registros}"/>
                        <c:set var="fin" value="${pagina*registros}"/>

                        <c:forEach items="${articulos}" var="item" begin="${inicio}" end="${fin-1}" step="1">
                            <tr>
                                <td><c:out value="${item.codigoArticulo}"/></td>
                            <td><c:out value="${item.grupo}"/></td>
                            <td><c:out value="${item.album}"/></td>
                            <td><c:out value="${item.precio}"/></td>
                            <td>
                            <c:choose>
                                <c:when test="${item.activo==false}">
                                    <a href="controladorAdmin?action=activarDisco&pagina=<c:out value='${pagina}'/>&idDisco=<c:out value='${item.codigoArticulo}'/>">activar</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="controladorAdmin?action=desactivarDisco&pagina=<c:out value='${pagina}'/>&idDisco=<c:out value='${item.codigoArticulo}'/>">desactivar</a>
                                </c:otherwise>
                            </c:choose>
                            </td>

                            <td><a href="controladorAdmin?action=editarDisco&pagina=<c:out value='${pagina}'/>&idDisco=<c:out value='${item.codigoArticulo}'/>">editar</a></td>
                            <td><a href="controladorAdmin?action=borrarDisco&pagina=<c:out value='${pagina}'/>&idDisco=<c:out value='${item.codigoArticulo}'/>">borrar</a></td>
                            </tr>

                        </c:forEach>
                    </table>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>
