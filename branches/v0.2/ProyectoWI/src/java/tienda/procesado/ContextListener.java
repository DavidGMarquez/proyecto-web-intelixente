/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.procesado;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author angel
 */
public class ContextListener implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        try{

            RecommendationHelper.printSomeThings();

        }catch(Exception e){

        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }

}
