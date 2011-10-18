/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.controlador;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import tienda.Helpers.ArticuloHelper;
import tienda.Helpers.UsuarioHelper;
import tienda.modelo.Articulo;
import tienda.modelo.TipoUsuario;
import tienda.modelo.Usuario;

/**
 *
 * @author Vanesa
 */
public class ControladorAdmin extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 2518690699012436113L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JspException {
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession(false);
        if (session == null) {
            //Si no hay sesión, envío a la página de autentificación
            response.sendRedirect("noAutenticado.html");
        } else {
            Usuario usu = (Usuario)session.getAttribute("usuario");
            if(usu==null || usu.getIdTipoUsuario()!=1)
                response.sendRedirect("noAutenticado.html");
            else{
            try {
                session.setAttribute("usuario", usu);
                String action = request.getParameter("action");
                //Obtento el idUsuario
                String idUsuarioS = request.getParameter("idUsuario");
                Integer idUsuario = null;
                if (idUsuarioS != null) {
                    idUsuario = Integer.parseInt(idUsuarioS.trim());
                }

                //Obtengo el idArticulo
                String idArticulo = request.getParameter("idArticulo");

                //Obtento el número de página
                String paginaS = request.getParameter("pagina");
                Integer pagina = null;
                if (paginaS == null) {
                    pagina = 1;
                } else {
                    pagina = Integer.parseInt(paginaS);
                }


                session.setAttribute("pagina", pagina);
                session.removeAttribute("comentario");

                if (action == null) {
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/index.jsp");
                    dispatcher.forward(request, response);
                } else if ("usuariosIndex".equalsIgnoreCase(action)) {
                    //UsuarioHelper uh = new UsuarioHelper();
                    //List<Usuario> lista = uh.findUsuarios();
                    //session.setAttribute("usuarios", lista);
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuariosIndex.jsp");

                } else if ("usuariosLista".equalsIgnoreCase(action)) {
                    UsuarioHelper uh = new UsuarioHelper();
                    session = uh.listaUsuarios(session, request);
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuariosLista.jsp");
                } else if ("activarUsuario".equalsIgnoreCase(action) && idUsuario != null) {
                    UsuarioHelper uh = new UsuarioHelper();
                    uh.activarUsuario(idUsuario, Boolean.TRUE);

                    List<Usuario> lista = uh.findUsuarios();
                    session.setAttribute("usuarios", lista);
                    session.setAttribute("comentario", "El usuario ha sido activado");
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuariosIndex.jsp");
                } else if ("desactivarUsuario".equalsIgnoreCase(action) && idUsuario != null) {
                    UsuarioHelper uh = new UsuarioHelper();
                    uh.activarUsuario(idUsuario, Boolean.FALSE);

                    List<Usuario> lista = uh.findUsuarios();
                    session.setAttribute("usuarios", lista);
                    session.setAttribute("comentario", "El usuario ha sido desactivado");
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuariosIndex.jsp");

                } else if ("editarUsuario".equalsIgnoreCase(action)) {
                    UsuarioHelper uh = new UsuarioHelper();
                    Usuario u = uh.findUsuarioById(idUsuario);
                    session.setAttribute("usuarioE", u);
                    List<TipoUsuario> tu = uh.findTiposUsuario();
                    session.setAttribute("tipos", tu);
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuarioEdit.jsp");
                } else if ("modificarUsuario".equalsIgnoreCase(action)) {
                    UsuarioHelper uh = new UsuarioHelper();

                    session = uh.modificarUsuario(session, request, idUsuario);
                    if (session != null) {
                        List<Usuario> lista = uh.findUsuarios();
                        session.setAttribute("usuarios", lista);
                        session.setAttribute("comentario", "El usuario ha sido modificado correctamente");
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/usuariosIndex.jsp");
                    } else {
                        tienda.Error e = new tienda.Error("Error al editar usuario", "Se ha producido un error al editar el usuario", "controladorAdmin?action=editarUsuario&idUsuario=" + idUsuario);
                        HttpSession session1 = request.getSession(true);
                        session1.setAttribute("error", e);
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/error.jsp");
                    }
                } else if ("borrarUsuario".equalsIgnoreCase(action)) {
                    UsuarioHelper uh = new UsuarioHelper();
                    boolean result = uh.borrarUsuario(idUsuario);
                    if (result) {
                        List<Usuario> lista = uh.findUsuarios();
                        session.setAttribute("usuarios", lista);
                        session.setAttribute("comentario", "El usuario ha sido borrado correctamente");
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/usuariosIndex.jsp");
                    } else {
                        tienda.Error e = new tienda.Error("Error al borrar usuario", "Se ha producido un error al borrar el usuario", "controladorAdmin?action=editarUsuario&idUsuario=" + idUsuario);
                        HttpSession session1 = request.getSession(true);
                        session1.setAttribute("error", e);
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/error.jsp");
                    }
                } else if ("cambiaPassFormUsuario".equalsIgnoreCase(action)) {
                    session.setAttribute("idUsuario", idUsuario);
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuarioCambioPass.jsp");
                } else if ("cambiaPassUsuario".equalsIgnoreCase(action)) {
                    UsuarioHelper uh = new UsuarioHelper();
                    boolean result = uh.cambiaPassUsuario(idUsuario, request.getParameter("pass"));
                    if (result) {
                        session.setAttribute("comentario", "Contraseña cambiada correctamente");
                    } else {
                        session.setAttribute("comentario", "La contraseña no se ha cambiado");
                    }
                    Usuario u = uh.findUsuarioById(idUsuario);
                    session.setAttribute("usuarioE", u);
                    List<TipoUsuario> tu = uh.findTiposUsuario();
                    session.setAttribute("tipos", tu);
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/usuarioEdit.jsp");

                } else if ("articulosIndex".equalsIgnoreCase(action)) {
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                } else if ("articulosLista".equalsIgnoreCase(action)) {
                    ArticuloHelper ah = new ArticuloHelper();
                    session = ah.listaArticulos(session, request);
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosLista.jsp");
                } else if ("activarArticulo".equalsIgnoreCase(action) && idArticulo != null) {
                    ArticuloHelper ah = new ArticuloHelper();
                    boolean result = ah.activarArticulo(idArticulo, Boolean.TRUE);
                    if (result) {
                        session.setAttribute("comentario", "El articulo ha sido activado");
                    } else {
                        session.setAttribute("comentario", "El articulo no se ha activado");
                    }
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                } else if ("desactivarArticulo".equalsIgnoreCase(action) && idArticulo != null) {
                    ArticuloHelper ah = new ArticuloHelper();
                    boolean result = ah.activarArticulo(idArticulo, Boolean.FALSE);
                    if (result) {
                        session.setAttribute("comentario", "El articulo ha sido desactivado");
                    } else {
                        session.setAttribute("comentario", "El articulo no se ha desactivado");
                    }
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                } else if ("borrarArticulo".equalsIgnoreCase(action) && idArticulo != null) {
                    ArticuloHelper ah = new ArticuloHelper();
                    boolean result = ah.borrarArticulo(idArticulo);
                    if (result) {
                        List<Articulo> lista = ah.findArticulos();
                        session.setAttribute("articulos", lista);
                        session.setAttribute("comentario", "El articulo ha sido borrado correctamente");
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                    } else {
                        tienda.Error e = new tienda.Error("Error al borrar articulo", "Se ha producido un error al borrar el articuloo", "controladorAdmin?action=articulosIndex&pagina=" + pagina);
                        HttpSession session1 = request.getSession(true);
                        session1.setAttribute("error", e);
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/error.jsp");
                    }
                } else if ("editarArticulo".equalsIgnoreCase(action)) {
                    ArticuloHelper ah = new ArticuloHelper();
                    Articulo a = ah.findArticuloById(idArticulo);
                    session.setAttribute("articulo", a);
                    session.setAttribute("acc", "1");
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/articuloEdit.jsp");
                } else if ("modificarArticulo".equalsIgnoreCase(action)) {
                    ArticuloHelper ah = new ArticuloHelper();
                    session = ah.modificarArticulo(session, request, idArticulo);
                    if (session != null) {
                        List<Articulo> lista = ah.findArticulos();
                        session.setAttribute("articulos", lista);
                        session.setAttribute("comentario", "El articulo ha sido modificado correctamente");
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                    } else {
                        tienda.Error e = new tienda.Error("Error al editar articulo", "Se ha producido un error al editar el articulo", "controladorAdmin?action=editarArticulo&idArticulo=" + idArticulo);
                        HttpSession session1 = request.getSession(true);
                        session1.setAttribute("error", e);
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/error.jsp");
                    }
                } else if ("insertarArticuloForm".equalsIgnoreCase(action)) {
                    session.setAttribute("acc", "2");
                    session.removeAttribute("articulo");
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/articuloEdit.jsp");
                } else if ("insertarArticulo".equalsIgnoreCase(action)) {
                    ArticuloHelper ah = new ArticuloHelper();
                    Integer result = ah.insertarArticulo(request);
                    if (result == 1) {
                        List<Articulo> lista = ah.findArticulos();
                        session.setAttribute("articulos", lista);
                        session.setAttribute("comentario", "El articulo ha sido insertado correctamente");
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                    } else if (result == -1) {
                        session.setAttribute("comentario", "El articulo ya existe en la base de datos.");
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/articulosIndex.jsp");
                    } else {
                        tienda.Error e = new tienda.Error("Error al insertar articulo", "Se ha producido un error al insertar el articulo", "controladorAdmin?action=articulosIndex");
                        session.setAttribute("error", e);
                        dispatcher = getServletContext().getRequestDispatcher("/administracion/error.jsp");
                    }
                } else {
                    dispatcher = getServletContext().getRequestDispatcher("/administracion/index.jsp");
                }

            } catch (Exception e) {
                dispatcher = getServletContext().getRequestDispatcher("/administracion/index.jsp");
            } finally {
                dispatcher.forward(request, response);
            }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JspException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JspException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
