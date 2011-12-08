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
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.knn.KnnItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.classifier.bayes.BayesClassifier;
import org.apache.mahout.classifier.bayes.BayesModel;
import org.apache.mahout.clustering.dirichlet.UncommonDistributions;
import org.apache.mahout.clustering.kmeans.Cluster;
import org.apache.mahout.clustering.kmeans.RandomSeedGenerator;
import org.apache.mahout.common.Model;
import org.apache.mahout.matrix.DenseVector;
import org.apache.mahout.utils.EuclideanDistanceMeasure;
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

    public static final int ITEM_BASED = 0;
    public static final int USER_BASED = 1;
    private static Map<String, String> map = MovieLensHelper.loadMovies(Properties.moviesFile);
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

    /**
     * Recomendación item-based
     * @param userId
     * @param n numero de articulos a recomendar
     * @return
     */
    public static List<Articulo> getRecommendedItemBasedArticles(Long userId, int n) {

        List<Articulo> similares = null;
        try {
            System.out.println("1");
            ArticuloDAO dao = new ArticuloDAO();
            similares = new ArrayList<Articulo>();
            //Create an ItemSimilarity
            ItemSimilarity itemSimilarity = new LogLikelihoodSimilarity(getFileDataModel());
            System.out.println("2");


            //Create an Item Based Recommender
            ItemBasedRecommender recommender = new GenericItemBasedRecommender(getFileDataModel(), itemSimilarity);
            //Get the recommendations
            System.out.println("3");

            // tarda moiiiiiiito!!!! ¿¿¿pORQUÉ???
            List<RecommendedItem> recommendations = recommender.recommend(userId, n);


            if (recommendations.isEmpty()) {
                System.out.println("(Item-Based) Non se atoparon recomendacións");
            } else {
                System.out.println("4");
                System.out.println("(Item-Based) Recomendacións:");
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

    /**
     * Recomendación user-based
     * @param userId
     * @param n numero de articulos a recomendar
     * @return
     */
    public static List<Articulo> getRecommendedUserBasedArticles(Long userId, int n) {

        List<Articulo> similares = null;
        try {
            ArticuloDAO dao = new ArticuloDAO();
            similares = new ArrayList<Articulo>();
            //Create an ItemSimilarity
            UserSimilarity userSimilarity = new PearsonCorrelationSimilarity(getFileDataModel());
            //Get a neighborhood of users
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(5, userSimilarity, getFileDataModel());
            //Create an user Based Recommender
            UserBasedRecommender recommender = new GenericUserBasedRecommender(getFileDataModel(), neighborhood, userSimilarity);
            //Get the recommendations
            List<RecommendedItem> recommendations = recommender.recommend(userId, n);

            if (recommendations.isEmpty()) {
                System.out.println("(User-Based) Non se atoparon recomendacións para usuario " +userId );
            } else {
                System.out.println("(User-Based) Recomendacións para usuario " +userId +":");
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

    /**
     * Articulos similares item-based
     * @param userId
     * @param n numero de articulos a obter
     * @return
     */
     public static List<Articulo> getSimilarArticles(Long articleId, int n) {

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
            List<RecommendedItem> similarItems = recommender.mostSimilarItems(articleId, n);
            //            TasteUtils.printRecs(recommendations, map);

            if (similarItems.isEmpty()) {
                System.out.println("(Item-Based) Non se atoparon items similares");
            } else {
                System.out.println("(Item-Based) Similares:");
                for (RecommendedItem item : similarItems) {
                    Comparable<?> id = item.getItemID();
                    String title = map.get(id.toString());
                    System.out.println("\tId: " + id.toString() + ", Title: " + title);
                }
            }
            for (RecommendedItem item : similarItems) {
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

}
