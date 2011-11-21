<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="busca" class="borde formulario cuadro">
    <h4>Puedes buscar en el catálogo aquí.</h4>
    <form method="POST" action="controlador?page=busca">
        <p><label for="precioMaximo">Precio máximo: </label><input name="precioMaximo" type="text" value ="${precioMaximo}"/></p>
        <p><label for="titulo">Título: </label><input name="titulo" type="text" value ="${titulo}"/></p>
        <p><label for="anho">Año exacto: </label><input name="anho" type="text" value="${anho}"/></p>
        <p>
        	<button onClick="return resetFiltro();">Borrar todo</button>
        	<input type="submit" value="Filtrar"/>
        </p>
    </form>
</div>
<script>
	function resetFiltro(){
		$("#busca input[type=text]").val("");
		//$("#busca input[type=checkbox]").removeAttr('checked');
		return false;
	}
</script>