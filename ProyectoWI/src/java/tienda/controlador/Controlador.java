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
import tienda.modelo.Comentarios;
import tienda.modelo.Paquete3x2;
import tienda.modelo.ShoppingCart;
import tienda.modelo.Usuario;
import tienda.procesado.RecommendationHelper;

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
            dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            
            session = request.getSession(true);
            
            usuario = (Usuario) session.getAttribute("usuario");
            cart = (ShoppingCart) session.getAttribute("cart");
            if (cart == null) {
                cart = new ShoppingCart();
            }
            session.setAttribute("usuario", usuario);
            if(usuario != null && usuario.getIdTipoUsuario() == 3){
                cart.setDescuento(20);
            }
            session.setAttribute("cart", cart);

            page = request.getParameter("page");
            action = request.getParameter("action");
            codigo = request.getParameter("codigo");

            th = new TiendaHelper(session);

            if ("salir".equalsIgnoreCase(action)) {
                session.invalidate();
                usuario = null;

            } // Información de un articulo, con comentarios y valoraciones
            else  if ("articulo".equalsIgnoreCase(page) && codigo != null) {
                System.out.println("Articulo");
                dispatcher = getServletContext().getRequestDispatcher("/articulo.jsp");

                ArticuloHelper ah = new ArticuloHelper();
                Articulo articulo = ah.findArticuloById(codigo);
                session.setAttribute("articulo", articulo);
                request.setAttribute("valoracionGeneral", new ValoracionesDAO().obtenerValoracionGeneralArticulo(codigo));
                if (usuario != null) {
                    request.setAttribute("valoracionUsuario", new ValoracionesDAO().obtenerValoracionUsuarioArticulo(usuario.getIdUsuario(), codigo));
                }
                
                ComentariosDAO cd = new ComentariosDAO();
                ArrayList<Comentarios> comentarios = cd.findComentariosByCodigoArticulo(codigo);
                if (comentarios != null) {
                    request.setAttribute("comentarios", comentarios);
                }
                
                // Obtener dos artículos parecidos
                ArticuloDAO aDAO = new ArticuloDAO();
                List<Articulo> recomendaciones = aDAO.findArticulosByCluster(articulo.getCluster(), articulo.getCodigoArticulo(), 2, true, null);

                // TEST: Ver a consola cando se selecciona unha pelicula na tenda
//                Integer idUsuario = usuario.getIdUsuario();

//                System.out.println(" ===== Rec user based =====");
//                RecommendationHelper.getRecommendedUserBasedArticles(new Long(idUsuario), 5);
                // Este método tarda moitísimo
//                System.out.println(" ===== Rec item based =====");
//                RecommendationHelper.getRecommendedItemBasedArticles(new Long(idUsuario), 5);
//                System.out.println(" ===== Similares =====");
//                RecommendationHelper.getSimilarArticles(new Long(articulo.getPelicula().getId()), 2);


                session.setAttribute("recomendaciones", RecommendationHelper.getSimilarArticles(new Long(articulo.getIdPelicula()), 2));
                
                if ("valorar".equalsIgnoreCase(action)) {
                    ValoracionesDAO vd = new ValoracionesDAO();
                    vd.insertar(usuario.getIdUsuario(), codigo, Integer.parseInt(request.getParameter("valoracion")));
                } 
                else if ("comentar".equalsIgnoreCase(action) && request.getParameter("comentario") != null) {
                    Comentarios c = new Comentarios();
                    c.setCodigoArticulo(articulo.getCodigoArticulo());
                    c.setComentario(request.getParameter("comentario"));
                    c.setIdUsuario(usuario.getIdUsuario());
                    c.setNombreUsuario(usuario.getNombre());
                    cd.insertarComentario(c);
                }
                else if ("oferta3x2".equalsIgnoreCase(action)){
                    ArrayList<Articulo> articulos = (ArrayList<Articulo>)session.getAttribute("recomendaciones");
                    articulos.add((Articulo)session.getAttribute("articulo"));
                    Paquete3x2 pack = new Paquete3x2(articulos);
                    if(!cart.upPaquete(pack)){
                        System.out.println("oferta3x2: falta stock");
                        request.setAttribute("mensaje", "No se han podido añadir los artículos por falta de stock");
                    }else{
                        session.setAttribute("cart", cart);
                        request.setAttribute("mensaje", "Se ha añadido el pack 3x2 al carrito.");
                    }
                }else if ("up".equalsIgnoreCase(action)){
                    Articulo a = (Articulo) session.getAttribute("articulo");
                    if (!cart.up(a)) {
                        request.setAttribute("mensaje", "No se pueden añadir más unidades de este producto por falta de stock.");
                    }else{
                        request.setAttribute("mensaje", "Se ha añadido el articulo al carrito");
                        session.setAttribute("cart", cart);
                    }
                    return;
                }
                
            } // Identigicación de usuario
            else if ("usuario".equalsIgnoreCase(page)) {
                System.out.println("Usuario");
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
                            if (usuario.getIdTipoUsuario() == 3) {
                                cart.setDescuento(20);
                                session.setAttribute("cart", cart);
                            }
                            dispatcher = getServletContext().getRequestDispatcher("/usuario.jsp?action=ver");
                        }
                    } else {
                        request.setAttribute("mensaje", "El usuario que ha introducido no existe.");
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
            else if ("tienda".equalsIgnoreCase(page) || "busca".equalsIgnoreCase(page)) {
                if("busca".equalsIgnoreCase(page)){
                    ArticuloHelper ah = new ArticuloHelper();
                    catalogo = ah.filtrar(session, request);
                }else{
                    catalogo = th.obtenerArticulos();
                }
                if(usuario!=null){
                    session.setAttribute("recomendaciones", RecommendationHelper.getRecommendedUserBasedArticles(new Long(usuario.getIdUsuario()), 5));
                }
                session.setAttribute("catalogo", catalogo);
                dispatcher = getServletContext().getRequestDispatcher("/tienda.jsp");
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
                        request.setAttribute("mensaje", "Compra realizada con éxito");
                        cart.vaciar();
                        session.setAttribute("cart", cart);
                    } else {
                        request.setAttribute("mensaje", "La compra no se puede realizar porque no hay stock de alguno de los artículos");
                    }
                }
                if (!catalogo.isEmpty()) {
                    if (codigo != null) {
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
                        } else if ("upPack".equalsIgnoreCase(action)) {
                            if(cart.upPaquete(codigo)){
                                session.setAttribute("cart", cart);
                            }else{
                                request.setAttribute("mensaje", "No se pueden añadir más unidades de este producto por falta de stock.");
                            }
                        } else if ("downPack".equalsIgnoreCase(action)) {
                            cart.downPaquete(codigo);
                            session.setAttribute("cart", cart);
                        }
                    }
                }
            }
            else if ("info".equalsIgnoreCase(page)) {
                System.out.println("Info");
                dispatcher = getServletContext().getRequestDispatcher("/info.jsp");
            }

        } catch (Exception e) {
             System.out.println("Controlador. Excepcion. " + e.getLocalizedMessage());
             e.printStackTrace();
            request.setAttribute("mensaje", "Ha sucedido un error");
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
