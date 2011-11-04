/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo.descuentos;

import java.util.ArrayList;
import tienda.modelo.Articulo;
import tienda.modelo.ShoppingCart;

/**
 *
 * @author nessa
 */
public class DescuentoCesta3x2 extends Descuento<ShoppingCart>{
    public ArrayList<Articulo> articulos;
    public int index;
    
    private DescuentoCesta3x2(ShoppingCart cesta){
        super(cesta);
        articulos = new ArrayList<Articulo>();
        this.prioridad = 1;
    }
    
    public DescuentoCesta3x2(ShoppingCart cesta, ArrayList<Articulo> articulos){
        super(cesta);
        this.articulos = articulos;
        calcularIndice();
    }
    
    public DescuentoCesta3x2(ShoppingCart cesta, Articulo a1, Articulo a2, Articulo a3){
        this(cesta);
        articulos.add(a1);
        articulos.add(a2);
        articulos.add(a3);
        calcularIndice();
    }
    
    private void calcularIndice(){
        index = 0;
        double precio = articulos.get(0).getPrecio();
        for(int i=1; i<articulos.size(); i++){
            if(articulos.get(i).getPrecio() < precio){
                precio = articulos.get(i).getPrecio();
                index = i;
            }
        }
    }
    
    @Override
    public boolean esAplicable(){
        return compra.tieneArticulo(articulos.get(0).getCodigoArticulo()) 
                && compra.tieneArticulo(articulos.get(1).getCodigoArticulo()) 
                && compra.tieneArticulo(articulos.get(2).getCodigoArticulo());
    }

    @Override
    protected double calculoDescuento() {
        return articulos.get(index).getPrecio();
    }

    @Override
    public void integrarDescuento() {
        if(esAplicable())
            articulos.get(index).setPrecio(0);
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        ArrayList<Articulo> aClon = (ArrayList<Articulo>)articulos.clone();
        DescuentoCesta3x2 clon = new DescuentoCesta3x2(compra, aClon);
        clon.index = this.index;
        clon.prioridad = this.prioridad;
        //Actualizar clon
        clon.actualizar();
        return clon;
    }

    @Override
    public void actualizar(){
        for(int i=0; i<articulos.size(); i++){
            String cod = articulos.get(i).getCodigoArticulo();
            articulos.set(i, this.compra.getPedido(cod).getArticulo());
        }
    }
    
    
}
