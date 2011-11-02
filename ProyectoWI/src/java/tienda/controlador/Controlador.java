/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.controlador;

import java.io.IOException;
import java.util.ArrayList;
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
import tienda.DAO.ArticuloDAO;
import tienda.DAO.ComentariosDAO;
import tienda.DAO.ValoracionesDAO;
import tienda.Helpers.ArticuloHelper;
import tienda.Helpers.TiendaHelper;
import tienda.Helpers.UsuarioHelper;
import tienda.modelo.Articulo;
import tienda.modelo.Direccion;
import tienda.modelo.Pedido;
import tienda.modelo.Comentarios;
import tienda.modelo.ShoppingCart;
import tienda.modelo.Usuario;

public class Controlador extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = -3365163277627326525L;
	HttpSession session;
	RequestDispatcher dispatcher;
	Usuario usuario;
	ShoppingCart cart;
	String page, action, codigo;
	TiendaHelper th;
	List<Articulo> catalogo;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JspException {
        try {
            dispatcher = null;
            // Seteo las variables de la sesión

            session = request.getSession(true);
            session.removeAttribute("comentario");
            usuario = (Usuario) session.getAttribute("usuario");
            cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
            }
            session.setAttribute("usuario", usuario);
            session.setAttribute("cart", cart);
            session.setAttribute("mensaje", null);

            page = request.getParameter("page");
            action = request.getParameter("action");
            codigo = request.getParameter("codigo");

            th = new TiendaHelper(session);
            catalogo = th.obtenerArticulos(usuario);

            dispatcher = getServletContext().getRequestDispatcher("/index.jsp");

            if ("salir".equalsIgnoreCase(action)) {
                session.invalidate();
                usuario = null;

            } else // Información de un articulo, con comentarios y valoraciones
            if ("articulo".equalsIgnoreCase(page) && codigo != null) {
                if ("valorar".equalsIgnoreCase(action)) {
                    ValoracionesDAO vd = new ValoracionesDAO();
                    vd.insertar(usuario.getIdUsuario(), codigo, Integer.parseInt(request.getParameter("valoracion")));
                }
                dispatcher = getServletContext().getRequestDispatcher("/articulo.jsp");
                Articulo articulo = null;
                ComentariosDAO cd = new ComentariosDAO();
                for (int i = 0; i < catalogo.size(); i++) {
                    if (codigo.equalsIgnoreCase(catalogo.get(i).getCodigoArticulo())) {
                        articulo = catalogo.get(i);
                        request.setAttribute("valoracionGeneral", new ValoracionesDAO().obtenerValoracionGeneralArticulo(codigo));
                        if (usuario != null) {
                            request.setAttribute("valoracionUsuario", new ValoracionesDAO().obtenerValoracionUsuarioArticulo(usuario.getIdUsuario(), codigo));
                        }
                        session.setAttribute("articulo", articulo);
                        break;
                    }
                }
                // Obtener dos artículos parecidos
                ArticuloDAO aDAO = new ArticuloDAO();
                List<Articulo> recomendaciones = aDAO.findArticulosByCluster(articulo.getCluster(), articulo.getCodigoArticulo(), 2, true, null);
                session.setAttribute("recomendaciones", recomendaciones);
                
                if ("comentar".equalsIgnoreCase(action) && request.getParameter("comentario") != null) {
                    Comentarios c = new Comentarios();
                    c.setCodigoArticulo(articulo.getCodigoArticulo());
                    c.setComentario(request.getParameter("comentario"));
                    c.setIdUsuario(usuario.getIdUsuario());
                    c.setNombreUsuario(usuario.getNombre());
                    cd.insertarComentario(c);
                }
                

                ArrayList<Comentarios> comentarios = cd.findComentariosByCodigoArticulo(codigo);
                if (comentarios != null) {
                    request.setAttribute("comentarios", comentarios);
                }
                if ("oferta3x2".equalsIgnoreCase(action)){
                    List<Articulo> articulos = (List<Articulo>)session.getAttribute("recomendaciones");
                    articulos.add((Articulo)session.getAttribute("articulo"));
                    float precio=articulos.get(0).getPrecio(); int indice=0;
                    for(int i=1; i<articulos.size(); i++){
                        if(articulos.get(i).getPrecio()<precio){
                            indice=i;
                            precio=articulos.get(i).getPrecio();
                        }
                    }
                    //El de menor precio sale gratis
                    //TODO: que se añadan los 3 o ninguno
                    articulos.get(indice).setPrecio(0);
                    String mensaje="";
                    for(int i=0; i<articulos.size(); i++){
                        if(!cart.up(articulos.get(i))){ //añadir al carrito
                            mensaje += "<br>El producto con código " + articulos.get(i).getCodigoArticulo() + " no se ha podido añadir al carrito por falta de stock.";
                        }
                    }
                    if(!mensaje.isEmpty())
                        request.setAttribute("mensaje", mensaje.substring(4));
                    session.setAttribute("cart", cart);
                    
                }
            } // Identigicación de usuario
            else if ("usuario".equalsIgnoreCase(page)) {
                UsuarioHelper uh = new UsuarioHelper();

                if (usuario != null) {
                    dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=ver");
                } else if (action == null || "identificacion".equalsIgnoreCase(action)) {
                    dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=logueo");
                } else if ("loguear".equalsIgnoreCase(action)) {
                    usuario = uh.loguear(request);
                    if (usuario != null) {
                        session.setAttribute("usuario", usuario);
                        if (usuario.getIdTipoUsuario() == 1) {
                            dispatcher = getServletContext().getRequestDispatcher("/administracion/controladorAdmin");
                        } else {
                            dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=ver");
                        }
                    } else {
                        session.setAttribute("mensaje", "El usuario que ha introducido no existe.");
                        dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=logueo");
                    }
                } else if ("registro".equalsIgnoreCase(action)) {
                    dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=registro");
                } else if ("registrar".equalsIgnoreCase(action)) {
                    usuario = uh.generarUsuario(request);
                    if (usuario != null) {
                        if (uh.registrar(usuario)) {
                            session.setAttribute("usuario", usuario);
                            dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=ver");
                        } else {
                            request.setAttribute("mensaje", "Se ha producido un error en el registro.");
                            dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=registro");
                        }
                    } else {
                        request.setAttribute("mensaje", "Ya existe un usuario registrado con este email.");
                        dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=registro");
                    }
                } else if ("salir".equalsIgnoreCase(action)) {
                    session.setAttribute("usuario", null);
                    dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=logueo");
                } else {
                    dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=logueo");
                }
            }
            if (("tienda".equalsIgnoreCase(page)) || ("busca".equalsIgnoreCase(page))) {
                if ("pagar".equalsIgnoreCase(action)) {
                    //TiendaHelper th = new TiendaHelper(session);
                    Direccion d = new Direccion();
                    d.setDireccion(request.getParameter("calle"));
                    d.setLocalidad(request.getParameter("localidad"));
                    d.setProvincia(request.getParameter("provincia"));
                    d.setCp(request.getParameter("cp"));

                    Boolean correcto = th.pagar(d);
                    session.setAttribute("usuario", usuario);
                    if (correcto) {
                        session.setAttribute("comentario", "Compra realizada con éxito");
                        session.setAttribute("cart", new ShoppingCart());
                    } else {
                        session.setAttribute("comentario", "La compra no se puede realizar porque no hay stock de alguno de los artículos");
                    }
                }
                if (catalogo.isEmpty()) {
                    dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                } else {
                    dispatcher = getServletContext().getRequestDispatcher("/tienda.jsp");
                    session.setAttribute("catalogo", catalogo);
                    if ("pagar".equalsIgnoreCase(action)) {
                        Direccion d = new Direccion();
                        d.setDireccion(request.getParameter("calle"));
                        d.setLocalidad(request.getParameter("localidad"));
                        d.setProvincia(request.getParameter("provincia"));
                        d.setCp(request.getParameter("cp"));
                    }
                    if (codigo != null) {
                        Pedido dp = new Pedido();
                        dp.getArticulo().setCodigoArticulo(codigo);
                        if ("up".equalsIgnoreCase(action)) {
                            for (int i = 0; i < catalogo.size(); i++) {
                                if (catalogo.get(i).getCodigoArticulo().equalsIgnoreCase(codigo)) {
                                    if (!cart.up(catalogo.get(i))) {
                                        request.setAttribute("mensaje", "No se pueden añadir más unidades de este producto por falta de stock.");
                                    }
                                    session.setAttribute("cart", cart);
                                    break;
                                }
                            }
                        } else if ("down".equalsIgnoreCase(action)) {
                            for (int i = 0; i < catalogo.size(); i++) {
                                if (catalogo.get(i).getCodigoArticulo().equalsIgnoreCase(codigo)) {
                                    cart.down(catalogo.get(i));
                                    session.setAttribute("cart", cart);
                                    break;
                                }
                            }

                        }
                    }
                }
            }
            if ("busca".equalsIgnoreCase(page)) {
                ArticuloHelper ah = new ArticuloHelper();
                catalogo = ah.filtrar(session, request);
                session.setAttribute("catalogo", catalogo);
                dispatcher = getServletContext().getRequestDispatcher("/tienda.jsp");
            }
            if ("info".equalsIgnoreCase(page)) {
                dispatcher = getServletContext().getRequestDispatcher("/info.jsp");
            }

        } catch (Exception e) {
            dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        } finally {
            dispatcher.forward(request, response);
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
