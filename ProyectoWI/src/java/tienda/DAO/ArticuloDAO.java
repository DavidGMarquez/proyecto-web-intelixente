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
import tienda.procesado.RecommendationHelper;
import tienda.procesado.Settings;

/**
 * En algunas consultas se usará la vista articulos_movies
 * SELECT a.codigoArticulo, a.precio, a.unidades, 
 *  a.activo, a.idPelicula, idCluster, spanishTitle as titulo, 
 *  imdbPictureURL as imagen, year as anho "
 * FROM `articulos` a,`movies` m 
 * @author Vanesa
 */
public class ArticuloDAO {

    Connection conexion = null;
    MySQLMetodos m = new MySQLMetodos();

    public Integer numArticulos(boolean filtrarActivos){
        return numArticulos(filtrarActivos, null);
    }
    
    public Integer numArticulos(boolean filtrarActivos, String condicion){
        Integer num = null;
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();
            String query = "SELECT count(idArticulo) AS num FROM `articulos` a,`movies` m "
                    + " WHERE a.idPelicula = m.id ";
            if(condicion != null){
                query += condicion;
            }
            if(filtrarActivos){
                query += " AND activo = 1 AND unidades > 0 ";
            }
            System.out.println("ArticuloDAO:" + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            if(consulta.next()){
                num = consulta.getInt("num");
            }
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            m.cerrarConexion(conexion);
        }
        return num;
    }
    
    public Integer numArticulos(String anho, Float precioMaximo,
            String titulo, Integer tipo){
        String condicion = "";

        if (anho != null && !anho.isEmpty()) {
            condicion += " AND year=" + anho;
        }

        if (precioMaximo != null) {
            condicion += " AND precio<=" + precioMaximo;
        }

        if (titulo != null && !titulo.isEmpty()) {
            condicion += " AND spanishTitle like '%" + titulo + "%'";
        }

        if (tipo != null) {
            condicion += " AND tipo =" + tipo.intValue();
        }
        return numArticulos(true, condicion);
    }
    
    /**
     * 
     * @param filtrarActivos
     * @param condicion - puede ser nula, si no lo es tiene que empezar por AND.
     * @return 
     */
    public List<Articulo> findArticulos(boolean filtrarActivos, String condicion, 
            int pagina, int numRegistros) {
        if(condicion == null) condicion = "";
        condicion += m.getCodigoLimit(pagina, numRegistros);
        return findArticulos(filtrarActivos, condicion);
    }
    
