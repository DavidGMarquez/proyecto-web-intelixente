/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author harry
 */
public class ValoracionesDAO
{

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    public void insertar(int idUsuario, String codigoArticulo, int valoracion)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "SELECT * FROM valoraciones WHERE idUsuario = '" + idUsuario + "' AND codigoArticulo = '" + codigoArticulo + "'";
            consulta = sentenciaSQL.executeQuery(query);
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
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "SELECT * FROM valoraciones WHERE codigoArticulo = '" + codigoArticulo + "'";
            consulta = sentenciaSQL.executeQuery(query);

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
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "SELECT * FROM valoraciones WHERE idUsuario = '" + String.valueOf(idUsuario) + "' AND codigoArticulo = '" + codigoArticulo + "'";
            consulta = sentenciaSQL.executeQuery(query);

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
}
