/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.modelo.ActorDirector;
import tienda.modelo.Pelicula;

/**
 *
 * @author nessa
 */
public class PeliculasDAO 
{
    Connection conexion = null;
    /*Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;*/
    MySQLMetodos m = new MySQLMetodos();
    
    //TODO Probar y completar
    /**
     * 
     * @param p - el objeto con la pelicula que queremos insertar
     * @return  código de la película en la base de datos si todo ha sido
     * corecto, o -1 si algo ha fallado.
     */
    public int insertarPelicula(Pelicula p)
    {
        try 
        {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            //TODO corregir este insert para introducir articulos y peliculas
            conexion.setAutoCommit(false);
            String query = "INSERT INTO `movies` (`title`, `year`, `imdbPictureURL`)" 
                    + " VALUES ('" + p.getTitulo() + "', " + p.getAnho() + ", '"+ p.getImagen() + "');\n";
            System.out.println(query);
            sentenciaSQL.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
            ResultSet consulta = sentenciaSQL.getGeneratedKeys();
            consulta.next();
            Integer movieID = new Integer(consulta.getInt(1));
            //Actores
            for(int i=0; i<p.getActores().size(); i++){
                ActorDirector actor = p.getActores().get(i);
                query = "INSERT INTO `movie_actors`(`movieID`, `actorID`,`actorName`) "
                        + "VALUES ('" + movieID + "', '" + actor.getId() + "', '" + actor.getNombre() + "');\n";
                System.out.println(query);
                sentenciaSQL.executeUpdate(query);
            }
            //Directores
            for(int i=0; i<p.getDirectores().size(); i++){
                ActorDirector director = p.getDirectores().get(i);
                query = "INSERT INTO `movie_directors`(`movieID`, `directorID`,`directorName`) "
                        + "VALUES ('" + movieID + "', '" + director.getId() + "', '" + director.getNombre() + "');\n";
                System.out.println(query);
                sentenciaSQL.executeUpdate(query);
            }
            //Paises
            for(int i=0; i<p.getPaises().size(); i++){
                String pais = p.getPaises().get(i);
                query = "INSERT INTO `movie_countries`(`movieID`, `country`) "
                        + "VALUES ('" + movieID + "', '" + pais + "');\n";
                System.out.println(query);
                sentenciaSQL.executeUpdate(query);
            }
            //Generos
            for(int i=0; i<p.getGeneros().size(); i++){
                String genero = p.getGeneros().get(i);
                query = "INSERT INTO `movie_genres`(`movieID`, `genre`) "
                        + "VALUES ('" + movieID + "', '" + genero + "');\n";
                System.out.println(query);
                sentenciaSQL.executeUpdate(query);
            }
            
            conexion.commit();
            return movieID;
        }
        catch (Exception ex)
        {
            Logger.getLogger(PeliculasDAO.class.getName()).log(Level.SEVERE, null, ex);
            try{
                conexion.rollback();
            }catch(SQLException ex2){
                Logger.getLogger(PeliculasDAO.class.getName()).log(Level.SEVERE, null, ex2);
            }
            return -1;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }
    
    public ArrayList<ActorDirector> getDirectores(){
        return getDirectores(null);
    }
    
    public ArrayList<ActorDirector> getDirectores(Integer movieID){
        ArrayList<ActorDirector> resultado = new ArrayList<ActorDirector>();
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();

            String query = "SELECT DISTINCT `directorID`, `directorName` FROM `movie_directors` ";
            if(movieID != null)
                    query += " WHERE `movieID` LIKE '" + movieID + "';";
            System.out.println("PeliculasDAO:" + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                ActorDirector director = new ActorDirector(consulta.getString("directorID"), consulta.getString("directorName"));
                resultado.add(director);
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            m.cerrarConexion(conexion);
        }
        return resultado;
    }
    
    
    public ArrayList<ActorDirector> getActores(){
        return getActores(null);
        
    }
    public ArrayList<ActorDirector> getActores(Integer movieID){
        ArrayList<ActorDirector> resultado = new ArrayList<ActorDirector>();
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();

            String query = "SELECT DISTINCT `actorID`, `actorName` FROM `movie_actors` ";
            if(movieID != null)
                    query += " WHERE `movieID` LIKE '" + movieID + "';";
            System.out.println("PeliculasDAO:" + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                ActorDirector actor = new ActorDirector(consulta.getString("actorID"), consulta.getString("actorName"));
                resultado.add(actor);
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            m.cerrarConexion(conexion);
        }
        return resultado;
    }
    
    public ArrayList<String> getGeneros(){
        return getGeneros(null);
    }
    
    public ArrayList<String> getGeneros(Integer movieID){
        ArrayList<String> resultado = new ArrayList<String>();
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();

            String query = "SELECT DISTINCT `genre` FROM `movie_genres` ";
            if(movieID != null)
                    query += " WHERE `movieID` LIKE '" + movieID + "';";
            System.out.println("PeliculasDAO:" + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                resultado.add(consulta.getString("genre"));
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            m.cerrarConexion(conexion);
        }
        return resultado;
    }
    
    public ArrayList<String> getPaises(){
        return getPaises(null);
    }
    
    public ArrayList<String> getPaises(Integer movieID){
        ArrayList<String> resultado = new ArrayList<String>();
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();

            String query = "SELECT DISTINCT `country` FROM `movie_countries` ";
            if(movieID != null)
                    query += " WHERE `movieID` LIKE '" + movieID + "';";
            System.out.println("PeliculasDAO:" + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                resultado.add(consulta.getString("country"));
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            m.cerrarConexion(conexion);
        }
        return resultado;
    }
}
