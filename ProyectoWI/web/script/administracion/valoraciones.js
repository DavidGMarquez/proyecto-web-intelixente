/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var ajax;

function funcionCallback(){
	// Comprobamos si la peticion se ha completado (estado 4)
	if( ajax.readyState == 4 ){
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 ){
			// Escribimos el resultado en la pagina HTML mediante DHTML
			document.getElementById("lista").innerHTML = ajax.responseText;
		}
	}
}

function reset(){
    $("select option").each(function(){
       $(this).removeAttr("selected"); 
    });
}

function recuperaValoraciones(pagina){
	// Creamos el control XMLHttpRequest segun el navegador en el que estemos
	if( window.XMLHttpRequest )
		ajax = new XMLHttpRequest(); // No Internet Explorer
	else
		ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

	// Almacenamos en el control al funcion que se invocara cuando la peticion
	// cambie de estado
	ajax.onreadystatechange = funcionCallback;
        
        var idUsuario = $("#selectUsuarios option:selected").val();
        var idPelicula = $("#selectPeliculas option:selected").val(); 
        

        if(pagina==undefined) pagina=1;
	// Enviamos la peticion
	ajax.open( "GET", "controladorAdmin?action=valoracionesLista&pagina="+pagina 
            + "&idUsuario=" + idUsuario + "&idPelicula=" + idPelicula, true );
	ajax.send( "" );
}
