/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.modelo;

/**
 *
 * @author Vanesa
 */
public class TipoUsuario {
    private Integer idTipoUsuario;
    private String tipoUsuario;

    public TipoUsuario(Integer idTipoUsuario, String tipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
        this.tipoUsuario = tipoUsuario;
    }

    public TipoUsuario(){}

    public Integer getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(Integer idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    
}
