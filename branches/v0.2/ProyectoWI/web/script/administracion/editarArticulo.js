/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function ejecutarAccion(boton, pagina){
    if (boton.name=="modificar" || boton.name=="insertar"){
        // probar campos vacios
        var campos="";
        var error=false;
        if (boton.name=="insertar" && document.formulario.codigo.value == "" ){
            campos=campos+"codigo ";
            error=true;
        }
        /*if (document.formulario.imagen.value == ""){
            campos=campos+"imagen ";
            error=true;
        }*/
        if (document.formulario.titulo.value == ""){
            campos=campos+"album ";
            error=true;
        }
        
        var RegExPattern = /^[1-2][0-9][0-9][0-9]$/;
        if ( document.formulario.anho.value == "" || (!document.formulario.anho.value.match(RegExPattern))){
            campos=campos+"anho ";
            error=true;
        }
        RegExPattern =/^([0-9])*[.]?[0-9]*$/;
        if (document.formulario.precio.value == "" || (!document.formulario.precio.value.match(RegExPattern))){
            campos=campos+"precio ";
            error=true;
        }
        RegExPattern = /^(?:\+|-)?\d+$/;
        if ( document.formulario.unidades.value == "" || (!document.formulario.unidades.value.match(RegExPattern))){
            campos=campos+"unidades ";
            error=true;
        }

       
        if(error){
            alert("Los siguientes campos no se han completado correctamente:\n"+campos);
        }else{
            if (boton.name=="modificar"){
                //alert('modificar');
                document.formulario.action="controladorAdmin?action=modificarArticulo";
            }else if (boton.name=="insertar"){
                //alert('insertar');
                document.formulario.action="controladorAdmin?action=insertarArticulo";
            }
            document.formulario.submit();
        }
    }else{       
        if (boton.name=="cancelar"){
            window.location.href = "controladorAdmin?action=articulosIndex&pagina="+pagina;
        }
    }
}

