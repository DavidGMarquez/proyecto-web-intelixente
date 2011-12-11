<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                                <div class="oferta">
                                    <h4>Oferta especial 3x2</h4>
                                    <p>Lleve tres y pague dos*</p>
                                    <form>
                                        <input type="hidden" name="action" value="oferta3x2" />
                                        <input type="hidden" name="page" value="articulo" />
                                        <input type="hidden" name="codigo" value="${articulo.codigoArticulo}" />
                                        <%--<input type="hidden" name="articulo2" value="${recomendaciones[0].codigoArticulo}" />
                                        <input type="hidden" name="articulo3" value="${recomendaciones[1].codigoArticulo}" />--%>
                                        <input class="boton" type="submit" value="Comprar" />
                                    </form>
                                    <p class="nota">*La película gratuita será la de menor precio</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p>No hay recomendaciones</p>
                            </c:otherwise>
                        </c:choose>
                        </div>

		</c:otherwise>
	</c:choose>
</div>