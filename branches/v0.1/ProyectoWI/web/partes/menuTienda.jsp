<ul id="cabecera">
	<li class="activar" style="background-image: url(./img/identificate4.png);" id="pageusuario"></li>
	<li class="activar" style="background-image: url(./img/tienda4.png);" id="pagetienda" /></li>
	<li class="activar" style="background-image: url(./img/busca4.png);" id="pagebusca" /></li>
	<li class="activar" style="background-image: url(./img/informate4.png);" id="pageinfo"/></li>
</ul>

<%@ include file="menuSesion.jsp"%>

<script type="text/javascript">
<!--
var page = "${param.page}";
if(page.length>0){
	//$("#page"+page).removeClass("activar").addClass("imgCabecera");
	$("#page"+page).addClass("imgCabecera");
}
//-->
</script>