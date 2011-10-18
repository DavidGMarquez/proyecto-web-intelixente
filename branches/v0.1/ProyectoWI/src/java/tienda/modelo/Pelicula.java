package tienda.modelo;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author nessa
 */
public class Pelicula implements Serializable{
    
    /* Atributos
     * ---------------------------------- */
    private Integer id;
    private String titulo;
    private ArrayList<String> paises;
    private ArrayList<String> actores;
    private ArrayList<String> directores;
    private ArrayList<String> generos;
    private Integer anho;
    private String imagen;
    
    
    /* Constructores
     * ---------------------------------- */
    public Pelicula(){
        this.actores = new ArrayList<String>();
        this.directores = new ArrayList<String>();
        this.generos = new ArrayList<String>();
        this.paises = new ArrayList<String>();
    }
    public Pelicula(Integer id, String titulo, Integer anho, String imagen){
        this();
        this.id=id;
        this.titulo = titulo;
        this.anho = anho;
        this.imagen = imagen;
    }
    
    /* Getters & setters
     * ---------------------------------- */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public ArrayList<String> getActores() {
        return actores;
    }

    public void setActores(ArrayList<String> actores) {
        this.actores = actores;
    }

    public ArrayList<String> getDirectores() {
        return directores;
    }

    public void setDirectores(ArrayList<String> directores) {
        this.directores = directores;
    }
    
    public ArrayList<String> getGeneros() {
        return generos;
    }

    public void setGeneros(ArrayList<String> generos) {
        this.generos = generos;
    }
    
    public ArrayList<String> getPaises() {
        return paises;
    }

    public void setPaises(ArrayList<String> paises) {
        this.paises = paises;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getAnho() {
        return anho;
    }

    public void setAnho(Integer anho) {
        this.anho = anho;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
