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
public class ArticuloPedido extends Articulo
{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cantidad;

    public ArticuloPedido()
    {
        super();
        cantidad = 1;
    }

    public ArticuloPedido(Articulo a)
    {
        this.cantidad = 1;
        this.setActivo(a.getActivo());
        this.setAlbum(a.getAlbum());
        this.setCodigoArticulo(a.getCodigoArticulo());
        this.setGrupo(a.getGrupo());
        this.setImagen(a.getImagen());
        this.setPais(a.getPais());
        this.setPrecio(a.getPrecio());
        this.setUnidades(a.getUnidades());
    }

    public Float getTotal(){
        return cantidad*this.getPrecio();
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;        
    }

    /*public void setCantidad(String cantidad) {
        if (cantidad!=null)
            this.cantidad=1;
        else
            this.cantidad = Integer.parseInt(cantidad);            
    }*/

//    public void setTodas(String disco){
//        StringTokenizer t = new StringTokenizer(disco, "|");
//        this.setGrupo(t.nextToken());
//        this.setAlbum(t.nextToken());
//        this.setPais(t.nextToken());
//        String str = t.nextToken();
//
//        str = str.replace('$', ' ').trim();
//        float precioUnidad = Float.valueOf(str);
//        this.setPrecio(precioUnidad);
//        this.cantidad=1;
//    }
}
