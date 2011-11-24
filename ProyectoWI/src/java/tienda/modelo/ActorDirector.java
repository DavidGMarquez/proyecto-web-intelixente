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
public class ActorDirector implements Serializable{
    protected String id;
    protected String nombre;
    
    public ActorDirector(String nombre){
        this.nombre = nombre;
        this.setId();
    }

    public ActorDirector(String id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public String getId() {
        return id;
    }
    
    protected final void setId(){
        if(nombre != null && !nombre.isEmpty())
            this.id = nombre.toLowerCase().replace(' ', '_');
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
