<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${empty usuario}">
        <div id="x">
            <p>anónimo</p>
            <p><a href="controlador?page=usuario">iniciar sesión</a></p>
        </div>
    </c:when>
    <c:otherwise>
        <div id="x">
            <p>${usuario.nombre} </p>
            <p><a href="controlador?action=salir">cerrar sesión</a></p>
        </div>
    </c:otherwise>
</c:choose>
