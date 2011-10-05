/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import tienda.DAO.ArticuloDAO;
import tienda.modelo.Articulo;

/**
 *
 * @author Vanesa
 */
public class ArticuloHelper {

    ArticuloDAO aDAO = new ArticuloDAO();

    public List<Articulo> findArticulos() {
        return aDAO.findArticulos(false,"");
    }

    public HttpSession listaArticulos(HttpSession session, HttpServletRequest request) {
        List<Articulo> l = aDAO.findArticulos(false,"");
        session.setAttribute("Articulos", l);

        //Calculos para la paginación
        Integer registros = 4;
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
            Integer ud;
            ud = Integer.parseInt(request.getParameter("unidades"));
            Float precio;
            precio = Float.parseFloat(request.getParameter("precio"));
            Integer anho;
            anho = Integer.parseInt(request.getParameter("anho"));
            Articulo a = new Articulo(codigoArticulo,
                    request.getParameter("grupo"),
                    request.getParameter("album"),
                    request.getParameter("pais"),
                    precio,
                    activo,
                    ud,
                    request.getParameter("imagen"),
                    anho);

            aDAO.modificarArticulo(a);
            return session;
        } catch (Exception e) {
            return null;
        }
    }

    public Integer insertarArticulo(HttpServletRequest request) {
        try {
            Boolean activo = !(request.getParameter("activo") == null 
            		|| request.getParameter("activo").equalsIgnoreCase("false"));
            Integer ud = Integer.parseInt(request.getParameter("unidades"));
            Float precio = Float.parseFloat(request.getParameter("precio"));
            Integer anho = Integer.parseInt(request.getParameter("anho"));
            Articulo a = new Articulo(request.getParameter("codigo"),
                    request.getParameter("grupo"),
                    request.getParameter("album"),
                    request.getParameter("pais"),
                    precio,
                    activo,
                    ud,
                    request.getParameter("imagen"),
                    anho);
            Integer result;
            Boolean exite = aDAO.existeArticulo(a);
            if (exite == null) {
                return null;
            } else if (exite) {
                result = -1;
            } else {
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

    public List<Articulo> filtrar(HttpSession session,HttpServletRequest request) {
    	//Boolean filtrarAnho = request.getParameter("filtrarAnho") == null;
        //Boolean filtrarPM = request.getParameter("filtrarPrecioMaximo") == null;
        //Boolean filtrarArtista = request.getParameter("filtrarArtista") == null;
        //Boolean filtrarTitulo = request.getParameter("filtrarTitulo") == null;
    	
    	String anho = request.getParameter("anho");
        String titulo = request.getParameter("titulo");
        String artista = request.getParameter("artista");
        Float precioMaximo=null;
        try{
        	precioMaximo=Float.parseFloat(request.getParameter("precioMaximo"));
        }catch(Exception e){
            //filtrarPM=false;
        }
        session.setAttribute("anho", anho);
        session.setAttribute("artista", artista);
        session.setAttribute("titulo", titulo);
        session.setAttribute("precioMaximo", precioMaximo);
        /*session.setAttribute("filtrarAnho", filtrarAnho);
        session.setAttribute("filtrarArtista", filtrarArtista);
        session.setAttribute("filtrarTitulo", filtrarTitulo);
        session.setAttribute("filtrarPrecioMaximo", filtrarPM);
        List<Articulo> l = aDAO.findArticulosFiltrados(anho, filtrarAnho, precioMaximo, filtrarPM, artista, filtrarArtista, titulo, filtrarTitulo);*/
        return aDAO.findArticulosFiltrados(anho, precioMaximo, artista, titulo);
    }
}
