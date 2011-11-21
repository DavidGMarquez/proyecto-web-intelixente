/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import tienda.modelo.TipoUsuario;
import tienda.modelo.Usuario;

/**
 *
 * @author Vanesa
 */
public class UsuarioDAO
{

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    public List<Usuario> findUsuarios()
    {
        try
        {
            List<Usuario> l = new ArrayList<Usuario>();
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de usuarios
            query = "SELECT * FROM usuarios where idTipoUsuario>1";
            consulta = sentenciaSQL.executeQuery(query);
            do
            {
                consulta.next();
                Usuario u = new Usuario(consulta.getInt("idUsuario"), consulta.getString("nombre"), consulta.getString("password"), consulta.getString("telefono"), consulta.getString("email"), consulta.getBoolean("activo"), consulta.getInt("idTipoUsuario"), consulta.getDouble("totalCompra"));
                u.setDireccion(new DireccionDAO().findDireccionById(consulta.getInt("idDireccion")));
                u.setTipo(this.findTiposUsuario(u.getIdTipoUsuario()).getTipoUsuario());

                l.add(u);
            }
            while (!consulta.isLast());
            return l;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    //probado
    public Usuario findUsuarioById(Integer idUsuario)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de usuarios
            query = "SELECT * FROM usuarios where idUsuario=" + idUsuario;
            consulta = sentenciaSQL.executeQuery(query);
            consulta.next();
            Usuario u = new Usuario(consulta.getInt("idUsuario"), consulta.getString("nombre"), null, consulta.getString("telefono"), consulta.getString("email"), consulta.getBoolean("activo"), consulta.getInt("idTipoUsuario"), consulta.getDouble("totalCompra"));
            //Obtengo la dirección
            Integer idDireccion = consulta.getInt("idDireccion");
            sentenciaSQL = conexion.createStatement();
            query = "SELECT * FROM direcciones where idDireccion=" + idDireccion;
            consulta = sentenciaSQL.executeQuery(query);
            consulta.next();
            u.setDireccion(new DireccionDAO().findDireccionById(consulta.getInt("idDireccion")));
            if(u.getIdTipoUsuario()>1)
                u.setTipo(this.findTiposUsuario(u.getIdTipoUsuario()).getTipoUsuario());
            return u;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    public Integer existeUsuario(String email,String pass){
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Compruebo si el artículos existe en la bd
            query = "SELECT idUsuario FROM usuarios where email='" + email+ "' and password='" + pass + "' and activo=1";
            consulta = sentenciaSQL.executeQuery(query);
            if (consulta.next()){
                return consulta.getInt("idUsuario");
            }else{
                return null;
            }
        }
        catch (Exception ex)
        {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    public boolean insertarUsuario(Usuario u)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            Integer idDireccion;
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `direcciones` ( `direccion`, `localidad`, `provincia`, `cp`) " + "VALUES ( '" + u.getDireccion().getDireccion() + "', '" + u.getDireccion().getLocalidad() + "', '" + u.getDireccion().getProvincia() + "', '" + u.getDireccion().getCp() + "')";
            sentenciaSQL.executeUpdate(query);
            //Obtengo el idDirección
            query = "SELECT max(idDireccion) FROM direcciones";
            System.out.println(query);
            consulta = sentenciaSQL.executeQuery(query);
            consulta.next();
            // !!!!!!!!!!!!!!!!!
            idDireccion = consulta.getInt("max(idDireccion)");
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `usuarios` (`nombre`, `password`, `telefono`, `email`, `activo`, `idTipoUsuario`, `idDireccion`,`totalCompra`)" + "VALUES ('" + u.getNombre() + "', '" + u.getPassword() + "', '" + u.getTelefono() + "', '" + u.getEmail() + "', 0, 2, " + idDireccion + ",0)";
            System.out.println(query);
            sentenciaSQL.executeUpdate(query);
            return true;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    //probado
    //TODO se va a borrar la dirección?
    public boolean borrarUsuario(Integer idUsuario)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            query = "DELETE from usuarios where idUsuario=" + idUsuario;
            m.ejecutarOperacion(conexion, query);
            return true;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }

    }

    //probado
    public boolean modificarUsuario(Usuario u)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE usuarios set " + "nombre='" + u.getNombre() + "'," + "telefono='" + u.getTelefono() + "'," + "email='" + u.getEmail() + "'," + "activo=" + u.getActivo() + "," + "idTipoUsuario='" + u.getIdTipoUsuario() + "', totalCompra= " + u.getTotalCompra() + " where idUsuario=" + u.getIdUsuario();
            m.ejecutarOperacion(conexion, query);
            query = "UPDATE direcciones set " + "direccion='" + u.getDireccion().getDireccion() + "'," + "localidad='" + u.getDireccion().getLocalidad() + "'," + "provincia='" + u.getDireccion().getProvincia() + "'," + "cp='" + u.getDireccion().getCp() + "' " + "where idDireccion=" + u.getDireccion().getIdDireccion();
            System.out.println(query);
            m.ejecutarOperacion(conexion, query);
            return true;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    //Probada
    public void activarUsuario(Integer idUsuario, Boolean activar)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE usuarios set " + " activo=" + activar + "" + " where idUsuario=" + idUsuario;
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    public List<TipoUsuario> findTiposUsuario()
    {
    	List<TipoUsuario> l = new ArrayList<TipoUsuario>();
        try
        {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de usuarios
            query = "SELECT * FROM tipousuario where idTipoUsuario>1";
            consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next())
            {
                TipoUsuario tu = new TipoUsuario(consulta.getInt("idTipoUsuario"), consulta.getString("tipo"));
                l.add(tu);
            }
            
            return l;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    public TipoUsuario findTiposUsuario(int id)
    {
        TipoUsuario t = null;
        List<TipoUsuario> l = this.findTiposUsuario();
        for (int i = 0; i < l.size(); i++)
        {
            if (l.get(i).getIdTipoUsuario() == id)
            {
                t = l.get(i);
                break;
            }
        }
        return t;
    }

    public TipoUsuario findTiposUsuario(String tipo)
    {
        TipoUsuario t = null;
        List<TipoUsuario> l = this.findTiposUsuario();

        for (int i = 0; i < l.size(); i++)
        {
            if (l.get(i).getTipoUsuario().equalsIgnoreCase(tipo))
            {
                t = l.get(i);
                break;
            }
        }
        return t;
    }

    public boolean cambiaPassUsuario(Integer idUsuario, String pass)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE usuarios set password='" + pass + "' where idUsuario=" + idUsuario;
            m.ejecutarOperacion(conexion, query);
            return true;
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }

    public void actualizarEstadoUsuario(Usuario u)
    {
        try
        {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE usuarios set " + " totalCompra=" + u.getTotalCompra() + ", idTipoUsuario="+u.getIdTipoUsuario() + " where idUsuario=" + u.getIdUsuario();
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
        }
        catch (Exception ex)
        {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            m.cerrarConexion(conexion);
        }
    }
}
