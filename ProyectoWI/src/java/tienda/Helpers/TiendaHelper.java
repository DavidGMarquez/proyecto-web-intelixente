/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import tienda.DAO.ArticuloDAO;
import tienda.DAO.ArticuloVendidoDAO;
import tienda.DAO.DireccionDAO;
import tienda.DAO.UsuarioDAO;
import tienda.DAO.VenderDAO;
import tienda.modelo.Articulo;
import tienda.modelo.Direccion;
import tienda.modelo.Paquete3x2;
import tienda.modelo.Pedido;
import tienda.modelo.ShoppingCart;
import tienda.modelo.Usuario;
import util.Email;

/**
 *
 * @author harry
 */
public class TiendaHelper {

    float descuento = (float) 20.0;
    HttpSession session;
    ArticuloDAO articuloDAO;
    List<Articulo> listaArticulos;

    public TiendaHelper(HttpSession session) {
        this.session = session;
        articuloDAO = new ArticuloDAO();
        listaArticulos = new ArrayList<Articulo>();
    }

	public List<Articulo> obtenerArticulos(Usuario u) {
        try {
            listaArticulos = articuloDAO.findArticulos(true, "");
            for (int i = 0; i < listaArticulos.size(); i++) {
                if (!listaArticulos.get(i).getActivo()) {
                    listaArticulos.remove(i);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(TiendaHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaArticulos;
    }

    public boolean pagar(Direccion d) {
        try {
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Usuario u = (Usuario) session.getAttribute("usuario");
            ArrayList<Pedido> cesta = cart.getCesta();
            // Insertar direccion
            DireccionDAO direccionDAO = new DireccionDAO();
            int idDireccion = direccionDAO.insertarDireccion(d);
            String textoEmail = "Se confirma su compra:\n";

            // Compruebo si hay stock
            // Construyo una lista de pedidos (ticket) que incluye los pedidos 
            // de los packs y de la cesta
            // Primero en la cesta
            HashMap<String,Pedido> ticket = new HashMap<String,Pedido>();
            for (int i=0;i<cesta.size(); i++){
                ticket.put(cesta.get(i).getArticulo().getCodigoArticulo(), 
                        new Pedido(cesta.get(i).getArticulo(),cesta.get(i).getCantidad()));
            }
            // Despues en los packs
            ArrayList<Paquete3x2> paquetes = cart.getPaquetes();
            for (int i = 0; i < paquetes.size(); i++) {
                for (int j=0; j<3; j++){
                    Articulo art = paquetes.get(i).getArticulos().get(j);
                    if(ticket.containsKey(art.getCodigoArticulo())){
                        ticket.get(art.getCodigoArticulo()).up(paquetes.get(i).getCantidad());
                    }else{
                        Pedido p = new Pedido(art, paquetes.get(i).getCantidad());
                        ticket.put(art.getCodigoArticulo(), p);
                    }
                }
            }
            //Ahora compruebo el stock con todos
            // TODO: la comprobación de stock e inserción de la compra en la bd
            // debería ser una transacción y no lo es
            Boolean seguir = true;
            ArrayList<Pedido> ticketArray = new ArrayList<Pedido>(ticket.values());
            for (int i = 0; i < ticketArray.size() && seguir; i++) {
                if (!articuloDAO.compruebaStock(ticketArray.get(i))) {
                    seguir = false;
                }
            }
            
            if (seguir) {
                // Insertar venta
                VenderDAO vd = new VenderDAO();
                int idVenta = vd.insertar(u.getIdUsuario(), idDireccion);

                // Insertar artículos vendidos
                ArticuloVendidoDAO avd = new ArticuloVendidoDAO();
                articuloDAO = new ArticuloDAO();
                for (int i = 0; i < cesta.size(); i++) {
                    if(cart.getDescuento() != 0){
                        cesta.get(i).getArticulo().
                                setPrecio((float) (cesta.get(i).getArticulo().getPrecio() 
                                * (1-cart.getDescuento())/100));
                    }
                    avd.insertarArticulo(cesta.get(i), idVenta);
                    Articulo a = cesta.get(i).getArticulo();
                    a.setUnidades(a.getUnidades() - cesta.get(i).getCantidad());
                    articuloDAO.modificarUnidades(a);
                    textoEmail = textoEmail + "\t " + cesta.get(i).getArticulo().getPelicula().getTitulo()
                            + "\tunidades:" + cesta.get(i).getCantidad() + "\n";
                }
                //paquetes
                textoEmail += "\n\n Packs 3x2:";
                for (int i = 0; i < paquetes.size(); i++) {
                    for (int j=0; i<paquetes.get(i).getArticulos().size(); i++){
                        Pedido p = new Pedido(paquetes.get(i).getArticulos().get(j));
                        double precio = p.getArticulo().getPrecio();
                        if(paquetes.get(i).getIndex() == j){
                            precio = 0.0;
                        }else if(cart.getDescuento() != 0){
                            precio = precio*(1-cart.getDescuento())/100;
                        }
                        avd.insertarArticulo(p, idVenta, precio);
                        Articulo a = p.getArticulo();
                        a.setUnidades(a.getUnidades() - p.getCantidad());
                        articuloDAO.modificarUnidades(a);
                        textoEmail = textoEmail + "\t " + p.getArticulo().getPelicula().getTitulo()
                                + "\tunidades:" + p.getCantidad() + "\n";
                    }
                }
                double total = cart.getPrecioTotal();
                u.setTotalCompra(u.getTotalCompra() + total);
                textoEmail = textoEmail + "\nEl total de la compra es: " + total + "\n";
                
                // Actualizamos el tipo del usuario
                if (u.getIdTipoUsuario() == 2 && u.getTotalCompra() > 100) {
                    u.setTipo("VIP");
                    u.setIdTipoUsuario(3);
                    cart.setDescuento(20);
                }
                cart.vaciar();
                session.setAttribute("cart", cart);
                
                // Actualizar usuario: actualiza el total de compra y el tipo de usuario
                new UsuarioDAO().actualizarEstadoUsuario(u);
                textoEmail = textoEmail + "\nGracias por su compra";
                Email e = new Email();
                e.enviaMail(u.getEmail(), textoEmail, "Compra confirmada");
                return true;
            } 
            return false;
        } catch (Exception ex) {
            Logger.getLogger(TiendaHelper.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }
}
