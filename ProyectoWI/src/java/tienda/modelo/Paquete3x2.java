package tienda.modelo;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Vane
 */
public class Paquete3x2 {
    private ArrayList<Articulo> articulos;
    private int cantidad = 1;
    private int index;
    private String codigoPack;
    
    public Paquete3x2(ArrayList<Articulo> articulos){
        this.articulos = articulos;
        Collections.sort(articulos);
        calcularIndice();
        setCodigoPack();
    }
    
    /*public Paquete3x2(Articulo a1, Articulo a2, Articulo a3){
        this.articulos = new ArrayList<Articulo>();
        this.articulos.add(a1);
        this.articulos.add(a2);
        this.articulos.add(a3);
        Collections.sort(articulos);
        calcularIndice();
    }*/
    
    public ArrayList<Articulo> getArticulos(){
        return articulos;
    }
    
    public int getCantidad(){
        return this.cantidad;
    }
    
    public void up(){
        this.cantidad++;
    }
    
    public void down(){
        this.cantidad--;
    }
    
    private void calcularIndice(){
        index = 0;
        double precio = articulos.get(0).getPrecio();
        for(int i=1; i<3; i++){
            if(precio>articulos.get(i).getPrecio()){
                precio=articulos.get(i).getPrecio();
                index=i;
            }
        }
    }
    
    public boolean contieneArticulo(String codigoArticulo){
        for(int i=0; i<3; i++){
            if(articulos.get(i).getCodigoArticulo().equals(codigoArticulo)){
                return true;
            }
        }
        return false;
    }
    
    public double getPrecioUnidad(){
        double total = 0;
        for(int i=0; i<3; i++){
            total += articulos.get(i).getPrecio();
        }
        return (total - articulos.get(index).getPrecio()) ;
    }
    
    public double getTotal(){
        return getPrecioUnidad()*cantidad ;
    }

    public double getTotalDescuento(){
        return articulos.get(index).getPrecio()*cantidad ;
    }
    
    public String getTitulo(){
        return getArticulos().get(0).getPelicula().getTitulo() + ", "
            + getArticulos().get(1).getPelicula().getTitulo() + " y " 
            + getArticulos().get(2).getPelicula().getTitulo();
    }
    
    private void setCodigoPack(){
        this.codigoPack = getArticulos().get(0).getCodigoArticulo() + "-"
            +  getArticulos().get(1).getCodigoArticulo() + "-"
            + getArticulos().get(2).getCodigoArticulo();
    }
    
    public String getCodigoPack(){
        return codigoPack;
    }
    
    @Override
    public boolean equals(Object obj) {
        if(obj == null) return false;
        if(obj instanceof Paquete3x2){
            ArrayList<Articulo> articulos2 = ((Paquete3x2)obj).getArticulos();
            return (articulos2.contains(articulos.get(0)) 
                    && articulos2.contains(articulos.get(1))
                    && articulos2.contains(articulos.get(2)));
        }
        return super.equals(obj);
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + (this.articulos != null ? this.articulos.hashCode() : 0);
        return hash;
    }
}
