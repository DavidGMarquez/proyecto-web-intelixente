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

            //Compruebo si hay stock
            Boolean seguir = true;
            for (int i = 0; i < cesta.size(); i++) {
                if (!ad.compruebaStock(cesta.get(i))) {
                    seguir = false;
                }
            }
            if (seguir) {
                // Insertar venta
                VenderDAO vd = new VenderDAO();
                int idVenta = vd.insertar(u.getIdUsuario(), idDireccion);

                // Insertar artículos vendidos
                ArticuloVendidoDAO avd = new ArticuloVendidoDAO();
                ad = new ArticuloDAO();
                float total = 0;
                for (int i = 0; i < cesta.size(); i++) {
                    if ("VIP".equalsIgnoreCase(u.getTipo())) {
                        cesta.get(i).getArticulo().
                                setPrecio((float) (cesta.get(i).getArticulo().getPrecio() * 0.8));
                    }
                    avd.insertarArticulo(cesta.get(i), idVenta);
                    total += cesta.get(i).getTotal();
                    Articulo a = cesta.get(i).getArticulo();
                    a.setUnidades(a.getUnidades() - cesta.get(i).getCantidad());
                    ad.modificarUnidades(a);
                    textoEmail = textoEmail + "\t " + cesta.get(i).getArticulo().getPelicula().getTitulo()
                            + "\tunidades:" + cesta.get(i).getCantidad() + "\n";
                }
                u.setTotalCompra(u.getTotalCompra() + total);
                textoEmail = textoEmail + "\nEl total de la compra es: " + total + "\n";
                if (u.getIdTipoUsuario() == 2 && u.getTotalCompra() > 100) {
                    u.setTipo("VIP");
                    u.setIdTipoUsuario(3);
                    cart.setDescuento(20);
                    session.setAttribute("cart", cart);
                }
                // Actualizar usuario
                new UsuarioDAO().actualizarEstadoUsuario(u);
                textoEmail = textoEmail + "\nGracias por su compra";
                Email e = new Email();

                e.enviaMail(u.getEmail(), textoEmail, "Compra confirmada");
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            Logger.getLogger(TiendaHelper.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }
}
