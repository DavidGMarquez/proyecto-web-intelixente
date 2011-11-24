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
        <link href="../css/administracion/administracion.css" media="screen" rel="stylesheet" type="text/css">
        <script type="application/x-javascript" src="../script/administracion/editarUsuario.js"></script>
        <title>Administracion: Editar Usuario</title>
    </head>
    <body>
        <div id="titulo">Administración: Usuarios</div>
        <%@ include file="menu.jsp"%>
        
        <h2>Administración: Editar Usuario <c:out value="${usuarioE.nombre}"/></h2>
        <div id="lista">

            <div id="centrar">
                <div id="comentario"><span><c:out value="${comentario}"/></span></div>
                <form method="post" name="formulario" action="controladorAdmin?action=modificarUsuario">
                    <input type="hidden" name="idUsuario" value="${usuarioE.idUsuario}"/>
                    <input type="hidden" name="idDireccion" value="${usuarioE.direccion.idDireccion}"/>
                    <input type="hidden" name="pagina" value="${pagina}"/>
                    <table id="edit">
                        <tr >

                            <td class="resaltarCelda cab">Nombre:</td>
                            <td><input class="size" type="text" name="nombre" value="${usuarioE.nombre}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Activo:</td>
                            <td >
                                <c:choose>
                                    <c:when test="${usuarioE.activo==false}">
                                        <input type="checkbox" name="activo" >
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="activo" checked>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Email:</td>
                            <td><input class="size" type="text" name="email" value="${usuarioE.email}">*</td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Pass:</td>
                            <td><input class="enlace" type="button" name="pass" value="Cambiar contraseña" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>,<c:out value='${usuarioE.idUsuario}'/>)"/></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Telefono:</td>
                            <td><input type="text" name="telefono" value="${usuarioE.telefono}"></td>
                        </tr>

                        <tr>
                            <td class="resaltarCelda cab">Compra total:</td>
                            <td><input class="size" type="text" name="totalCompra" value="${usuarioE.totalCompra}"></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Tipo Usuario:</td>
                            <td>
                                <select name="idTipoUsuario">
                                    <c:forEach items="${tipos}" var="tipo">
                                           
                                        <c:choose>
                                            <c:when test="${tipo.idTipoUsuario==usuarioE.idTipoUsuario}">
                                                <option value="${tipo.idTipoUsuario}" selected><c:out value="${tipo.tipoUsuario}"/></option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${tipo.idTipoUsuario}"><c:out value="${tipo.tipoUsuario}"/></option>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="resaltarCelda cab">Direccion:</td>
                            <td><input class="size" type="text" name="direccion" value="${usuarioE.direccion.direccion}"></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Localidad:</td>
                            <td><input class="size" type="text" name="localidad" value="${usuarioE.direccion.localidad}"></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">Provincia:</td>
                            <td><input class="size" type="text" name="provincia" value="${usuarioE.direccion.provincia}"></td>
                        </tr>
                        <tr>
                            <td class="resaltarCelda cab">CP:</td>
                            <td><input type="text" name="cp" value="${usuarioE.direccion.cp}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="button" value="Cancelar" name="cancelar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                                <input type="button" value="Guardar" name="guardar" onclick="ejecutarAccion(this,<c:out value='${pagina}'/>)">
                            </td>
                        </tr>
                    </table>
                    * Los campos marcados con asterisco son obligatorios.
                </form>
            </div>
        </div>
    </body>
</html>
