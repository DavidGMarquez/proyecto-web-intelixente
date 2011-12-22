<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<div class="paginacion">
    <c:forEach var="p" begin="1" end="${paginas}" step="1">
        <c:choose>
            <c:when test="${p==pagina}">
                <c:out value="${p}"/> |
            </c:when>
            <c:otherwise>
                <a href="#" onclick="recuperaElementos(<c:out value="${p}"/>)" ><c:out value="${p}"/></a> |
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>--%>

<h3>Paginas</h3>
<div class="paginacion">
    <c:forEach var="p" items="${paginacion}">
            <c:choose>
                    <c:when test="${p==pagina}">
                            <c:out value="${p}"/> |
                    </c:when>
                    <c:otherwise>
                            <a class="goto" href="#" onclick="recuperaElementos(<c:out value="${p}"/>)"><c:out value="${p}"/></a> |
                    </c:otherwise>
            </c:choose>
    </c:forEach>
</div>