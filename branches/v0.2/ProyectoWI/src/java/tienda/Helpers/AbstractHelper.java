package tienda.Helpers;

import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nessa
 */
public class AbstractHelper {
    protected int registros = 6;
    protected static int numPaginasVisibles = 7;
    
    public ArrayList<Integer> numerosPaginacion(int paginas, int paginaActual){
        if(paginaActual > paginas) return null;
        ArrayList<Integer> p = new ArrayList<Integer>();
        
        if(paginas <= numPaginasVisibles){
            for(int i=1; i<=paginas; i++) p.add(i);
            return p;
        }

        p.add(paginaActual);
        if(numPaginasVisibles>1 && paginaActual != 1){
            p.add(1);
        }
        if(numPaginasVisibles>2 && paginaActual != paginas){
            p.add(paginas);
        }
        
        Integer pDesc = (paginaActual < 3 ? null : paginaActual - 1);
        Integer pAsc = (paginaActual > (paginas-3) ? null : paginaActual +1);
        
        int i=1;
        while(numPaginasVisibles > p.size() && (pDesc != null || pAsc != null)){
            if(pAsc != null && pAsc >= paginas) pAsc = null;
            if(pDesc != null && pDesc <= 1) pDesc = null;
            if(pAsc != null && i % 2 == 0){
                p.add(pAsc++);
            }else if(pDesc != null){
                p.add(pDesc--);
            }
            i++;
        }
        
        Collections.sort(p);
        return p;
    }
    
    public int construirPaginacion(HttpSession session, HttpServletRequest request, 
            int paginas, int registros){
        Integer pagina = null;
        if(request.getParameter("pagina") != null){
            pagina = new Integer(request.getParameter("pagina"));
        }else {
            pagina = 1;
        }
        session.setAttribute("pagina", pagina);
        session.setAttribute("paginas", paginas);
        session.setAttribute("paginacion",numerosPaginacion(paginas,pagina));
        session.setAttribute("registros", registros);
        return pagina;
    }
    
}
