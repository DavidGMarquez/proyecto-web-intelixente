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
public class Articulo implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 8038336055575115281L;
	private String codigoArticulo;
    private String grupo;
    private String album;
    private String pais;
    private float precio;
    private Boolean activo;
    private Integer unidades;
    private String imagen;
    private Integer anho;

    public Articulo(String codigoArticulo, String grupo, String album, String pais, float precio, Boolean activo, Integer unidades, String imagen,Integer anho) {
        this.codigoArticulo = codigoArticulo;
        this.grupo = grupo;
        this.album = album;
        this.pais = pais;
        this.precio = precio;
        this.activo = activo;
        this.unidades = unidades;
        this.imagen = imagen;
        this.anho=anho;
    }

    public Articulo(){}

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

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Integer getAnho() {
        return anho;
    }

    public void setAnho(Integer anho) {
        this.anho = anho;
    }

}