    public List<Articulo> findArticulos(boolean filtrarActivos, String condicion) {
        List<Articulo> l = new ArrayList<Articulo>();
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();
            String query = "SELECT a.codigoArticulo, a.precio, a.unidades, a.activo, "
                    + " a.idPelicula, idCluster, tipo, spanishTitle as titulo, "
                    + " imdbPictureURL as imagen, year as anho "
                    + " FROM `articulos` a,`movies` m "
                    + " WHERE a.idPelicula = m.id";
            if (filtrarActivos) {
                query += " AND a.activo = 1 AND a.unidades > 0";
            }
            if (condicion != null) {
                query += condicion;
            }

            if(condicion.indexOf("LIMIT") < 0){
                query += " LIMIT 0, 100";
            }
          
            
            System.out.println("ArticuloDAO:" + query);
            ResultSet consulta = sentenciaSQL.executeQuery(query);
            while (consulta.next()) {
                Pelicula p = new Pelicula(consulta.getInt("idPelicula"),
                        consulta.getString("titulo"),
                        consulta.getInt("anho"),
                        consulta.getString("imagen"));
                Articulo a = new Articulo(consulta.getString("codigoArticulo"),
                        consulta.getFloat("precio"), consulta.getBoolean("activo"),
                        consulta.getInt("unidades"), consulta.getInt("idCluster"),
                        consulta.getInt("tipo"), p);
                if (consulta.wasNull()) {
                    a.setTipo(null);
                }
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
    public List<Articulo> findArticulosByCluster(int clusterId, String codigoArticulo, Integer maxElementos, boolean filtrarActivos, String condicion) {
        if (condicion == null) {
            condicion = "";
        }
        condicion += " AND a.idCluster = " + clusterId;
        if (codigoArticulo != null && !codigoArticulo.isEmpty()) {
            condicion += " AND a.codigoArticulo NOT LIKE '" + codigoArticulo + "' ";
        }
        condicion += " ORDER BY rand() ";

        if (maxElementos != null && maxElementos > 0) {
            condicion += " LIMIT 0 , " + maxElementos;
        } else{
            condicion += " LIMIT 0, 100";
        }
        return findArticulos(filtrarActivos, condicion);
    }

    public Articulo findArticuloById(String idArticulo) {
        return findArticuloById(idArticulo, true, true, true, true);
    }

    public Articulo findArticuloById(String idArticulo, boolean conActores,
            boolean conDirectores, boolean conGeneros, boolean conPaises) {
        String condicion = " AND codigoArticulo ='" + idArticulo + "'";
        try {
            Articulo a = findArticulos(false, condicion).get(0);
            int movieID = a.getPelicula().getId();
            if (conActores || conDirectores || conGeneros || conPaises) {
                PeliculasDAO peliDAO = new PeliculasDAO();
                if (conDirectores) {
                    a.getPelicula().setDirectores(peliDAO.getDirectores(movieID));
                }
                if (conActores) {
                    a.getPelicula().setActores(peliDAO.getActores(movieID));
                }
                if (conGeneros) {
                    a.getPelicula().setGeneros(peliDAO.getGeneros(movieID));
                }
                if (conPaises) {
                    a.getPelicula().setPaises(peliDAO.getPaises(movieID));
                }
            }
            return a;
        } catch (IndexOutOfBoundsException iob) {
        }
        return null;
    }

    public Articulo findArticuloByIdPelicula(String id) {
        String condicion = " AND idPelicula ='" + id + "'";
        try {
            Articulo a = findArticulos(false, condicion).get(0);

            return a;
        } catch (IndexOutOfBoundsException iob) {
        }
        return null;
    }

    public List<Articulo> getRecommendations(Long userId) {
        System.out.println("Get recommendations: userid -> " +userId);
        if (Settings.getSettings().getRecommendationStrategy() == RecommendationHelper.USER_BASED) {
            return RecommendationHelper.getRecommendedUserBasedArticles(userId, 2);
        } else {
            return RecommendationHelper.getRecommendedItemBasedArticles(userId, 2);
        }
    }

    public List<Articulo> getSimilarArticles(Long articleId) {
        return RecommendationHelper.getSimilarArticles(articleId, 2);
    }

    public List<Articulo> findArticulosFiltrados(String anho, Float precioMaximo,
            String titulo, Integer tipo, int pagina, int numRegistros) {
        String condicion = "";

        if (anho != null && !anho.isEmpty()) {
            condicion += " AND year=" + anho;
        }

        if (precioMaximo != null) {
            condicion += " AND precio<=" + precioMaximo;
        }

        if (titulo != null && !titulo.isEmpty()) {
            condicion += " AND spanishTitle like '%" + titulo + "%'";
        }

        if (tipo != null) {
            condicion += " AND tipo =" + tipo.intValue();
        }

        return findArticulos(true, condicion, pagina, numRegistros);

    }

    public Boolean existeArticulo(Articulo a) {
        if (a.getCodigoArticulo() == null || a.getCodigoArticulo().isEmpty()) {
            return false;
        }
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();
            //Compruebo si el artículos existe en la bd
            //query = "SELECT codigoArticulo FROM articulos where grupo='" + a.getGrupo() + "' and album='" + a.getAlbum() + "'";
            String query = "SELECT codigoArticulo FROM articulos where codigoArticulo='" + a.getCodigoArticulo() + "'";
            ResultSet consulta = sentenciaSQL.executeQuery(query);
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

    // ten que ter o id da película
    public boolean insertarArticulo(Articulo a) {
        try {
            //Falta ver que el código no está duplicado
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String query = "INSERT INTO `articulos` (`codigoArticulo`, `precio`, `activo`, `unidades`, `idPelicula`)"
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

    public boolean borrarArticulo(String codigoArticulo) {
        if (codigoArticulo == null || codigoArticulo.isEmpty()) {
            return false;
        }
        try {
            conexion = m.obtenerConexionDAWA();
            String query = "DELETE from articulos where codigoArticulo='" + codigoArticulo + "'";
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }

    }

    public boolean modificarArticulo(Articulo a) {
        if (a.getCodigoArticulo() == null || a.getCodigoArticulo().isEmpty()) {
            return false;
        }
        try {
            conexion = m.obtenerConexionDAWA();
            String query = "UPDATE articulos "
                    + "set precio=" + a.getPrecio()
                    + ",activo=" + a.getActivo()
                    + ",unidades=" + a.getUnidades()
                    + ",tipo=" + a.getTipo()
                    + ",idC"
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

    public boolean activarArticulo(String idArticulo, Boolean activar) {
        if (activar == null || idArticulo == null || idArticulo.isEmpty()) {
            return false;
        }
        try {
            conexion = m.obtenerConexionDAWA();
            String query = "UPDATE articulos set " + " activo=" + activar
                    + " where codigoArticulo='" + idArticulo + "'";
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

    public boolean modificarUnidades(Articulo a) {
        if (a.getUnidades() == null || a.getCodigoArticulo() == null || a.getCodigoArticulo().isEmpty()) {
            return false;
        }
        try {
            conexion = m.obtenerConexionDAWA();
            String query = "UPDATE articulos set unidades=" + a.getUnidades()
                    + " where codigoArticulo='" + a.getCodigoArticulo() + "'";
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    /**
     * 
     * @param a - solo necesita tener fijado el codigo del articulo y el valor
     * de cluster. Si el valor de cluster es null devuelve false y no se hace nada.
     */
    public boolean modificarCluster(Articulo a) {
        if (a.getCluster() == null || a.getCodigoArticulo() == null || a.getCodigoArticulo().isEmpty()) {
            return false;
        }
        try {
            conexion = m.obtenerConexionDAWA();
            String query = "UPDATE articulos set idCluster=" + a.getCluster()
                    + " where codigoArticulo='" + a.getCodigoArticulo() + "'";
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    /**
     * Permite modificar el tipo de un artículo 
     * @param a - solo necesita tener fijado el id de la película y el valor
     * de tipo (puede ser nulo).
     */
    public boolean modificarTipo(Articulo a) {
        if (a.getIdPelicula() == null) {
            throw new NullPointerException();
        }
        try {
            conexion = m.obtenerConexionDAWA();
            String query = "UPDATE articulos set tipo=" + a.getTipo()
                    + " where idPelicula=" + a.getIdPelicula();
            System.out.println("query: " + query);
            m.ejecutarOperacion(conexion, query);
            return true;
        } catch (Exception ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            m.cerrarConexion(conexion);
        }
    }

    public Boolean compruebaStock(Pedido a) {
        try {
            conexion = m.obtenerConexionDAWA();
            Statement sentenciaSQL = conexion.createStatement();
            //Obtengo el stock actual
            String query = "SELECT unidades FROM articulos "
                    + "where codigoArticulo='" + a.getArticulo().getCodigoArticulo() + "'";
            ResultSet consulta = sentenciaSQL.executeQuery(query);
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
