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
import tienda.modelo.Comentarios;

/**
 *
 * @author harry
 */
public class ComentariosDAO
{

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    public ArrayList<Comentarios> findComentariosByCodigoArticulo(String codigoArticulo)
    {
        Comentarios c = null;
        ArrayList<Comentarios> l = null;
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "SELECT * FROM comentarios WHERE codigoArticulo = '" + codigoArticulo + "'";
            consulta = sentenciaSQL.executeQuery(query);
            l = new ArrayList<Comentarios>();
            while(consulta.next()){
                c = new Comentarios();
                c.setCodigoArticulo(consulta.getString("codigoArticulo"));
                c.setComentario(consulta.getString("comentario"));
                c.setIdComentario(consulta.getInt("idComentario"));
                UsuarioDAO ud = new UsuarioDAO();
                c.setNombreUsuario(ud.findUsuarioById(consulta.getInt("idUsuario")).getNombre());
                l.add(c);
            }
        }
        catch (Exception ex)
        {
            Logger.getLogger(ComentariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
        return l;
    }

    public void insertarComentario(Comentarios c)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `comentarios` (`idUsuario`, `codigoArticulo`, `comentario`)" + "VALUES ('" + String.valueOf(c.getIdUsuario()) + "', '" + c.getCodigoArticulo() + "' , '" + c.getComentario() + "')";
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
}
