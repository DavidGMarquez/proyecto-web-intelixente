/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo.descuentos;

import tienda.modelo.ShoppingCart;

/**
 *
 * @author nessa
 */
public class DescuentoCestaPorcentaje extends Descuento<ShoppingCart> {
    
    private double porcentaje;
    
    public DescuentoCestaPorcentaje(ShoppingCart cesta, double porcentaje){
        super(cesta);
        this.porcentaje = porcentaje;
        this.prioridad = 10;
    }

    @Override
    protected double calculoDescuento() {
        double descuento = 0;
        for(int i=0; i<compra.getCesta().size(); i++){
            descuento += compra.getCesta().get(i).getArticulo().getPrecio()
                    *compra.getCesta().get(i).getCantidad()
                    *porcentaje;
        }
        return descuento;
    }

    @Override
    public boolean esAplicable() {
        return true;
    }

    @Override
    public void integrarDescuento() {
        for(int i=0; i<compra.getCesta().size();i++){
            compra.getCesta().get(i).getArticulo().setPrecio(
                    compra.getCesta().get(i).getArticulo().getPrecio()*(1-porcentaje));
        }
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void actualizar() {}

    
    
}
