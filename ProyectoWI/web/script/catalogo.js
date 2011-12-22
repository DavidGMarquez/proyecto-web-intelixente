function recuperaArticulos(pagina, page){
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado
	ajax.onreadystatechange = funcionCallback;
        
        var cadena = "";
        if(page == "busca"){
            cadena += "&precioMaximo=" + $("#txtPrecioMaximo").val();
            cadena += "&titulo=" + $("#txtTitulo").val();
            cadena += "&anho=" + $("#txtAnho").val();
            cadena += "&tipo=" + $(".cntTipo input[name=tipo]:checked").val();
        }

        if(pagina==undefined) pagina=1;
	// Enviamos la peticion
	ajax.open( "GET", "controlador?page=" + page + "&action=ajax&pagina="+pagina + cadena, true );
	ajax.send( "" );
}


function funcionCallback(){
    // Comprobamos si la peticion se ha completado (estado 4)
    if( ajax.readyState == 4 ){
        // Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
        if( ajax.status == 200 ){
            // Escribimos el resultado en la pagina HTML mediante DHTML
            document.getElementById("lista").innerHTML = ajax.responseText;
            //rellenarPaginacion();
        }
    }
}

function rellenarPaginacion(){
    var anterior = 0;
    $(".pagination a.active, .pagination a.goto").each(function(){
        $this = $(this);
        var actual = parseInt($this.text());
        if(anterior>0 && actual > (anterior +1)){
            $('<li><a class="inactive">...</a></li>').insertBefore($this.parent());
        }
        anterior = actual;
    }); 
}

$(document).ready(function(){
    rellenarPaginacion();
});