/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo;

import java.io.Serializable;

/**
 *
 * @author Vanesa
 */
public class Articulo implements Serializable, Comparable{
    /**
	 * 
	 */
    private static final long serialVersionUID = 8038336055575115281L;
    private String codigoArticulo;
    private double precio;
    private Boolean activo;
    private Integer unidades;
    private Pelicula pelicula;
    private Integer cluster;

    public Articulo(){}
    
    public Articulo(String codigoArticulo, double precio, Boolean activo, Integer unidades) {
        this();
        this.codigoArticulo = codigoArticulo;
        this.precio = precio;
        this.activo = activo;
        this.unidades = unidades;
    }
    
    public Articulo(String codigoArticulo, double precio, Boolean activo, Integer unidades, Integer cluster) {
        this(codigoArticulo, precio, activo, unidades);
        this.cluster = cluster;
    }
    
    /*public Articulo(String codigoArticulo, float precio, Boolean activo, Integer unidades, Integer cluster) {
        this();
        this.codigoArticulo = codigoArticulo;
        this.precio = precio;
        this.activo = activo;
        this.unidades = unidades;
    }*/
    
    public Articulo(String codigoArticulo, double precio, Boolean activo, 
            Integer unidades, Integer cluster, Pelicula pelicula) {
        this(codigoArticulo, precio, activo, unidades, cluster);
        this.pelicula = pelicula;
    }

    public Integer getIdPelicula(){
        return pelicula.getId();
    }
    

    public Integer getUnidades() {
        return unidades;
    }

    public void setUnidades(Integer unidades) {
        this.unidades = unidades;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }

    public String getCodigoArticulo() {
        return codigoArticulo;
    }

    public void setCodigoArticulo(String codigoArticulo) {
        this.codigoArticulo = codigoArticulo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public Pelicula getPelicula(){
        return pelicula;
    }
    
    public void setPelicula(Pelicula p){
        this.pelicula = p;
    }

     public Integer getCluster() {
        return cluster;
    }

    public void setCluster(Integer cluster) {
        this.cluster = cluster;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return new Articulo(codigoArticulo.toString(), precio, activo.booleanValue(), 
                unidades.intValue(), cluster.intValue(), pelicula);
    }
    
    @Override
    public boolean equals(Object obj) {
        if(obj == null) return false;
        if(obj instanceof Articulo){
            return (((Articulo)obj).getCodigoArticulo().equals(codigoArticulo));  
        }
        return false;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + (this.codigoArticulo != null ? this.codigoArticulo.hashCode() : 0);
        return hash;
    }

    @Override
    public int compareTo(Object o) {
        return codigoArticulo.compareTo(((Articulo)o).getCodigoArticulo());
    }
}
