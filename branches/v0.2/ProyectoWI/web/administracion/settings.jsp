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
        <title>Administracion: Configuración</title>
    </head>
    <body>
        <div id="titulo">Administración: Configuración</div>
        <%@ include file="menu.jsp"%>
<div id="comentario"><span><c:out value="${comentario}"/></span></div>
<h2>Administración: Configuración </h2>
        <div class="lista">
            <div class="centrar" id="edit">
                <div id="comentario"><span><c:out value=""/></span></div>
                <form method="post" name="formulario" action="controladorAdmin?action=updateSettings">
                    <table>
                        <tr>
                            <td class="resaltarCelda cab">Recomendación :</td>
                            <td>
                                <select name="recommendationStrategy">
                                    <option value="0" <c:out value="${settings.recommendationStrategy==0?'selected':''}"/>>Item based</option>
                                    <option value="1" <c:out value="${settings.recommendationStrategy==1?'selected':''}"/>>User based</option>
                                </select> *
                            </td>
                        </tr>

                        <tr>
                            <td class="resaltarCelda cab">Algoritmo de clustering :</td>
                            <td>
                                <select name="clusteringStrategy">
                                    <option value="0" <c:out value="${settings.clusteringStrategy==0?'selected':''}"/>>K-Means</option>
                                    <option value="1" <c:out value="${settings.clusteringStrategy==1?'selected':''}"/>>Density</option>
                                </select> *
                            </td>
                        </tr>
                    </table>
                    <p class="footer">* Los campos marcados con asterisco son obligatorios.</p>
                                        <div id="cntButons">
                                            <input type="submit" value="Guardar">
                                        </div>
                </form>
            </div>
        </div>
    </body>
</html>
