/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import tienda.DAO.PeliculasDAO;
import tienda.modelo.ActorDirector;

/**
 *
 * @author nessa
 */
public class PeliculaHelper extends AbstractHelper {
    
    private PeliculasDAO pDao;
    
    public PeliculaHelper(){
        pDao = new PeliculasDAO();
    }
    
    public void pasarDirectores(HttpServletRequest request){
        ArrayList<ActorDirector> directores = pDao.getDirectores();
        String directoresString = "[";
        String directoresHash = "{";
        for(int i=0; i< directores.size(); i++){
            directoresString += " \"" + directores.get(i).getNombre() + "\",";
            //directoresIdString += " \"" + directores.get(i).getId() + "\",";
            /*directoresString += "{'label':'" + directores.get(i).getNombre() 
                    + "', 'value':'" + directores.get(i).getId() + "'},";*/
            directoresHash += "'" + directores.get(i).getNombre()
                    + "': '" + directores.get(i).getId() + "' ,";
        }
        directoresString = directoresString.substring(0, directoresString.length()-1) + "]";
        directoresHash = directoresHash.substring(0, directoresHash.length()-1) + "}";
        request.setAttribute("directores", directoresString);
        request.setAttribute("directoresHash", directoresHash);
    }
    
    public void pasarActores(HttpServletRequest request){
        ArrayList<ActorDirector> actores = pDao.getActores();
        String actoresString = "[";
        String actoresHash = "{";
        for(int i=0; i< actores.size(); i++){
            //actoresIdString += " \"" + actores.get(i).getId() + "\",";
            /*actoresString += "{'label':'" + actores.get(i).getNombre() 
                    + "', 'value':'" + actores.get(i).getId() + "'},";*/
            actoresString += " \"" + actores.get(i).getNombre() + "\",";
            actoresHash += "'" + actores.get(i).getNombre() 
                    + "': '" + actores.get(i).getId() + "' ,";
        }
        actoresString = actoresString.substring(0, actoresString.length()-1) + "]";
        actoresHash = actoresHash.substring(0, actoresHash.length()-1) + "}";
        request.setAttribute("actores", actoresString);
        request.setAttribute("actoresHash", actoresHash);
    }
    
    public void pasarGeneros(HttpServletRequest request){
        ArrayList<String> generos = pDao.getGeneros();
        String generosString = "[";
        for(int i=0; i< generos.size(); i++){
            generosString += " \"" + generos.get(i) + "\",";
        }
        generosString = generosString.substring(0, generosString.length()-1) + "]";
        request.setAttribute("generos", generosString);
    }
    
    public void pasarPaises(HttpServletRequest request){
        ArrayList<String> paises = pDao.getPaises();
        String paisesString = "[";
        for(int i=0; i< paises.size(); i++){
            paisesString += " \"" + paises.get(i) + "\",";
        }
        paisesString = paisesString.substring(0, paisesString.length()-1) + "]";
        request.setAttribute("paises", paisesString);
    }

}
