/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo;

/**
 *
 * @author nessa
 */
public class Valoracion {
    
    public String tituloPelicula;
    public String usuario;
    public int idUsuario;
    public int idPelicula;
    public int valoracion;

    public Valoracion(String tituloPelicula, String usuario, int valoracion) {
        this.tituloPelicula = tituloPelicula;
        this.usuario = usuario;
        this.valoracion = valoracion;
    }
    
    public Valoracion(String titulo, int idPelicula, String nombreUsuario, 
            int idUsuario, int valoracion ){
        this(titulo, nombreUsuario, valoracion);
        this.idPelicula = idPelicula;
        this.idUsuario = idUsuario;
    }

    public String getTituloPelicula() {
        return tituloPelicula;
    }

    public void setTituloPelicula(String tituloPelicula) {
        this.tituloPelicula = tituloPelicula;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getValoracion() {
        return valoracion;
    }

    public void setValoracion(int valoracion) {
        this.valoracion = valoracion;
    }

    public int getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(int idPelicula) {
        this.idPelicula = idPelicula;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
    
}
