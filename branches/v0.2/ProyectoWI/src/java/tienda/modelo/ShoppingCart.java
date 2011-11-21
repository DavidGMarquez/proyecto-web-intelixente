package tienda.modelo;

import java.util.*;
//Clase que identifica la cesta de la compra
public class ShoppingCart
{

    private HashMap<String,Pedido> cesta;
    //private ArrayList<Paquete3x2> paquetes;
    private HashMap<String, Paquete3x2> paquetes;
    private double precioTotal;
    private int descuento;

    public ShoppingCart()
    {
        cesta = new HashMap<String, Pedido>();
        //paquetes = new ArrayList<Paquete3x2>();
        paquetes = new HashMap<String, Paquete3x2>();
    }
    
    public void setDescuento(int descuento){
        if(descuento >= 0 && descuento <= 100){
            this.descuento = descuento;
        }
    }
    
    public synchronized boolean upPaquete(String codigoPaquete){
        if(paquetes.containsKey(codigoPaquete)){
            if(hayStock(paquetes.get(codigoPaquete))){
                paquetes.get(codigoPaquete).up();
                return true;
            }
        }
        return false;
    }
    
    public synchronized void downPaquete(String codigoPaquete){
        if(paquetes.containsKey(codigoPaquete)){
            paquetes.get(codigoPaquete).down();
            if(paquetes.get(codigoPaquete).getCantidad()<1){
                paquetes.remove(codigoPaquete);
            }
        }
    }
    
    public synchronized boolean upPaquete(Paquete3x2 pack){
        if(hayStock(pack)){
            if(paquetes.containsKey(pack.getCodigoPack())){
                paquetes.get(pack.getCodigoPack()).up();
                return true;
            }
            paquetes.put(pack.getCodigoPack(), pack);
            return true;
        }
        return false;
    }

    public synchronized void downPaquete(Paquete3x2 pack){
        if(paquetes.containsKey(pack.getCodigoPack())){
            paquetes.get(pack.getCodigoPack()).down();
            if(paquetes.get(pack.getCodigoPack()).getCantidad() < 1){
                paquetes.remove(pack.getCodigoPack());
            }
        }
    }

    public synchronized void down(Articulo pedido) {
        if(cesta.containsKey(pedido.getCodigoArticulo())){
            cesta.get(pedido.getCodigoArticulo()).down();
            if(cesta.get(pedido.getCodigoArticulo()).getCantidad() < 1){
                cesta.remove(pedido.getCodigoArticulo());
            }
        }
    }
    
    public synchronized boolean up(Articulo pedido) {
        Pedido dp = new Pedido(pedido);
        if(cesta.containsKey(pedido.getCodigoArticulo())){
            if(hayStock(pedido)){
                cesta.get(pedido.getCodigoArticulo()).up();
                return true;
            }else{
                return false;
            }
        }
        cesta.put(pedido.getCodigoArticulo(), dp);
        return true;
    }
    
    private boolean hayStock(Articulo articulo){
        String codigoArticulo = articulo.getCodigoArticulo();
        int total = 0;
        if(cesta.containsKey(codigoArticulo)){
            total = cesta.get(codigoArticulo).getCantidad();
        }
        ArrayList<Paquete3x2> paquetesArray = getPaquetes();
        for(int i=0;i<paquetesArray.size();i++){
            if(paquetesArray.get(i).contieneArticulo(codigoArticulo)){
                total+=paquetesArray.get(i).getCantidad();
            }
        }
        //Comprobar en la cesta
        return (articulo.getUnidades() > total);
    }
    
    private boolean hayStock(Paquete3x2 pack){
        return (hayStock(pack.getArticulos().get(0))
                && hayStock(pack.getArticulos().get(1))
                && hayStock(pack.getArticulos().get(2)));
        
    }
    
    /*private synchronized void delete(String codigoArticulo)
    {
        cesta.remove(codigoArticulo);
    }

    /*public synchronized void delete(Pedido dp)
    {
        cesta.remove(dp.getArticulo().getCodigoArticulo());
    }*/
    
    private double getPrecioTotalSinDescuento(){
        precioTotal = 0;
        ArrayList<Pedido> cestaArray = getCesta();
        for (int i = 0; i < cestaArray.size(); i++) {
            precioTotal += cestaArray.get(i).getTotal();
        }
        ArrayList<Paquete3x2> paquetesArray = getPaquetes();
        for (int i = 0; i < paquetesArray.size(); i++) {
            precioTotal += paquetesArray.get(i).getTotal();
        }
        return (Double) precioTotal * (1 - descuento/100);
    }
    
    private double getDescuentoPacks(){
        ArrayList<Paquete3x2> paquetesArray = getPaquetes();
        double total = 0;
        for(int i=0; i<paquetesArray.size(); i++){
            total += paquetesArray.get(i).getTotalDescuento();
        }
        return total;
    }

    public double getPrecioTotal() {
        return getPrecioTotalSinDescuento() * (1 - descuento/100);
    }
    
    public double getDescuento(){
        return getDescuentoPacks() + getPrecioTotalSinDescuento()*descuento/100;
    }
    
    public double getSubtotal(){
        return getPrecioTotalSinDescuento() + getDescuentoPacks();
    }

    public ArrayList<Pedido> getCesta()
    {
        return new ArrayList<Pedido>(cesta.values());
    }
    
    public ArrayList<Paquete3x2> getPaquetes(){
        return new ArrayList<Paquete3x2>(paquetes.values());
    }
}