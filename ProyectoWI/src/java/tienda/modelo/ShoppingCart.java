package tienda.modelo;

import java.util.*;
//Clase que identifica la cesta de la compra
public class ShoppingCart
{

    private ArrayList<ArticuloPedido> cesta;
    private double precioTotal;

    public ShoppingCart()
    {
        cesta = new ArrayList<ArticuloPedido>();
    }

    public synchronized boolean up(Articulo pedido)
    {
        ArticuloPedido dp = new ArticuloPedido(pedido);
        for (int i = 0; i < cesta.size(); i++)
        {
            if (cesta.get(i).getCodigoArticulo().equalsIgnoreCase(pedido.getCodigoArticulo()))
            {
                if (pedido.getUnidades() > cesta.get(i).getCantidad())
                {   
                    cesta.get(i).setCantidad(cesta.get(i).getCantidad() + 1);
                    return true;
                }
                else
                {
                    return false;
                }

            }
        }
        cesta.add(dp);
        return true;
    }

    public synchronized void down(Articulo pedido)
    {
        //ArticuloPedido dp = new ArticuloPedido(pedido);
        for (int i = 0; i < cesta.size(); i++)
        {
            if (cesta.get(i).getCodigoArticulo().equalsIgnoreCase(pedido.getCodigoArticulo()))
            {
                cesta.get(i).setCantidad(cesta.get(i).getCantidad() - 1);
                if (cesta.get(i).getCantidad() < 1)
                {
                    delete(cesta.get(i));
                }
                return;
            }
        }

    }

    public synchronized void delete(ArticuloPedido dp)
    {
        cesta.remove(dp);

    }

    public double getPrecioTotal()
    {
        precioTotal = 0;

        for (int i = 0; i < cesta.size(); i++)
        {
            precioTotal += cesta.get(i).getTotal();
        }
        return (Double) precioTotal;

    }

    public ArrayList<ArticuloPedido> getCesta()
    {
        return cesta;
    }
}