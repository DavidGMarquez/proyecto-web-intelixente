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
import tienda.modelo.Pedido;
import tienda.modelo.Pelicula;

/**
 * En algunas consultas se usará la vista articulos_movies
 * SELECT a.codigoArticulo, a.precio, a.unidades, 
 *  a.activo, a.idPelicula, idCluster, title as titulo, 
 *  imdbPictureURL as imagen, year as anho "
 * FROM `articulos` a,`movies` m 
 * @author Vanesa
 */
public class ArticuloDAO {

    Connection conexion = null;
    Statement sentenciaSQL = null;
    ResultSet consulta = null;
    String query;
    MySQLMetodos m = new MySQLMetodos();

    //ACTUALIZADA
    public List<Articulo> findArticulos(boolean filtrarActivos, String condicion) {
        List<Articulo> l = new ArrayList<Articulo>();
        try {
            
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            // TODO : PROBAR consulta
            if(condicion == null) condicion = "";
            condicion += (condicion.isEmpty()? " WHERE ": " AND ") + " a.idPelicula = m.id ";
            if(filtrarActivos){
                condicion += " AND a.activo = 1 AND a.unidades > 0";
            }
            query = "SELECT a.codigoArticulo, a.precio, a.unidades, a.activo, a.idPelicula, idCluster, title as titulo, imdbPictureURL as imagen, year as anho "
                    + "FROM `articulos` a,`movies` m "
                    + condicion;
            System.out.println("ArticuloDAO:" + query);
            consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                // TODO: obtener otros datos de la película si es necesario en la pagina web
                Pelicula p = new Pelicula(consulta.getInt("idPelicula"),
                        consulta.getString("titulo"),
                        consulta.getInt("anho"),
                        consulta.getString("imagen"));
                Articulo a = new Articulo(consulta.getString("codigoArticulo"), 
                        consulta.getFloat("precio"), consulta.getBoolean("activo"), 
                        consulta.getInt("unidades"), consulta.getInt("idCluster"), p);
                l.add(a);
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            m.cerrarConexion(conexion);
        }
        return l;
    }
    
    /**
     * Crea una lista aleatoria de elementos del mismo cluster
     * @param clusterId - identificador del cluster
     * @param codigoArticulo - código que no se incluirá en la lista
     * @param maxElementos - número máximo de elementos que se incluirán. Si es null no hay límite.
     * @param filtrarActivos - si es true sólo se incluyen artículos activos
     * @param condicion - código SQL de una condición
     * @return 
     */
    public List<Articulo> findArticulosByCluster(int clusterId, String codigoArticulo, Integer maxElementos, boolean filtrarActivos, String condicion){
        List<Articulo> l = new ArrayList<Articulo>();
        try {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            if(condicion == null) condicion = "";
            condicion += (condicion.isEmpty()? " WHERE ": " AND ") + " a.idPelicula = m.id ";
            if(codigoArticulo != null && !codigoArticulo.isEmpty()){
                condicion += " AND a.codigoArticulo NOT LIKE '" + codigoArticulo + "' ";
            }
            if(filtrarActivos){
                condicion += " AND a.activo = 1 AND a.unidades > 0";
            }
            condicion += " ORDER BY rand() ";
            if(maxElementos != null && maxElementos>0){
                condicion += " LIMIT 0 , " + maxElementos;
            }
            query = "SELECT a.codigoArticulo, a.precio, a.unidades, a.activo, a.idPelicula, idCluster, title as titulo, imdbPictureURL as imagen, year as anho "
                    + "FROM `articulos` a,`movies` m "
                    + condicion;
            System.out.println("ArticuloDAO:" + query);
            consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                // TODO: obtener otros datos de la película si es necesario en la pagina web
                Pelicula p = new Pelicula(consulta.getInt("idPelicula"),
                        consulta.getString("titulo"),
                        consulta.getInt("anho"),
                        consulta.getString("imagen"));
                Articulo a = new Articulo(consulta.getString("codigoArticulo"), 
                        consulta.getFloat("precio"), consulta.getBoolean("activo"), 
                        consulta.getInt("unidades"), consulta.getInt("idCluster"), p);
                l.add(a);
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            m.cerrarConexion(conexion);
        }
        return l;
    }

