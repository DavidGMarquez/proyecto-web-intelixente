<%@page import="tienda.modelo.Articulo"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="busca" class="borde formulario cuadro">
    <h4>Puedes buscar en el cat�logo aqu�.</h4>
    <form method="POST" action="controlador?page=busca">
        <ul>
        <li>
            <label for="precioMaximo">Precio m�ximo: </label>
            <input name="precioMaximo" type="text" value="${precioMaximo}"/>
        </li>
        <li>
            <label for="titulo">T�tulo:</label>
            <input name="titulo" type="text" value="${titulo}"/>
        </li>
        <li>
            <label for="anho">A�o exacto:</label>
            <input name="anho" type="text" value="${anho}"/>
        </li>
        <li class="cntTipo">
            <p>
            <input type="radio" name="tipo" id="rdComercial" value="<%=Articulo.COMERCIAL%>" />
            <label class="radioLabel" fclass="radioLabel" or="rdComercial">Comercial</label>
            <input type="radio" name="tipo" id="rdAlternativa" value="<%=Articulo.ALTERNATIVA%>"/>
            <label class="radioLabel" for="rdAlternativa">Alternativa</label>
            <input type="radio" name="tipo" id="rdAmbas" checked value=""/>
            <label class="radioLabel" for="rdAmbas">Ambas</label>
            </p>
        </li>
        </ul>
        <p>
            <button class="boton" onClick="return resetFiltro();">Borrar todo</button>
            <input class="boton" type="submit" value="Filtrar"/>
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