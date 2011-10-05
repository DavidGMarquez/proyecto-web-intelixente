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
								<c:when test="${empty i.imagen}">
									<img src="img/caratula.png" class="cover" name="${i.codigoArticulo}" width="160px"/>
								</c:when>
								<c:otherwise>
									<img src="caratulas/${i.imagen}" class="cover" name="${i.codigoArticulo}" width="160px"/>
								</c:otherwise>
							</c:choose>
							<img class="activar comprar" src="img/compra.png" width="32px" name="page=${param.page}&action=up&codigo=${i.codigoArticulo}"/>
						</div>
						<ul class="info">
							<li><span>Álbum: </span><span><c:out value="${i.album}"/></span></li>
							<li><span>Grupo: </span><span><c:out value="${i.grupo}"/></span></li>
							<li><span>Código: </span><span><c:out value="${i.codigoArticulo}"/></span></li>
							<li><span class="precio">Precio: </span><span><fmt:formatNumber pattern="$0.00" value="${i.precio}"/></span></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</div>