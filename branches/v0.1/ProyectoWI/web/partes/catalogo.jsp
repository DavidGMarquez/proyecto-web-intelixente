<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="cntItems">
	<c:choose>
		<c:when test="${empty catalogo }">
			<p>No hay elementos en el catalogo</p>
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
		</c:otherwise>
	</c:choose>
</div>