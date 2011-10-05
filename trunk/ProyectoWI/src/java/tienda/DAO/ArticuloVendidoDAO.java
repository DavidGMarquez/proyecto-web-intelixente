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
import tienda.modelo.ArticuloPedido;

/**
 *
 * @author harry
 */
public class ArticuloVendidoDAO
{

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    public void insertarArticulo(ArticuloPedido a, int idVenta)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `articulovendido` (`idVenta`, `codigo`, `unidades`, `costeUnidad`)" + "VALUES ('" + idVenta + "', '" + a.getCodigoArticulo() + "', '" + a.getCantidad() + "', '" + a.getPrecio() + "')";
            sentenciaSQL.executeUpdate(query);
        }
        catch (Exception ex)
        {
            Logger.getLogger(ArticuloVendidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }

    }
}
