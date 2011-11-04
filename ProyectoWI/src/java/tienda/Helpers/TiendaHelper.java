/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.ArrayList;
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
import tienda.modelo.descuentos.DescuentoCestaPorcentaje;
import tienda.modelo.Direccion;
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
    ArticuloDAO ad;
    List<Articulo> listaArticulos;

    public TiendaHelper(HttpSession session) {
        this.session = session;
        ad = new ArticuloDAO();
        listaArticulos = new ArrayList<Articulo>();
    }

    public List<Articulo> obtenerArticulos(Usuario u) {
        try {
            listaArticulos = ad.findArticulos(true, "");
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
            DireccionDAO dd = new DireccionDAO();
            int idDireccion = dd.insertarDireccion(d);
            String textoEmail = "Se confirma su compra:\n";
            
            if ("VIP".equalsIgnoreCase(u.getTipo())) {
                cart.getDescuentos().add(new DescuentoCestaPorcentaje(cart,0.8));
            }

            //Compruebo si hay stock
            /*for (int i = 0; i < cesta.size(); i++) {
                if (!ad.compruebaStock(cesta.get(i))) {
                    return false;
                }
            }*/
            
            // Insertar venta
            /*VenderDAO vd = new VenderDAO();
            int idVenta = vd.insertar(u.getIdUsuario(), idDireccion);*/

            // Insertar artículos vendidos
            ArticuloVendidoDAO avd = new ArticuloVendidoDAO();
            ad = new ArticuloDAO();
            if(avd.insertarCompra(cart, u, idDireccion)){
                for (int i = 0; i < cesta.size(); i++) {
                    textoEmail = textoEmail + "\t " + cesta.get(i).getArticulo().getPelicula().getTitulo()
                                + "\tunidades:" + cesta.get(i).getCantidad() + "\n";
                }
                double total = cart.getPrecioTotal();
                u.setTotalCompra(u.getTotalCompra() + total);
                textoEmail = textoEmail + "\nEl total de la compra es: " + total + "\n";
                if (u.getIdTipoUsuario() == 2 && u.getTotalCompra() > 100) {
                    u.setTipo("VIP");
                    u.setIdTipoUsuario(3);
                }

                // Actualizar usuario
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
