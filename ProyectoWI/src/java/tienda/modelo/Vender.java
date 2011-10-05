/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.modelo;

import java.util.Date;

/**
 *
 * @author Vanesa
 */
public class Vender {
    private Integer idVenta;
    private Date fecha;
    private Integer idUsuario;

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Integer getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Integer idVenta) {
        this.idVenta = idVenta;
    }
    
}
