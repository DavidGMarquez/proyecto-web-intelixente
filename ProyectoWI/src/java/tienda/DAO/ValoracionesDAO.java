/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.modelo.Valoracion;

/**
 * Vista para algunas consultas:
(SELECT idUsuario, movieID, valoracion, titulo
FROM valoraciones NATURAL JOIN 
(SELECT spanishTitle AS titulo, id AS movieID FROM movies) AS mview)

UNION

(SELECT userID AS idUsuario, movieID, rating AS valoracion, titulo 
FROM user_ratedmovies NATURAL JOIN (SELECT spanishTitle AS titulo, id AS movieID FROM movies) AS mview)
 * 
 * 
 * @author nessa
 */
public class ValoracionesDAO
{

    Connection conexion = null;
    /*Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;*/
    MySQLMetodos m = new MySQLMetodos();

    public void insertar(int idUsuario, String codigoArticulo, int valoracion)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "SELECT * FROM valoraciones WHERE idUsuario = '" + idUsuario + "' AND codigoArticulo = '" + codigoArticulo + "'";
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            if (consulta.next())
            {
                query = "UPDATE valoraciones SET valoracion = '" + valoracion + "' WHERE idValoracion = '" + consulta.getInt("idValoracion") + "'";
            }
            else
            {
                query = "INSERT INTO `valoraciones` (`idUsuario`, `codigoArticulo`, `valoracion`)" + "VALUES ('" + String.valueOf(idUsuario) + "', '" + codigoArticulo + "' , '" + valoracion + "')";
            }

            sentenciaSQL.executeUpdate(query);
        }
        catch (Exception ex)
        {
            Logger.getLogger(ComentariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    public int obtenerValoracionGeneralArticulo(String codigoArticulo)
    {
        int n = 0;
        int sumV = 0;
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "SELECT * FROM valoraciones WHERE codigoArticulo = '" + codigoArticulo + "'";
            ResultSet consulta = sentenciaSQL.executeQuery(query);

            while (consulta.next())
            {
                sumV += consulta.getInt("valoracion");
                n++;
            }
        }
        catch (Exception ex) 
        {
            Logger.getLogger(ValoracionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally 
        {
            m.cerrarConexion(conexion);
        }
        if (n == 0) 
        {
            return 0;
        }
        else 
        {
            return sumV / n;
        }
    }

    public int obtenerValoracionUsuarioArticulo(int idUsuario, String codigoArticulo)
    {
        int V = 0;
        try
        {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "SELECT * FROM valoraciones WHERE idUsuario = '" + String.valueOf(idUsuario) + "' AND codigoArticulo = '" + codigoArticulo + "'";
            ResultSet consulta = sentenciaSQL.executeQuery(query);

            while (consulta.next())
            {
                V = consulta.getInt("valoracion");
            }
        }
        catch (Exception ex)
        {
            Logger.getLogger(ValoracionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
        return V;
    }
  
    public ArrayList<Valoracion> obtenerValoraciones(Integer idPelicula, Integer idUsuario ){
        ArrayList<Valoracion> valoraciones = new ArrayList<Valoracion>();
        try
        {
            String condicion1 = "";
            String condicion2 = "";
            if(idUsuario != null){
                condicion1 = " WHERE idUsuario = " + idUsuario;
                condicion2 = " WHERE userID = " + idUsuario;
            }
            if(idPelicula != null){
                condicion1 += ("".equals(condicion1)? " WHERE " : " AND ") + " movieID = " + idPelicula;
                condicion2 += ("".equals(condicion2)? " WHERE " : " AND ") + " movieID = " + idPelicula;
            }
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "(SELECT idUsuario, movieID, valoracion, titulo "
                + " FROM valoraciones NATURAL JOIN "
                    + " (SELECT spanishTitle AS titulo, id AS movieID FROM movies) AS mview "
                    + condicion1
                + " ) UNION "
                + " (SELECT userID AS idUsuario, movieID, rating AS valoracion, titulo "
                + " FROM user_ratedmovies NATURAL JOIN "
                    + "(SELECT spanishTitle AS titulo, id AS movieID FROM movies) AS mview"
                    + condicion2 + ")";
            System.out.println("ValoracionesDAO: " + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next())
            {
                Valoracion v = new Valoracion(
                        consulta.getString("titulo"), consulta.getInt("movieID"), 
                        null, consulta.getInt("idUsuario"), 
                        consulta.getInt("valoracion"));
                valoraciones.add(v);
            }
            return valoraciones;
        }
        catch (Exception ex)
        {
            Logger.getLogger(ValoracionesDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }
    
    public ArrayList<Valoracion> obtenerValoracionesPelicula(int idPelicula){
        return obtenerValoraciones(idPelicula, null);
    }
    
    public ArrayList<Valoracion> obtenerValoracionesUsuario(int idUsuario){
        return obtenerValoraciones(null, idUsuario);
    }
    
    public static void main(String[] args){
        pruebaObtenerValoraciones();
    }
    
    private static void pruebaObtenerValoraciones(){
        ValoracionesDAO dao = new ValoracionesDAO();
        ArrayList<Valoracion> valoraciones = dao.obtenerValoraciones(null,null);
        dao.obtenerValoracionesPelicula(920);
        dao.obtenerValoracionesUsuario(78);
    }
}
