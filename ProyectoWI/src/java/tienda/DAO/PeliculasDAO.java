/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.modelo.Pelicula;

/**
 *
 * @author nessa
 */
public class PeliculasDAO 
{
    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();
    
    //TODO Probar y completar
    public boolean insertarPelicula(Pelicula p)
    {
        try 
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            //TODO corregir este insert para introducir articulos y peliculas
            conexion.setAutoCommit(false);
            query = "INSERT INTO `movies` (`title`, `year`)" 
                    + " VALUES ('" + p.getTitulo() + "', " + p.getAnho() + ");\n";
            
            for(int i=0; i<p.getActores().size(); i++){
                String actor = p.getActores().get(i);
                query += "INSERT INTO `movie_actors`(`actorID`,`actorName`) "
                        + "VALUES ('" + actor.toLowerCase().replace(' ', '_') + "', '" + actor + "');\n";
            }
            
            for(int i=0; i<p.getDirectores().size(); i++){
                String director = p.getDirectores().get(i);
                query += "INSERT INTO `movie_directors`(`directorID`,`directorName`) "
                        + "VALUES ('" + director.toLowerCase().replace(' ', '_') + "', '" + director + "');\n";
                
            }
            System.out.println(query);
            sentenciaSQL.executeUpdate(query);
            conexion.commit();
            return true;
        }
        catch (Exception ex)
        {
            Logger.getLogger(PeliculasDAO.class.getName()).log(Level.SEVERE, null, ex);
            try{
                conexion.rollback();
            }catch(SQLException ex2){
                Logger.getLogger(PeliculasDAO.class.getName()).log(Level.SEVERE, null, ex2);
            }
            return false;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }
    
}
