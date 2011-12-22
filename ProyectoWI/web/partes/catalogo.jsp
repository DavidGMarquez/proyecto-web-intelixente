<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="./script/catalogo.js"></script>
<div id="cntItems">
    <c:choose>
        <c:when test="${empty catalogo }">
            <div class="borde">
                <p class="info">No hay elementos en el catalogo</p>
            </div>
        </c:when>
	<c:otherwise>
            <div id="catalogo" class="borde">
                    <c:forEach items="${catalogo}" var="i">
                            <div class="item">
                                    <div class="caratula">
                                            <c:choose>
                                                    <c:when test="${empty i.pelicula.imagen}">
                                                            <img src="img/caratula.png" class="cover" name="${i.codigoArticulo}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                            <img src="${i.pelicula.imagen}" class="cover" name="${i.codigoArticulo}"/>
                                                    </c:otherwise>
                                            </c:choose>
                                            <img class="activar comprar" src="img/compra.png" width="32px" name="page=${param.page}&action=up&codigo=${i.codigoArticulo}"/>
                                    </div>
                                    <ul class="info">
                                            <li><span>Título: </span><span><c:out value="${i.pelicula.titulo}"/></span></li>
                                            <li><span>Código: </span><span><c:out value="${i.codigoArticulo}"/></span></li>
                                            <li><span class="precio">Precio: </span><span><fmt:formatNumber pattern="$0.00" value="${i.precio}"/></span></li>
                                    </ul>
                            </div>
                    </c:forEach>
            </div>
            <ul class="pagination">
                    <c:choose>
                            <c:when test="${pagina==1}">
                                    <li><a class="inactive">Anterior</a></li>
                            </c:when>
                            <c:otherwise>
                                    <li><a href="#" class="goto_previous" onclick="recuperaArticulos(<c:out value="${pagina}"/>-1,'<c:out value="${page}"/>')" >Anterior</a></li>
                            </c:otherwise>
                    </c:choose>
                    <%--<c:forEach var="p" begin="1" end="${paginas}" step="1">--%>
                    <c:forEach var="p" items="${paginacion}">
                            <c:choose>
                                    <c:when test="${p==pagina}">
                                            <li><a class="active"><c:out value="${p}"/></a></li>
                                    </c:when>
                                    <c:otherwise>
                                            <li><a class="goto" href="#" onclick="recuperaArticulos(<c:out value="${p}"/>,'<c:out value="${page}"/>')" ><c:out value="${p}"/></a></li>
                                    </c:otherwise>
                            </c:choose>
                    </c:forEach>
                    <c:choose>
                            <c:when test="${pagina==paginas}">
                                    <li><a class="inactive">Siguiente</a></li>
                            </c:when>
                            <c:otherwise>
                                    <li><a href="#" class="goto_next" onclick="recuperaArticulos(<c:out value="${pagina}"/>+1,'<c:out value="${page}"/>')">Siguiente</a></li>
                            </c:otherwise>
                    </c:choose>
            </ul>
        </c:otherwise>
</c:choose>
</div>
