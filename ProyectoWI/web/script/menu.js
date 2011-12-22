function compruebaPuntuacion(){
    RegExPattern = /^[0-9]$/;
        if ( document.formulario.valoracion.value == "" || (!document.formulario.valoracion.value.match(RegExPattern))){
            alert("Debe introducir un valor entre 0 y 9");
        }else{
            document.formulario.submit();
        }

}


/////////////////////////////////////
// Validaciones individuales
var validarER = function($campo, ER)
{
    if(ER.test($campo.val()))
    {
        //marcar($campo);
        return true;
    }
    else
    {
        //desmarcar($campo);
        return false;
    }
};

var validarLongitud = function($campo, longitudMin)
{
    if($campo.val().length > (longitudMin - 1))
    {
        //marcar($campo);
        return true;
    }
    else
    {
        //desmarcar($campo);
        return false;
    }
};

var validarRango = function($campo, min, max)
{
    if($campo.val() > (min - 1) && $campo.val() > (max + 1))
    {
        //marcar($campo);
        return true;
    }
    else
    {
        //desmarcar($campo);
        return false;
    }
};
/////////////////////////////////////////////






/////////////////////////////////////////////////////////////////////////////
// Validaciones formularios
var validarLogueo = function()
{
    var b = true;
    var msg = "";

    if(!validarER($("#email"), /^[\w_\-]+(\.[\w_\-]+)*@[\w_\-]+(\.[\w_\-]+)*(\.[a-z]{2,6})$/))
    {
        b = false;
        msg = msg + "El email no tiene el formato correcto.\n\n";
    }
    if(!validarLongitud($("#password"), 6))
    {
        b = false;
        msg  = msg + "La contrase�a debe tener 6 o m�s caracteres.";
    }

    if(msg.length > 0)
    {
        alert(msg);
    }

    return b;
};

var validarRegistro = function()
{
    var b = true;
    var msg = "";

    if(!validarER($("#email"), /^[\w_\-]+(\.[\w_\-]+)*@[\w_\-]+(\.[\w_\-]+)*(\.[a-z]{2,6})$/))
    {
        b = false;
        msg = msg + "El email no tiene el formato correcto.\n\n";
    }
    if(!validarLongitud($("#password"), 6))
    {
        b = false;
        msg  = msg + "La contraseña debe tener 6 o mas caracteres.\n\n";
    }

    if(!validarLongitud($("#nombre"), 3))
    {
        b = false;
        msg  = msg + "El nombre debe tener 3 o mas caracteres.\n\n";
    }
    if(!validarLongitud($("#telefono"),9) && !validarRango($("#telefono"), 0, 999999999))
        {
            b = false;
            msg  = msg + "Introduzca un numero de telefono valido.\n\n";
        }
    if(!validarLongitud($("#calle"), 5) && !$("#calle").val().lastIndexOf(",", 0) > 3)
        {
            b = false;
            msg  = msg + "Introduzca una direccion con el formato 'Calle, numero.\n\n";
        }
    if(!validarLongitud($("#localidad"), 3))
    {
        b = false;
        msg  = msg + "El nombre de la localidad debe tener 3 o mas caracteres.\n\n";
    }
     if(!validarLongitud($("#provincia"), 3))
    {
        b = false;
        msg  = msg + "El nombre de la provincia debe tener 3 o mas caracteres.\n\n";
    }
    if(!validarLongitud($("#cp"), 5) && !validarRango($("#cp"), 1, 99999))
        {
            b = false;
            msg  = msg + "El codigo postal debe tener 5 digitos.\n\n";
        }

    if(msg.length > 0)
    {
        alert(msg);
    }

    return b;
};





///////////////////////////////////
// Botones
var botones = function()
{
    //$(".seccion").hide();
    $(".activar").not("#cabecera li").mouseover
    (
        function(){
            activar(this);
        }
    );
    //$(".activar").not(".imgCabecera").mouseout
    $(".activar").not("#cabecera li").mouseout
    (
        function(){
            desactivar(this);
        }
    );

    
    /*$(".imgCabecera").mouseover
    (
        function(){
            desactivar(this);
        }
    );
    $(".imgCabecera").mouseout
    (
        function(){
            activar(this);
        }
    );*/

    $(".activar").click
    (
        function(){
        	var cadena = this.id;
        	if(cadena.indexOf("page") != -1 && cadena.indexOf("page=") == -1){
        		cadena = cadena.replace("page","page=");
        	}else{
        		cadena = this.name;
        	}
            window.location = "controlador?" + cadena;
        }
    );

    $(".cover").click
    (
        function(){
            window.location = "controlador?page=articulo&codigo=" + this.name;
        }
    );
        
    

};

$(document).ready(function(){
    botones();
    /*if($("#catalogo").length){
    	$("#catalogo").jPaginate();
     }*/
});


/////////////////////////////////////////////////
// Activar / desactivar botones
activar = function(a)
{
   a.src = a.src.replace('.png','W.png');
};

desactivar = function(a)
{
   a.src = a.src.replace('W.png','.png');
};
////////////////////////////////////////////////


////////////////////////////////////////////////
// Confirmar compra

var confirmarCompra = function()
{
    //return window.confirm("Asegúrese de que su cesta es correcta y confirme que quiere realizar el pago de " + $("#total").html().split(" ", 2)[1]);
    return window.confirm("Asegúrese de que su cesta es correcta y confirme que quiere realizar el pago de " + $("#pTotal").html());
};