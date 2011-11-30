/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo;

import java.io.Serializable;

/**
 *
 * @author nessa
 */
public class PeliculaSimple  implements Serializable{
    int idPelicula;
    String titulo;

    public PeliculaSimple(int idPelicula, String titulo) {
        this.idPelicula = idPelicula;
        this.titulo = titulo;
    }

    public int getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(int idPelicula) {
        this.idPelicula = idPelicula;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    
}
