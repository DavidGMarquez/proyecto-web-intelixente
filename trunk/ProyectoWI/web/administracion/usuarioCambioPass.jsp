<%-- 
    Document   : listUsuarios.jsp
    Created on : 26-mar-2011, 13:06:10
    Author     : Vanesa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/administracion/administracion.css" media="screen" rel="stylesheet" type="text/css">
        <script type="application/x-javascript" src="../script/administracion/editarUsuario.js"></script>
        <title>Administracion de discos</title>
    </head>
    <body>
        <div id="titulo">Administración: Discos</div>
        <%@ include file="menu.jsp"%>
         <div id="lista">

            <div id="centrar">
                <br/><br/>
                <form method="post" name="formulario" action="controladorAdmin?action=cambiaPassUsuario">
                    <input type="hidden" name="idUsuario" value="${idUsuario}"/>
                    <input type="hidden" name="pagina" value="${pagina}"/>
                    <table id="edit">
                        <tr>
                            <td class="resaltarCelda cab">Contraseña:</td>
                            <td><input class="size" type="text" name="pass" value="">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Repite contraseña:</td>
                            <td><input class="size" type="text" name="pass2" value="">*</td>
                        </tr>
                        <tr>
                        	<td></td>
                            <td>
                                <input type="button" value="Cancelar" name="cancelar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                                <input type="button" value="Guardar" name="cambiarPass" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                            </td>
                        </tr>
                    </table>
                    * Los campos marcados con asterisco son obligatorios.
                </form>
            </div>
         </div>
    </body>
</html>
