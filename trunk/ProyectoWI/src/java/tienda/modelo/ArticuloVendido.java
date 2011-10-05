/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.modelo;

/**
 *
 * @author Vanesa
 */
public class ArticuloVendido {
    private Integer idArtVendido;
    private String codigoArticulo;
    private Integer unidades;
    private Float costeUnidad;
    private Integer idVenta;

    public String getCodigoArticulo() {
        return codigoArticulo;
    }

    public void setCodigoArticulo(String codigoArticulo) {
        this.codigoArticulo = codigoArticulo;
    }

    public Float getCosteUnidad() {
        return costeUnidad;
    }

    public void setCosteUnidad(Float costeUnidad) {
        this.costeUnidad = costeUnidad;
    }

    public Integer getIdArtVendido() {
        return idArtVendido;
    }

    public void setIdArtVendido(Integer idArtVendido) {
        this.idArtVendido = idArtVendido;
    }

    public Integer getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Integer idVenta) {
        this.idVenta = idVenta;
    }

    public Integer getUnidades() {
        return unidades;
    }

    public void setUnidades(Integer unidades) {
        this.unidades = unidades;
    }


}
