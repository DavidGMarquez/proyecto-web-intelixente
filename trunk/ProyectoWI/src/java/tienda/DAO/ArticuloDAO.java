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
import tienda.modelo.Articulo;
import tienda.modelo.ArticuloPedido;

/**
 *
 * @author Vanesa
 */
public class ArticuloDAO {

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    //probada
    public List<Articulo> findArticulos(boolean filtrarActivos, String condicion) {
        try {
            List<Articulo> l = new ArrayList<Articulo>();
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de Articulos
            String query = "SELECT * FROM articulos " + condicion;
            consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                Articulo a = new Articulo(consulta.getString("codigoArticulo"), consulta.getString("grupo"), consulta.getString("album"), consulta.getString("pais"), consulta.getFloat("precio"), consulta.getBoolean("activo"), consulta.getInt("unidades"), consulta.getString("imagen"), consulta.getInt("anho"));
                if (filtrarActivos) {
                    if (a.getActivo() && a.getUnidades() > 0) {
                        l.add(a);
                    }
                } else {
                    l.add(a);
                }
            }
            return l;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    //probada
    public Articulo findArticuloById(String idArticulo) {
        try {
            conexion = m.obtenerConexionDAWA();

            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de Articulos
            String query = "SELECT * FROM articulos where codigoArticulo='" + idArticulo + "'";

            consulta = sentenciaSQL.executeQuery(query);

            Articulo u = null;
            if (consulta.next());
            {
                u = new Articulo(consulta.getString("codigoArticulo"),
                        consulta.getString("grupo"),
                        consulta.getString("album"),
                        consulta.getString("pais"),
                        consulta.getFloat("precio"),
                        consulta.getBoolean("activo"),
                        consulta.getInt("unidades"),
                        consulta.getString("imagen"),
                        consulta.getInt("anho"));
            }
            return u;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    public Boolean existeArticulo(Articulo a) {
        try {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Compruebo si el artículos existe en la bd
            //String query = "SELECT codigoArticulo FROM articulos where grupo='" + a.getGrupo() + "' and album='" + a.getAlbum() + "'";
            String query = "SELECT codigoArticulo FROM articulos where codigoArticulo='" + a.getCodigoArticulo() + "'";
            consulta = sentenciaSQL.executeQuery(query);
            if (consulta.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    //probado
    public boolean insertarArticulo(Articulo a) {
        try {
            //Falta ver que el código no está duplicado
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            query = "INSERT INTO `articulos` (`codigoArticulo`, `grupo`, `album`, `pais`, `precio`, `activo`, `unidades`, `imagen`,`anho`)" + " VALUES ('" + a.getCodigoArticulo() + "', '" + a.getGrupo() + "', '" + a.getAlbum() + "', '" + a.getPais() + "', " + a.getPrecio() + ", " + a.getActivo() + ", " + a.getUnidades() + ", '" + a.getImagen() + "'," + a.getAnho() + ")";
            System.out.println(query);
            sentenciaSQL.executeUpdate(query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    //probada
    public boolean borrarArticulo(String codigoArticulo) {
        try {
            conexion = m.obtenerConexionDAWA();
            query = "DELETE from articulos where codigoArticulo='" + codigoArticulo + "'";
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }

    }

    //probado
    public boolean modificarArticulo(Articulo a) {
        try {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE articulos set " + "grupo='" + a.getGrupo() + "'," + "album='" + a.getAlbum() + "',pais='" + a.getPais() + "',precio=" + a.getPrecio() + ",activo=" + a.getActivo() + ",unidades=" + a.getUnidades() + ",imagen='" + a.getImagen() + "',anho=" + a.getAnho() + " where codigoArticulo='" + a.getCodigoArticulo() + "'";
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    //Probada
    public boolean activarArticulo(String idArticulo, Boolean activar) {
        try {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE articulos set " + " activo=" + activar + "" + " where codigoArticulo='" + idArticulo + "'";
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    /*public ArrayList<Articulo> findArticulosByAnho(int anho) {
    try {
    conexion = m.obtenerConexionDAWA();

    sentenciaSQL = conexion.createStatement();
    //Obtengo la lista de Articulos
    String query = "SELECT * FROM Articulos where anho = " + anho + "";

    consulta = sentenciaSQL.executeQuery(query);

    ArrayList<Articulo> l = new ArrayList<Articulo>();
    while (consulta.next());
    {
    l.add(new Articulo(consulta.getString("codigoArticulo"),
    consulta.getString("grupo"),
    consulta.getString("album"),
    consulta.getString("pais"),
    consulta.getFloat("precio"),
    consulta.getBoolean("activo"),
    consulta.getInt("unidades"),
    consulta.getString("imagen"),
    consulta.getInt("anho")));
    }
    return l;
    } catch (Exception ex) {
    Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
    return null;
    } finally {
    m.cerrarConexion(conexion);
    }
    }*/
    public List<Articulo> findArticulosFiltrados(String anho, Float precioMaximo, String artista, String titulo){
    	boolean filtrarAnho = anho!=null && !anho.isEmpty();
    	boolean filtrarPM = precioMaximo!=null;
    	boolean filtrarArtista = artista!=null && !artista.isEmpty();
    	boolean filtrarTitulo = titulo!=null && !titulo.isEmpty();
    	return findArticulosFiltrados(anho, filtrarAnho, precioMaximo, filtrarPM, artista, filtrarArtista, titulo, filtrarTitulo);
    }
    
    
    public List<Articulo> findArticulosFiltrados(String anho, Boolean filtrarAnho,
            Float precioMaximo, Boolean filtrarPM,
            String artista, Boolean filtrarArtista,
            String titulo, Boolean filtrarTitulo) {
        String condicion = "";

        if (filtrarAnho && !anho.isEmpty()) {
            condicion += (condicion.isEmpty()? " where " : " and ") + " anho=" + anho;
        }

        if (filtrarPM) {
            condicion += (condicion.isEmpty()? " where " : " and ") + " precio<=" + precioMaximo;
        }

        if (filtrarArtista && !artista.isEmpty()) {
        	condicion += (condicion.isEmpty()? " where " : " and ") + " grupo like'%" + artista + "%'";
        }

        if (filtrarTitulo && !titulo.isEmpty()) {
        	condicion += (condicion.isEmpty()? " where " : " and ") + " album like '%" + titulo + "%'";
        }

        return findArticulos(true, condicion);

    }

    public void modificarUnidades(Articulo a) {
        try {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE articulos set " + " unidades=" + a.getUnidades() + " where codigoArticulo='" + a.getCodigoArticulo() + "'";
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    public Boolean compruebaStock(ArticuloPedido a) {
        try {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo el stock actual
            query = "SELECT unidades FROM articulos where codigoArticulo='" + a.getCodigoArticulo() + "'";
            consulta = sentenciaSQL.executeQuery(query);
            consulta.next();
            Integer stock = consulta.getInt("unidades");

            //Si hay stock devuelve -1, si no hay, devuelve el número de unidades que quedan
            if (stock >= a.getCantidad()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }

    }
}
