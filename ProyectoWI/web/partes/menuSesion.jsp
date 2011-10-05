<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${empty usuario}">
        <div id="x">
            <p>an�nimo</p>
            <p><a href="controlador?page=usuario">iniciar sesi�n</a></p>
        </div>
    </c:when>
    <c:otherwise>
        <div id="x">
            <p>${usuario.nombre} </p>
            <p><a href="controlador?action=salir">cerrar sesi�n</a></p>
        </div>
    </c:otherwise>
</c:choose>
