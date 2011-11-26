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
    private ArrayList<ActorDirector> actores;
    private ArrayList<ActorDirector> directores;
    private ArrayList<String> generos;
    private Integer anho;
    private String imagen;
    
    
    /* Constructores
     * ---------------------------------- */
    public Pelicula(){
        this.actores = new ArrayList<ActorDirector>();
        this.directores = new ArrayList<ActorDirector>();
        this.generos = new ArrayList<String>();
        this.paises = new ArrayList<String>();
    }
    public Pelicula(String titulo, Integer anho, String imagen){
        this();
        this.titulo = titulo;
        this.anho = anho;
        this.imagen = imagen;
    }
    public Pelicula(Integer id, String titulo, Integer anho, String imagen){
        this(titulo, anho, imagen);
        this.id=id;
    }
    
    /* Getters & setters
     * ---------------------------------- */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public ArrayList<ActorDirector> getActores() {
        return actores;
    }

    public void setActores(ArrayList<ActorDirector> actores) {
        this.actores = actores;
    }

    public ArrayList<ActorDirector> getDirectores() {
        return directores;
    }

    public void setDirectores(ArrayList<ActorDirector> directores) {
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
