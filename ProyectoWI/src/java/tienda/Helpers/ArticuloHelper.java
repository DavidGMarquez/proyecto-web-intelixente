/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import tienda.DAO.ArticuloDAO;
import tienda.DAO.PeliculasDAO;
import tienda.modelo.ActorDirector;
import tienda.modelo.Articulo;
import tienda.modelo.Pelicula;

/**
 *
 * @author Vanesa
 */
public class ArticuloHelper extends AbstractHelper {

    ArticuloDAO aDAO = new ArticuloDAO();
    PeliculasDAO pDAO = new PeliculasDAO();

    public List<Articulo> findArticulos() {
        return aDAO.findArticulos(false,"");
    }

    public HttpSession listaArticulos(HttpSession session, HttpServletRequest request) {
        List<Articulo> l = aDAO.findArticulos(false,"");
        session.setAttribute("Articulos", l);

        //Calculos para la paginaci�n
        Integer paginas = l.size() / registros;
        if (l.size() % registros > 0) {
            paginas = paginas + 1;
        }

        String pagina = request.getParameter("pagina");
        if (pagina == null) {
            pagina = "1";
        }
        session.setAttribute("articulos", l);
        session.setAttribute("paginas", paginas);
        session.setAttribute("pagina", pagina);
        session.setAttribute("registros", registros);
        return session;
    }

    public boolean activarArticulo(String idArticulo, Boolean activar) {
        return aDAO.activarArticulo(idArticulo, activar);
    }

    public Articulo findArticuloById(String idArticulo) {
        Articulo u;
        u = aDAO.findArticuloById(idArticulo);
        return u;
    }

    public HttpSession modificarArticulo(HttpSession session, HttpServletRequest request, String codigoArticulo) {
        try {
            Boolean activo = !(request.getParameter("activo") == null 
            		|| request.getParameter("activo").equalsIgnoreCase("false"));
            Integer ud = Integer.parseInt(request.getParameter("unidades"));
            Float precio = Float.parseFloat(request.getParameter("precio"));
            Articulo a = new Articulo(codigoArticulo,
                    precio,
                    activo,
                    ud);

            aDAO.modificarArticulo(a);
            
            //Pelicula
            Integer idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            String titulo = request.getParameter("titulo");
            Integer anho = Integer.parseInt(request.getParameter("anho"));
            String imagen = request.getParameter("imagen");
            Pelicula p = new Pelicula(idPelicula,titulo, anho, imagen);
            p.setPaises(new ArrayList<String>(Arrays.asList(request.getParameterValues("paises"))));
            p.setGeneros(new ArrayList<String>(Arrays.asList(request.getParameterValues("generos"))));
            String[] actores= request.getParameterValues("actores");
            if(actores != null){
                for(int i=0; i<actores.length; i++){
                    p.getActores().add(new ActorDirector(actores[i]));
                }
            }
            String[] directores= request.getParameterValues("directores");
            if(directores != null){
                for(int i=0; i<directores.length; i++){
                    p.getDirectores().add(new ActorDirector(directores[i]));
                }
            }
            pDAO.modificarPelicula(p);
            
            return session;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Integer insertarArticulo(HttpServletRequest request) {
        try {
            Boolean activo = !(request.getParameter("activo") == null 
            		|| request.getParameter("activo").equalsIgnoreCase("false"));
            Integer ud = Integer.parseInt(request.getParameter("unidades"));
            Float precio = Float.parseFloat(request.getParameter("precio"));
            Articulo a = new Articulo(request.getParameter("codigo"),
                    precio, activo, ud);
            Integer result = -1;
            Boolean exite = aDAO.existeArticulo(a);
            if (exite == null) {
                return null;
            } else if (!exite) {
                String titulo = request.getParameter("titulo");
                Integer anho = Integer.parseInt(request.getParameter("anho"));
                String imagen = request.getParameter("imagen");
                Pelicula p = new Pelicula(titulo, anho, imagen);
                p.setPaises(new ArrayList<String>(Arrays.asList(request.getParameterValues("paises"))));
                p.setGeneros(new ArrayList<String>(Arrays.asList(request.getParameterValues("generos"))));
                String[] actores= request.getParameterValues("actores");
                if(actores != null){
                    for(int i=0; i<actores.length; i++){
                        p.getActores().add(new ActorDirector(actores[i]));
                    }
                }
                String[] directores= request.getParameterValues("directores");
                if(directores != null){
                    for(int i=0; i<directores.length; i++){
                        p.getDirectores().add(new ActorDirector(directores[i]));
                    }
                }
                int movieId = pDAO.insertarPelicula(p);
                if(movieId == -1) return -3;
                p.setId(movieId);
                a.setPelicula(p);
                Boolean result1 = aDAO.insertarArticulo(a);
                if (result1 == null) {
                    return null;
                } else if (result1) {
                    result = 1;
                } else {
                    result = -2;
                }
            }
            return result;

        } catch (Exception e) {
            return null;
        }
    }

    public boolean borrarArticulo(String codigoArticulo) {
        return aDAO.borrarArticulo(codigoArticulo);
    }

    public List<Articulo> filtrar(HttpSession session, HttpServletRequest request) {
    	String anho = request.getParameter("anho");
        String titulo = request.getParameter("titulo");
        Float precioMaximo=null;
        try{
            precioMaximo=Float.parseFloat(request.getParameter("precioMaximo"));
        }catch(Exception e){
            Logger.getLogger(ArticuloHelper.class.getName()).log(Level.ALL, "Error parseando precio",e);
        }
        Integer tipo = null;
        if(request.getParameter("tipo")!=null &&  !request.getParameter("tipo").isEmpty()){
            tipo = new Integer(request.getParameter("tipo"));
        }
        session.setAttribute("anho", anho);
        session.setAttribute("titulo", titulo);
        session.setAttribute("precioMaximo", precioMaximo);
        return aDAO.findArticulosFiltrados(anho, precioMaximo, titulo, tipo);
    }
}