    //probada actualizada 
    public Articulo findArticuloById(String idArticulo) {
        try {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo la lista de Articulos
            // TODO : probar consulta
            //query = "SELECT * FROM articulos where codigoArticulo='" + idArticulo + "'";
            query = "SELECT a.codigoArticulo, a.precio, a.unidades, a.activo, a.idPelicula, idCluster, title as titulo, imdbPictureURL as imagen, year as anho "
                    + "FROM `articulos` a,`movies` m WHERE codigoArticulo ='" + idArticulo + "' AND a.idPelicula = m.id";
            consulta = sentenciaSQL.executeQuery(query);
            Articulo u = null;
            if (consulta.next());
            {
                // TODO: obtener otros datos de la película si es necesario
                Pelicula p = new Pelicula(consulta.getInt("idPelicula"),
                        consulta.getString("titulo"),
                        consulta.getInt("anho"),
                        consulta.getString("imagen"));
                u = new Articulo(consulta.getString("codigoArticulo"),
                        consulta.getFloat("precio"),
                        consulta.getBoolean("activo"),
                        consulta.getInt("unidades"), consulta.getInt("idCluster"),  p);
            }
            return u;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    // actualizada
    public Boolean existeArticulo(Articulo a) {
        try {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Compruebo si el artículos existe en la bd
            //query = "SELECT codigoArticulo FROM articulos where grupo='" + a.getGrupo() + "' and album='" + a.getAlbum() + "'";
            query = "SELECT codigoArticulo FROM articulos where codigoArticulo='" + a.getCodigoArticulo() + "'";
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

    //probado-actualizada
    // ten que ter o id da película
    public boolean insertarArticulo(Articulo a) {
        try {
            //Falta ver que el código no está duplicado
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            //TODO corregir este insert para introducir articulos y peliculas
            query = "INSERT INTO `articulos` (`codigoArticulo`, `precio`, `activo`, `unidades`, `idPelicula`)" 
                    + " VALUES ('" + a.getCodigoArticulo() + "', " + a.getPrecio() 
                    + ", " + a.getActivo() + ", " + a.getUnidades() + ", " + a.getPelicula().getId() + ");";
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

    //probada actualizada
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

    // actualizada
    public boolean modificarArticulo(Articulo a) {
        try {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE articulos "
                    + "set precio=" + a.getPrecio() + ",activo=" + a.getActivo() 
                    + ",unidades=" + a.getUnidades()
                    + " where codigoArticulo='" + a.getCodigoArticulo() + "'";
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    // actualizada
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

    public List<Articulo> findArticulosFiltrados(String anho, Float precioMaximo, String titulo){
    	boolean filtrarAnho = anho!=null && !anho.isEmpty();
    	boolean filtrarPM = precioMaximo!=null;
    	boolean filtrarTitulo = titulo!=null && !titulo.isEmpty();
    	return findArticulosFiltrados(anho, filtrarAnho, precioMaximo, filtrarPM, titulo, filtrarTitulo);
    }
    
    
    public List<Articulo> findArticulosFiltrados(String anho, Boolean filtrarAnho,
            Float precioMaximo, Boolean filtrarPM, String titulo, Boolean filtrarTitulo) {
        String condicion = "";

        if (filtrarAnho && !anho.isEmpty()) {
            condicion += (condicion.isEmpty()? " where " : " and ") + " anho=" + anho;
        }

        if (filtrarPM) {
            condicion += (condicion.isEmpty()? " where " : " and ") + " precio<=" + precioMaximo;
        }

        if (filtrarTitulo && !titulo.isEmpty()) {
        	condicion += (condicion.isEmpty()? " where " : " and ") + " titulo like '%" + titulo + "%'";
        }

        return findArticulos(true, condicion);

    }

    // actualizada
    public void modificarUnidades(Articulo a) {
        try {
            conexion = m.obtenerConexionDAWA();
            query = "UPDATE articulos set " + " unidades=" + a.getUnidades() 
                    + " where codigoArticulo='" + a.getCodigoArticulo() + "'";
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    
    // actualizada
    public Boolean compruebaStock(Pedido a) {
        try {
            conexion = m.obtenerConexionDAWA();
            sentenciaSQL = conexion.createStatement();
            //Obtengo el stock actual
            query = "SELECT unidades FROM articulos "
                    + "where codigoArticulo='" + a.getArticulo().getCodigoArticulo() + "'";
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
