/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo;

import tienda.modelo.descuentos.Descuento;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author nessa
 */
public abstract class Compra {

    
    protected double precioIntermedio;
    protected List<Descuento> descuentos;
    
    protected Compra(){
        descuentos = new ArrayList<Descuento>();
    }

    public double getPrecioIntermedio() {
        return precioIntermedio;
    }
    
    
    public List<Descuento> getDescuentos() {
        return descuentos;
    }

    public void setDescuentos(List<Descuento> descuentos) {
        this.descuentos = descuentos;
    }

    public Double getPrecioTotal(){
        precioIntermedio = getPrecioSinDescuento();
        Collections.sort(descuentos);
        for(int i=0; i<descuentos.size(); i++){
            precioIntermedio = descuentos.get(i).getPrecioConDescuento();
        }
        return precioIntermedio;
    }
    
    public Compra integrarDescuentosEnCopia() throws CloneNotSupportedException{
        Compra clon = (Compra)clone();
        clon.integrarDescuentos();
        return clon;
    }
    
    public abstract void integrarDescuentos() throws CloneNotSupportedException;
    public abstract double getPrecioSinDescuento();
    
    @Override
    protected abstract Object clone() throws CloneNotSupportedException;

}
