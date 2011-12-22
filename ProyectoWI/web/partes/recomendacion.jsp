<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="recomendacionesUsuario" class="borde cuadro">
    <h3>Recomendaciones</h3>
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
            </c:when>
            <c:otherwise>
                <p>No hay recomendaciones</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>