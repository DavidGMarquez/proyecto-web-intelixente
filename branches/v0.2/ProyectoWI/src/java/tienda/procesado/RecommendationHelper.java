/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.procesado;

import java.io.File;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import tienda.DAO.ArticuloDAO;
import tienda.modelo.Articulo;

/**
 * Importante:
 *
 * O ficheiro movies.dat ten o formato: id, título
 * O ficheiro ratings.dat ten o formato: idusuario, idpelicula, valoración
 *
 * Ningún dos dous ten cabeceiras, asúmese o formato anterior.
 *
 * TODO:
 * Os ids dos usuarios teñen que coincidir cos de movielens
 * Na base de datos deben estár todalas peliculas de movielens
 *
 * @author angel
 */
public class RecommendationHelper {

    public static final int USER_BASED = 0;
    public static final int ITEM_BASED = 1;
    
    static FileDataModel dataModel = null;

    public static void printSomeThings(){
        try {
            FileDataModel f = getFileDataModel();
            System.out.println("Users:" + f.getNumUsers());
            System.out.println("Items:" + f.getNumItems());


        } catch (TasteException ex) {
            Logger.getLogger(RecommendationHelper.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private static FileDataModel getFileDataModel() {
        if (dataModel == null) {
            try {
                try {
                    dataModel = new FileDataModel(new File(RecommendationHelper.class.getResource(Properties.ratingsFile).toURI()));
                    return dataModel;
                } catch (FileNotFoundException ex) {
                    Logger.getLogger(RecommendationHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            } catch (URISyntaxException ex) {
                Logger.getLogger(RecommendationHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return dataModel;
    }

    public static List<Articulo> getItemBasedSimilarArticles(String codigoArticulo, int n) {

        List<Articulo> similares = null;
        try {
            ArticuloDAO dao = new ArticuloDAO();
            similares = new ArrayList<Articulo>();
            Map<String, String> map = MovieLensHelper.loadMovies(Properties.moviesFile);
            //Create an ItemSimilarity
            ItemSimilarity itemSimilarity = new LogLikelihoodSimilarity(getFileDataModel());
            //Create an Item Based Recommender
            ItemBasedRecommender recommender = new GenericItemBasedRecommender(getFileDataModel(), itemSimilarity);
            //Get the recommendations
            List<RecommendedItem> recommendations = recommender.mostSimilarItems(new Long(codigoArticulo), n);
            //            TasteUtils.printRecs(recommendations, map);

            if (recommendations.isEmpty()) {
                System.out.println("(Item-Based) Non se atoparon recomendacións para " + codigoArticulo);
            } else {
                System.out.println("(Item-Based) Recomendacións para " + codigoArticulo + ":");
                for (RecommendedItem item : recommendations) {
                    Comparable<?> id = item.getItemID();
                    String title = map.get(id.toString());
                    System.out.println("\tId: " + id.toString() + ", Title: " + title);
                }
            }
            for (RecommendedItem item : recommendations) {
                Comparable<?> id = item.getItemID();
                String title = map.get(id.toString());
                Articulo a = dao.findArticuloByIdPelicula(id.toString());
                if (a != null) {
                    similares.add(a);
                } else {
                    System.out.println("Non se atopou na base de datos a película '" + title + "' (id:" + id.toString() + ")");
                }
            }

        } catch (TasteException ex) {
            Logger.getLogger(RecommendationHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return similares;
    }

    public static List<Articulo> getUserBasedSimilarArticles(Long userId, String codigoArticulo, int n) {

        List<Articulo> similares = null;
        try {
            ArticuloDAO dao = new ArticuloDAO();
            similares = new ArrayList<Articulo>();
            Map<String, String> map = MovieLensHelper.loadMovies(Properties.moviesFile);

            //Create an ItemSimilarity
            UserSimilarity userSimilarity = new PearsonCorrelationSimilarity(getFileDataModel());

            //Get a neighborhood of users
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(5, userSimilarity, getFileDataModel());
            //Create an Item Based Recommender
            UserBasedRecommender recommender = new GenericUserBasedRecommender(getFileDataModel(), neighborhood, userSimilarity);
            //Get the recommendations
            List<RecommendedItem> recommendations = recommender.recommend(userId, n);

            if (recommendations.isEmpty()) {
                System.out.println("(User-Based) Non se atoparon recomendacións para usuario " +userId + ", articulo "+ codigoArticulo);
            } else {
                System.out.println("(User-Based) Recomendacións para usuario " +userId + ", articulo "+ codigoArticulo + ":");
                for (RecommendedItem item : recommendations) {
                    Comparable<?> id = item.getItemID();
                    String title = map.get(id.toString());
                    System.out.println("\tId: " + id.toString() + ", Title: " + title);
                }
            }

            for (RecommendedItem item : recommendations) {
                Comparable<?> id = item.getItemID();
                String title = map.get(id.toString());
                Articulo a = dao.findArticuloByIdPelicula(id.toString());

                if (a != null) {
                    similares.add(a);
                } else {
                    System.out.println("Non se atopou na base de datos a película '" + title + "' (id:" + id.toString() + ")");
                }

            }

        } catch (TasteException ex) {
            System.out.println("Error. UserId: " + userId);
            Logger.getLogger(RecommendationHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return similares;
    }
}
