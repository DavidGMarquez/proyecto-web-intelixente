/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.procesado;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author angel
 */
public class MovieLensHelper {

    private static Map<String, String> movies = null;


    /**
     * Carga o id e o nome das peliculas do ficheiro de movielens nun map
     * @param path
     * @return
     */
    public static Map<String, String> loadMovies(String path) {
        if (movies == null) {
            BufferedReader br = null;
            try {
                movies = new HashMap<String, String>();
                br = new BufferedReader(new InputStreamReader(MovieLensHelper.class.getResourceAsStream(path)));

                String line = br.readLine(); // a primeira ten os nomes dos campos

                while ((line = br.readLine()) != null) {
                    String[] fields = line.split("\t");
                    movies.put(fields[0], fields[1]); // id, título
                }


            } catch (IOException ex) {
                Logger.getLogger(MovieLensHelper.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    br.close();
                } catch (IOException ex) {
                    Logger.getLogger(MovieLensHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return movies;
    }

    /**
     * @param originalRatingsFile
     * @param maxRecords
     */
    public static void generateRattingsFile(String originalRatingsFile, int maxRecords) {
        BufferedReader br = null;
        FileOutputStream fos = null;
        int records = 0;
        try {
            fos = new FileOutputStream(Properties.ratingsFile);
            br = new BufferedReader(new FileReader(originalRatingsFile));
            String line = br.readLine();
            while ((line = br.readLine()) != null && records < maxRecords) {
                String[] fields = line.split("\t");
                line = fields[0] + "\t" + fields[1] + "\t" + fields[2] + "\n";
                fos.write(line.getBytes());
                records++;
            }
        } catch (IOException ex) {
            Logger.getLogger(MovieLensHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                br.close();
                fos.close();
            } catch (IOException ex) {
                Logger.getLogger(MovieLensHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
