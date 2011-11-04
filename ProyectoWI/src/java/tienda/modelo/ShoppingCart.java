package tienda.modelo;

import tienda.modelo.descuentos.Descuento;
import java.util.*;
//Clase que identifica la cesta de la compra
public class ShoppingCart extends Compra
{

    private HashMap<String,Pedido> cesta;
    
    public ShoppingCart()
    {
        super();
        cesta = new HashMap<String, Pedido>();
    }
    
    private void setCesta(HashMap<String,Pedido> cesta){
        this.cesta = cesta;
    }

    public synchronized boolean up(Articulo pedido)
    {
        Pedido dp = new Pedido(pedido);
        Pedido pedidoCesta = cesta.get(pedido.getCodigoArticulo());
        if(pedidoCesta != null){
            if(pedido.getUnidades() <= pedidoCesta.getCantidad()){
                return false;
            }
            pedidoCesta.setCantidad(pedidoCesta.getCantidad() + 1);
        }else{
            cesta.put(pedido.getCodigoArticulo(), dp);
        }
        return true;
    }
    
    
    public synchronized boolean up(List<Articulo> pedidos){
        for(int i=0; i<pedidos.size(); i++){
            Articulo pedido = pedidos.get(i);
            Pedido pedidoCesta = cesta.get(pedidos.get(i).getCodigoArticulo());
            if (pedidoCesta != null && pedido.getUnidades() <= pedidoCesta.getCantidad())
            {   
                return false;
            }  
        }
        for(int i=0; i<pedidos.size(); i++){
            Pedido pedidoCesta = cesta.get(pedidos.get(i).getCodigoArticulo());
            Pedido dp = new Pedido(pedidos.get(i));
            if(pedidoCesta != null){
                pedidoCesta.setCantidad(pedidoCesta.getCantidad() + 1);
            }else{
                cesta.put(dp.getArticulo().getCodigoArticulo(), dp);
            }
        }
        return true;
    }

    public synchronized void down(Articulo pedido) {
        Pedido pedidoCesta = cesta.get(pedido.getCodigoArticulo());
        if(pedidoCesta != null){
            pedidoCesta.setCantidad(pedidoCesta.getCantidad() - 1);
            if(pedidoCesta.getCantidad() < 1){
                delete(pedidoCesta);
            }
        }
    }

    public synchronized void delete(Pedido dp) {
        cesta.remove(dp.getArticulo().getCodigoArticulo());
    }

    /**
     * No incluye los descuentos de cesta, sólo los de pedido
     * @return 
     */
    @Override
    public double getPrecioSinDescuento(){
        ArrayList<Pedido> array = getCesta();
        double precioTotal = 0;

        for (int i = 0; i < array.size(); i++)
        {
            precioTotal += array.get(i).getPrecioTotal();
        }
        return (Double) precioTotal;

    }

    public ArrayList<Pedido> getCesta(){
        return new ArrayList<Pedido>(cesta.values());
    }

    

    /*public HashMap<String, Pedido> getCestaHash() {
        return cesta;
    }*/
    
    public Pedido getPedido(String codigoArticulo){
        return cesta.get(codigoArticulo);
    }
    
    public boolean tieneArticulo(String codigoArticulo){
        return cesta.containsKey(codigoArticulo);
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        ShoppingCart clon = new ShoppingCart();
        //Clonamos la cesta
        HashMap<String,Pedido> cestaClon = new HashMap<String, Pedido>();
        Collection<Pedido> valores = cesta.values();
        Iterator<Pedido> it = valores.iterator();
        while(it.hasNext()){
            Pedido pedidoClon = (Pedido)it.next().clone();
            cestaClon.put(pedidoClon.getArticulo().getCodigoArticulo(), pedidoClon);
        }
        clon.setCesta(cestaClon);
        //Clonamos los descuentos
        for(int i=0;i<descuentos.size();i++){
            Descuento descuentoClon = (Descuento)descuentos.get(i).clone();
            descuentoClon.setCompra(clon);
            descuentoClon.actualizar();
            clon.getDescuentos().add(descuentoClon);
        }
        //Devolvemos el clon
        return clon; 
    }
    
    
    @Override
    public void integrarDescuentos() throws CloneNotSupportedException {
        //Integramos los descuentos de cada pedido
        ArrayList<Pedido> cestaArray = getCesta();
        for(int i=0; i<cestaArray.size(); i++){
            cestaArray.get(i).integrarDescuentosEnCopia();
        }
        //Integramos los descuentos propios
        Collections.sort(getDescuentos());
        for(int i=0; i<descuentos.size(); i++){
            descuentos.get(i).integrarDescuento();
        }
        //Borramos los descuentos
        descuentos = new ArrayList<Descuento>();

    }
}