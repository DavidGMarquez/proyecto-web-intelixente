/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.modelo;

//import java.util.StringTokenizer;

import java.util.Collections;


/**
 *
 * @author Vanesa
 */
public class Pedido extends Compra
{
    /**
	 * 
	 */
    private static final long serialVersionUID = 1L;
    
    private Integer cantidad;
    private Articulo articulo;

    public Pedido(){
        super();
        cantidad = 1;
        articulo = new Articulo();
    }

    public Pedido(Articulo a) {
        this.cantidad = 1;
        this.articulo = a;
    }
   
    @Override
    public double getPrecioSinDescuento(){
        return cantidad*articulo.getPrecio();
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;        
    }
    
    public void setArticulo(Articulo articulo){
        this.articulo = articulo;
    }
    
    public Articulo getArticulo(){
        return articulo;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        Pedido clon = new Pedido();
        clon.setCantidad(cantidad.intValue());
        clon.setArticulo((Articulo)articulo.clone());
        return clon;
    }

    @Override
    public void integrarDescuentos() throws CloneNotSupportedException {
        Collections.sort(descuentos);
        for(int i=0; i<descuentos.size(); i++){
            descuentos.get(i).integrarDescuento();
        }
    }
}
