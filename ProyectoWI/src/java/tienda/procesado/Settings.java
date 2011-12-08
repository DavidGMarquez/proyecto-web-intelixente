/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.procesado;

/**
 *
 * @author angel
 */
public class Settings {

    private static Settings instance = null;


    private Settings(){}

    public static Settings getSettings(){
        if(instance==null)
            instance = new Settings();

        return instance;
    }

    private int recommendationStrategy = RecommendationHelper.USER_BASED;
    private int clusteringStrategy = 0;

    /**
     * @return the recommendationStrategy
     */
    public int getRecommendationStrategy() {
        return recommendationStrategy;
    }

    /**
     * @param recommendationStrategy the recommendationStrategy to set
     */
    public void setRecommendationStrategy(int recommendationStrategy) {
        this.recommendationStrategy = recommendationStrategy;
    }

    /**
     * @return the clusteringStrategy
     */
    public int getClusteringStrategy() {
        return clusteringStrategy;
    }

    /**
     * @param clusteringStrategy the clusteringStrategy to set
     */
    public void setClusteringStrategy(int clusteringStrategy) {
        this.clusteringStrategy = clusteringStrategy;
    }
    

}
