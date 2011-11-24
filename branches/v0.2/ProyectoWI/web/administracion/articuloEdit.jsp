<%-- 
    Document   : editUsuario
    Created on : 28-mar-2011, 21:14:27
    Author     : Vanesa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/smoothness/jquery-ui-1.8.16.custom.css" >
        <link rel="stylesheet" type="text/css" href="../css/administracion/administracion.css" media="screen">
        <script type="application/x-javascript" src="../script/administracion/editarArticulo.js"></script>
        <script type="text/javascript" src="../script/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="../script/jquery-ui-1.8.16.custom.min.js"></script>
        <title>Administracion: Editar Artículo</title>
    </head>
    <body>
        <div id="titulo">Administración: Articulos</div>
        <%@ include file="menu.jsp"%>
        <h2>Administración: Editar Articulo</h2>
        <div id="lista">
            <div class="centrar" id="edit">
                <form method="post" action="#" name="formulario">
                    <input type="hidden" name="pagina" value="${pagina}"/>
                    <h3>Artículo</h3>
                    <table>
                        <c:choose>
                            <c:when test="${acc=='modificar'}">
                                <input type="hidden" name="idArticulo" value="${articulo.codigoArticulo}"/>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td class="resaltarCelda cab">Código de artículo:</td>
                                    <td><input type="text" name="codigo" value="">*</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <td class="resaltarCelda cab">Precio:</td>
                            <td><input type="text" name="precio" value="${articulo.precio}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Unidades:</td>
                            <td><input type="text" name="unidades" value="${articulo.unidades}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Activo:</td>
                            <td>
                                <c:choose>
                                    <c:when test="${articulo.activo==true}">
                                        <input type="checkbox" name="activo" checked>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="activo" >
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                    <h3>Pelicula</h3>
                    <table>
                        <c:if test="${acc=='modificar'}">
                            <tr>
                                <td class="resaltarCelda cab"><label for="id">Identificador:</td>
                                <td><input type="text" id="txtIdPelicula" name="idPelicula" value="${articulo.pelicula.id}" disabled></td>
                            </tr>
                        </c:if>
                        <tr>
                            <td class="resaltarCelda cab"><label for="titulo">Título:</label></td>
                            <td><input id="txtTitulo" type="text" name="titulo" value="${articulo.pelicula.titulo}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab"><label for="anho">Año:</label></td>
                            <td><input type="text" name="anho" value="${articulo.pelicula.anho}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab"><label for="imagen">Imagen:</label></td>
                            <td><textarea id="txtCover" rows="2"><c:out value="${articulo.pelicula.imagen}"></c:out></textarea></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Directores:</td>
                            <td>
                                <ul class="cntElementos" id="ul-director">
                                    <c:if test="${not empty articulo.pelicula.directores}">
                                        <c:forEach items="${articulo.pelicula.directores}" var="director">
                                            <li id="cnt-director-${director.id}">
                                                <span><c:out value="${director.nombre}"></c:out></span>
                                                <a href="javascript:eliminar('director','${director.id}')" title="Eliminar">x</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <!--<li class="btnNuevo"><a title="Nuevo" href="javascript:void()" id="nuevoDirector" >+</a></li>-->
                                </ul>
                                <div class="formNuevo">
                                    <input class="autocompletar" id="txt_nuevo_director" type="text">
                                    <input class="enlace" type="button" onclick="anhadir('director')" value="Añadir" />
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Actores:</td>
                            <td>
                                <ul class="cntElementos" id="ul-actor">
                                    <c:if test="${not empty articulo.pelicula.actores}">
                                        <c:forEach items="${articulo.pelicula.actores}" var="actor">
                                            <li id="cnt-actor-${actor.id}">
                                                <span><c:out value="${actor.nombre}"></c:out></span>
                                                <a href="javascript:eliminar('actor','${actor.id}')" title="Eliminar">x</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <!--<li class="btnNuevo"><a title="Nuevo" href="javascript:void()" id="nuevoActor" >+</a></li>-->
                                </ul>
                                <div class="formNuevo">
                                    <input class="autocompletar" id="txt_nuevo_actor" type="text">
                                    <input class="enlace" type="button" onclick="anhadir('actor')" value="Añadir" />
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Género:</td>
                            <td>
                                <ul class="cntElementos" id="ul-genero">
                                    <c:if test="${not empty articulo.pelicula.generos}">
                                        <c:forEach items="${articulo.pelicula.generos}" var="genero">
                                            <li id="cnt-genero-${genero}">
                                                <span><c:out value="${genero}"></c:out></span>
                                                <a href="javascript:eliminar('genero','${genero}');" title="Eliminar">x</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <!--<li class="btnNuevo"><a title="Nuevo" href="javascript:void()" id="nuevoGenero" >+</a></li>-->
                                </ul>
                                <div class="formNuevo">
                                    <input class="autocompletar" id="txt_nuevo_genero" type="text" />
                                    <input class="enlace" type="button" onclick="anhadir('genero')" value="Añadir" />
                                </div>
                            </td> 
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Paises:</td>
                            <td>
                                <ul class="cntElementos" id="ul-pais">
                                    <c:if test="${not empty articulo.pelicula.paises}">
                                        <c:forEach items="${articulo.pelicula.paises}" var="pais">
                                            <li id="cnt-pais-${pais}">
                                                <span><c:out value="${pais}"></c:out></span>
                                                <a href="javascript:eliminar('pais','${pais}');" title="Eliminar">x</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <!--<li class="btnNuevo"><a title="Nuevo" href="javascript:void()" id="nuevoPais" >+</a></li>-->
                                </ul>
                                <div class="formNuevo">
                                    <input class="autocompletar" id="txt_nuevo_pais" type="text" />
                                    <input class="enlace" type="button" onclick="anhadir('pais');" value="Añadir" />
                                </div>
                            </td> 
                        </tr>
                    </table>
                    <div id="cntButons">
                        <input type="reset" value="Reiniciar" />
                        <input type="button" value="Cancelar" name="cancelar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                        <c:choose>
                            <c:when test="${acc=='modificar'}">
                                <input type="button" value="Modificar" name="modificar" onclick="ejecutarAccionGate(this,<c:out value='${pagina}'/>)">
                            </c:when>
                            <c:otherwise>
                                <input type="button" value="Insertar" name="insertar" onclick="ejecutarAccionGate(this,<c:out value='${pagina}'/>)">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <p class="footer">* Los campos marcados con asterisco son obligatorios.</p>
                    <div id="selectsOcultos" style="display:none;">
                        <select multiple name="actoresBorrados" id="actoresBorrados"></select>
                        <select multiple name="actoresCreados" id="actoresCreados"></select>
                        <select multiple name="actoresAnhadidos" id="actoresAnhadidos"></select>
                        <select multiple name="directoresBorrados" id="directoresBorrados"></select>
                        <select multiple name="directoresCreados" id="directoresCreados"></select>
                        <select multiple name="directoresAnhadidos" id="directoresAnhadidos"></select>
                        <select multiple name="generosBorrados" id="generosBorrados"></select>
                        <select multiple name="generosAnhadidos" id="generosAnhadidos"></select>
                        <select multiple name="paisesBorrados" id="paisesBorrados"></select>
                        <select multiple name="paisesAnhadidos" id="paisesAnhadidos"></select>
                    </div>
                    
                </form>
            </div>
        </div>
    </body>
    
    <script>
        var hash=${directoresHash};
        $.extend(hash, ${actoresHash});

        
        $(function() {
            var directores=${directores};
            var actores=${actores};
            var generos=${generos};
            var paises=${paises};
            
            $("#txt_nuevo_director").autocomplete({source: directores});
            $("#txt_nuevo_actor").autocomplete({source: actores});
            $("#txt_nuevo_genero").autocomplete({source: generos});
            $("#txt_nuevo_pais").autocomplete({source: paises});
            
            $(".formNuevo input:first-child").keypress(function(e){
                var code = (e.keyCode ? e.keyCode : e.which);
                 if(code == 13) { //Enter keycode
                     $(this).parent().find("input:nth-child(2)").css("border-color","red").click();
                 }
            });
        });
        
        
        
        function eliminar(tipo, id){
            var $cnt=$("#cnt-" + tipo + "-" + id);
            if($cnt.hasClass("nuevo") || $cnt.hasClass("creado")){
                $("#cnt-" + tipo + "-" + id).remove();
            }else{
                $("#cnt-" + tipo + "-" + id).addClass("eliminado");
            }
        }
        
        function anhadir(tipo){
            var nuevoNombre = $("#txt_nuevo_" + tipo).val();
            var existente = true;
            if(nuevoNombre == ""){
                alert("No se ha introducido el nombre para el " + tipo);
                return;
            }
            var nuevoId = nuevoNombre;
            if(tipo == "director" || tipo == "actor"){
                //Comprobamos si ya existía
                var nombreaux = hash[nuevoNombre];
                if(nombreaux == undefined){
                    nuevoId = nuevoNombre.replace(" ", "_").toLowerCase();
                    existente = false;
                }else{
                    nuevoId = nombreaux;
                }
            }
            
            $("#txt_nuevo_" + tipo).val("");
            
            //Comprobar si existe ya el elemento
            var $cnt=$("#cnt-" + tipo + "-" + nuevoId)
            if($cnt.length){
                if($cnt.hasClass("eliminar")){
                    $cnt.removeClass("eliminar");
                }else{
                    alert("El elemento ya existe");
                }
                return;
            }
            
            var codigo = "<li class='" + (existente? "nuevo" : "creado" ) 
                + "' id='cnt-" + tipo + "-" + nuevoId + "'><span>" + nuevoNombre 
                + "</span><a href='javascript:eliminar(\"" + tipo + "\",\"" + nuevoId
                + "\")' title='Eliminar'>x</a>";
            //alert("codigo: " + codigo);
            $("#ul-" + tipo).append(codigo);
        }
        
        function ejecutarAccionGate(boton, pagina){
            //Preparamos selects
            for each (var tipo in ["actor","director"]) {
                //Añadidos
                $("#ul-" + tipo + " li.nuevo").each(function(){
                    var id=$(this).find("span").text().replace("cnt-" + tipo + "-","");
                    $("#" + tipo + "esAnhadidos").append("<option selected>"+ id +"</option>");
                });
                //Creados
                $("#ul-" + tipo + " li.creado").each(function(){
                    $("#" + tipo + "esCreados").append("<option selected>"+ $(this).find("span").text() +"</option>");
                });
                //Borrados
                $("#ul-" + tipo + " li.eliminado").each(function(){
                    $this=$(this);
                    var id=$this.attr("id").replace("cnt-" + tipo + "-","");
                    $("#" + tipo + "esBorrados").append("<option value='" + id + "' selected>"+ $this.find("span").text() +"</option>");
                });
            }
            //Generos
            $("#ul-genero li.nuevo").each(function(){
                $("#generosAnhadidos").append("<option selected>"+ $(this).find("span").text()+"</option>");
            });
            
            $("#ul-genero li.eliminado").each(function(){
                $("#generosBorrados").append("<option selected>"+ $(this).find("span").text()+"</option>");
            });
            //Paises
            $("#ul-pais li.nuevo").each(function(){
                $("#paisesAnhadidos").append("<option selected>"+ $(this).find("span").text()+"</option>");
            });
            
            $("#ul-pais li.eliminado").each(function(){
                $("#paisesBorrados").append("<option selected>"+ $(this).find("span").text()+"</option>");
            });

            //ejecutarAccion(boton, pagina);
        }
      
      
    </script>
</html>
