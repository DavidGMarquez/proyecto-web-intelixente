/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tienda.modelo;

//import java.util.StringTokenizer;

/**
 *
 * @author Vanesa
 */
public class Pedido
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

    public Float getTotal(){
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
}
