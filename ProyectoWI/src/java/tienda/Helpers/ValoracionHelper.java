/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import tienda.DAO.ValoracionesDAO;
import tienda.modelo.Valoracion;

/**
 *
 * @author nessa
 */
public class ValoracionHelper extends AbstractHelper {
    ValoracionesDAO dao;
    
    public ValoracionHelper(){
        dao = new ValoracionesDAO();
        registros = 10;
    }
    
    public HttpSession listaValoraciones(HttpSession session, HttpServletRequest request) {
        Integer idPelicula = null;
        try{
            idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
        }catch(Exception e){
            idPelicula = null;
        }
        Integer idUsuario = null;
        try{
            idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        }catch(Exception e){
            idUsuario = null;
        }
        
        List<Valoracion> l = dao.obtenerValoraciones(idPelicula, idUsuario);

        Integer paginas = l.size() / registros;
        if (l.size() % registros > 0) {
            paginas = paginas + 1;
        }

        String pagina = request.getParameter("pagina");
        if (pagina == null) {
            pagina = "1";
        }
        request.setAttribute("valoraciones", l);
        request.setAttribute("paginas", paginas);
        request.setAttribute("pagina", pagina);
        request.setAttribute("registros", registros);
        return session;
    }
}
