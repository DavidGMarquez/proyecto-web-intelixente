/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo.descuentos;

import tienda.modelo.Compra;

/**
 *
 * @author nessa
 */
public abstract class Descuento<T extends Compra> implements Comparable<Descuento> {

    
    
    protected int prioridad = 0;
    protected T compra;

    public T getCompra() {
        return compra;
    }

    public void setCompra(T compra) {
        this.compra = compra;
    }
    
    protected Descuento(T compra){
        this.compra = compra;
    }
    
    /** 
     * Cuanto mayor el el número, mayor prioridad tiene
     * @return 
     */
    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }
    
    /**
     * Se calcula el descuento independientemente de si la oferta está vigente
     * @return 
     */
    protected abstract double calculoDescuento();
    
    /**
     * Comprueba si la oferta es aplicable en función de ciertas propiedades. 
     * Por ejemplo, para la oferta 3x2 tienen que seguir estando en la cesta los
     * tres productos.
     * @return 
     */
    public abstract boolean esAplicable();
    
    
    public abstract void integrarDescuento();
    
    /**
     * Devuelve el descuento real (con comprobación de si el descuento se puede
     * aplicar, para lo que llama a la función esAplicable).
     * @return la cantidad de descuento (si no es aplicable 0)
     */
    public double getDescuento(){
        if(esAplicable()){
            return calculoDescuento();
        }
        return 0.0;
    }
    
    /**
     * Calcula el precio con descuento real
     * @return 
     */
    public double getPrecioConDescuento(){
        return compra.getPrecioIntermedio() - getDescuento();
    }
    
    
    @Override
    public int compareTo(Descuento o) {
        Integer prio = o.getPrioridad();
        return prio.compareTo(this.prioridad)*(-1);   
    }

    @Override
    public abstract Object clone() throws CloneNotSupportedException;
    
    public abstract void actualizar();
    
    
}
