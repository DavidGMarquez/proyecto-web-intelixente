/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vanesa
 */
public class MySQLMetodos {

    private final String host="127.0.0.1:3306";
    private final String bd="dawa";
    private final String usuario="dawa";
    private final String pass="dawa";

    protected Connection obtenerConexion(String host, String database,String usuario, String pass) throws Exception {
        String url = "";
        try {
            //Conecto a la BD
            String controlador = "com.mysql.jdbc.Driver";
            Class.forName(controlador).newInstance();
            
            url = "jdbc:mysql://" + host + "/" + database;
            Connection con = DriverManager.getConnection(url,usuario,pass);
            //System.out.println("Conexion establecida con " + url + "...");
            return con;
        } catch (SQLException e) {
            System.out.println("Conexion NO establecida con " + url);
            throw (e);
        }
    }

    protected Connection obtenerConexionDAWA() throws Exception {
        return obtenerConexion(host,bd,usuario,pass);
    }

    protected void ejecutarOperacion(Connection con, String sqlStatement) throws Exception {
        try {
            Statement s = con.createStatement();
            s.execute(sqlStatement);
            s.close();
        } catch (SQLException e) {
            System.out.println("Error ejecutando sentencia SQL");
            throw (e);
        }
    }

    protected void cerrarConexion(Connection con){
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(MySQLMetodos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
