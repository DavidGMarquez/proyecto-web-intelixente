<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="cesta" class="borde cuadro">
    <h1>CESTA</h1>
    <p><c:out value="${comentario}"/></p>
    
   	<ul class="compra">
   		<c:forEach items="${cart.cesta}" var="i">
    		<li class="itemCompra">
	    		<p class="boton"><img class="activar" src="img/-.png" name="page=${param.page}&action=down&codigo=${i.codigoArticulo}"/></p>
	    		<p class="cantidad"><c:out value="${i.cantidad}"/></p>
	    		<p class="boton"><img class="activar" src="img/+.png" name="page=${param.page}&action=up&codigo=${i.codigoArticulo}"/></p>
	    		<p class="album"><c:out value="${i.album}"/></p>
	    		<p class="precio"><fmt:formatNumber pattern="$0.00" value="${i.precio}"/>/unidad</p>
    		</li>
   		</c:forEach>
   	</ul>
   	<div class="factura">
   		<p><span>Subtotal:</span><span><fmt:formatNumber pattern="$0.00" value="${cart.precioTotal}"/></span></p>
   		<c:choose>
           	<c:when test="${usuario.tipo == 'VIP'}">
           		<p><span>Descuento:</span><span>20%</span></p>
           		<p id="total"><span>Total:</span><span id="pTotal"><fmt:formatNumber pattern="$0.00" value="${cart.precioTotal * 0.8}"/></span></p>
           	</c:when>
               <c:otherwise>
               	<p><span>Descuento:</span><span>0%</span></p>
               	<p id="total"><span>Total:</span><span id="pTotal"><fmt:formatNumber pattern="$0.00" value="${cart.precioTotal}"/></span></p>
               </c:otherwise>
           </c:choose>
   	</div>
   	<div class="direccion">
   		<c:choose>
       		<c:when test="${usuario == null}">
           		<h3>Identif�cate para poder comprar.</h3>
       		</c:when>
       		<c:otherwise>
           		<c:choose>
               		<c:when test="${cart.precioTotal > 0.00}">
                   		<form method="POST" action="controlador?page=${param.page}&action=pagar" onsubmit="return confirmarCompra();">
                       		<input id="pagar" type="SUBMIT" value="PAGAR"/>
                       		<div id="envio" class="formulario">
                           	<h3>Direcci�n de env�o</h3>
                           		<p>
                           			<label for="calle">Calle y n�:</label>
                           			<input name="calle" type="text" value="${usuario.direccion.direccion}"/>
                           		</p>
                            	<p>
                            		<label for="localidad">Localidad:</label>
                            		<input name="localidad" type="text" value="${usuario.direccion.localidad}"/>
                            	</p>
                            	<p>
                            		<label for="provincia">Provincia:</label>
                            		<input name="provincia" type="text" value="${usuario.direccion.provincia}"/>
                            	</p>
                            	<p>
                            		<label for="cp">CP:</label>
                            		<input name="cp" type="text" value="${usuario.direccion.cp}"/>
                            	</p>
                       		</div>
                   		</form>
               		</c:when>
           		</c:choose>
       		</c:otherwise>
   		</c:choose>
   	</div>
   
    
   <%--  
    <table>
        <c:forEach items="${cart.cesta}" var="i">
            <tr>
                <td>
                    <img class="activar" src="img/-.png" name="page=tienda&action=down&codigo=${i.codigoArticulo}"/>
                    ${i.cantidad}
                    <img class="activar" src="img/+.png" name="page=tienda&action=up&codigo=${i.codigoArticulo}"/>
                </td><td>
                    <p><c:out value="${i.album}"/></p>
                </td><td>
                    <p class="precio"><fmt:formatNumber pattern="$0.00" value="${i.precio}"/>/unidad</p>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2">Subtotal: <fmt:formatNumber pattern="$0.00" value="${cart.precioTotal}"/></td>
        </tr><tr>
        	<td colspan="2">Descuento:
                <c:choose>
                    <c:when test="${usuario.tipo == 'VIP'}"> 20% </c:when>
                    <c:otherwise> 0%</c:otherwise>
                </c:choose>
            </td>
        </tr><tr>
	        <c:choose>
	            <c:when test="${usuario.tipo == 'VIP'}">
	            	<td id="total" colspan="2">Total: <span id="pTotal"><fmt:formatNumber pattern="$0.00" value="${cart.precioTotal * 0.8}"/></span></td>
	           	</c:when>
	            <c:otherwise>
	            	<td id="total" colspan="2">Total: <span id="pTotal"><fmt:formatNumber pattern="$0.00" value="${cart.precioTotal}"/></span></td>
	           	</c:otherwise>
	        </c:choose>
        </tr>
    </table>
    <c:choose>
        <c:when test="${usuario == null}">
            <h3>Identif�cate para poder comprar.</h3>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${cart.precioTotal > 0.00}">
                    <form method="POST" action="controlador?page=tienda&action=pagar" onsubmit="return confirmarCompra();">
                        <input id="pagar" type="SUBMIT" value="PAGAR"/>
                        <div id="envio" class="formulario">
                            <h3>Direcci�n de env�o</h3>
                            <p><label for="calle">Calle y n�:</label><input name="calle" type="text" value="${usuario.direccion.direccion}"/></p>
                            <p><label for="localidad">Localidad:</label><input name="localidad" type="text" value="${usuario.direccion.localidad}"/></p>
                            <p><label for="provincia">Provincia:</label><input name="provincia" type="text" value="${usuario.direccion.provincia}"/></p>
                            <p><label for="cp">CP:</label><input name="cp" type="text" value="${usuario.direccion.cp}"/></p>
                        </div>
                    </form>
                </c:when>
            </c:choose>
        </c:otherwise>
    </c:choose>
    --%>
</div>