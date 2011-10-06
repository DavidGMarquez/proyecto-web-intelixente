/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda;

/**
 *
 * @author Vanesa
 */
public class Error {
    private String titulo;
    private String texto;
    private String url;

    public Error(String titulo, String texto, String url) {
        this.titulo = titulo;
        this.texto = texto;
        this.url = url;
    }

    public Error(){}

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
}
