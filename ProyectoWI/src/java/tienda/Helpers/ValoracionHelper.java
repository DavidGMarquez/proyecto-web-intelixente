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
    
    public List<Valoracion> listaValoraciones(HttpSession session, HttpServletRequest request) {
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
        
        int numValoraciones = dao.getNumValoraciones(idPelicula, idUsuario);
        Integer paginas = numValoraciones / registros;
        if (numValoraciones % registros > 0) {
            paginas++;
        }
        int pagina = this.construirPaginacion(session, request, paginas, registros);
        
        List<Valoracion> l = dao.obtenerValoraciones(idPelicula, idUsuario, pagina, registros);
        request.setAttribute("valoraciones", l);
        return l;
    }
}
