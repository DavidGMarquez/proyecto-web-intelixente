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
import tienda.modelo.Direccion;

/**
 *
 * @author harry
 */
public class DireccionDAO
{

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    public Direccion findDireccionById(Integer idDireccion)
    {
        Direccion d = null;
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de usuarios
            query = "SELECT * FROM direcciones where idDireccion=" + idDireccion;
            consulta = sentenciaSQL.executeQuery(query);
            consulta.next();
            d = new Direccion(consulta.getInt("idDireccion"), consulta.getString("direccion"), consulta.getString("localidad"), consulta.getString("provincia"), consulta.getString("cp"));
        }
        catch (Exception ex)
        {
            Logger.getLogger(DireccionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
        return d;

    }

    public int insertarDireccion(Direccion d)
    {
        int id = -1;
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `direcciones` ( `direccion`, `localidad`, `provincia`, `cp`) " + "VALUES ( '" + d.getDireccion() + "', '" + d.getLocalidad() + "', '" + d.getProvincia() + "', '" + d.getCp() + "')";
            sentenciaSQL.executeUpdate(query);
            query = "SELECT max(idDireccion) FROM direcciones";
            consulta = sentenciaSQL.executeQuery(query);
            consulta.next();
            id = consulta.getInt("max(idDireccion)");
        }
        catch (SQLException ex){
            Logger.getLogger(DireccionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }catch(Exception e){
        	Logger.getLogger(DireccionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return id;
    }
}
