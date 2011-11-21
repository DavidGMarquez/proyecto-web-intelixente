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
public class VenderDAO
{

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    public int insertar(int idUsuario, int idDireccion)
    {
        int id = -1;
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `vender` (`idUsuario`, `fecha`, `idDireccion`)" + "VALUES ('" + idUsuario + "', NOW() , '" + idDireccion + "')";
            sentenciaSQL.executeUpdate(query);
            query = "SELECT max(idVenta) FROM vender";
            consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next())
            {
                id = consulta.getInt("max(idVenta)");
            }
        }
        catch (Exception ex)
        {
            Logger.getLogger(VenderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
        return id;
    }
}
