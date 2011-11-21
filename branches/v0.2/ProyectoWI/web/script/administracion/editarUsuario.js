/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function ejecutarAccion(boton, pagina,idUsuario){
    var error=false;
    var campos="";

    if (boton.name=="guardar"){
        if (document.formulario.nombre.value == ""){
            campos=campos+"nombre ";
            error=true;
        }

        var RegExPattern = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
        if ( document.formulario.email.value == "" || (!document.formulario.email.value.match(RegExPattern))){
            campos=campos+"email ";
            error=true;
        }

        var RegExPattern =/^([0-9])*[.]?[0-9]*$/;
        if ( document.formulario.totalCompra.value != "" && (!document.formulario.totalCompra.value.match(RegExPattern))){
            campos=campos+"Compra total ";
            error=true;
        }
        if(error){
            alert("Los siguientes campos no se han completado correctamente:\n"+campos);
        }else{
            document.formulario.submit();
        }
    }else{
       
        if (boton.name=="cancelar"){
            window.location.href = "controladorAdmin?action=usuariosIndex&pagina="+pagina;
        }else if (boton.name=="cambiarPass"){
            if (document.formulario.pass.value != "" && document.formulario.pass.value==document.formulario.pass2.value){

                document.formulario.submit();
            }else{
                if (document.formulario.pass.value == "")
                    alert("La contraseña no puede estar en blanco");
                else
                    alert("La contraseñas deben ser iguales");
            }
        }else if(boton.name=="pass"){
            //alert("pass"+ idUsuario);
            window.location.href = "controladorAdmin?action=cambiaPassFormUsuario&pagina="+pagina+"&idUsuario="+idUsuario;
        }
    }
}

