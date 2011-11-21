/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.Helpers;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import tienda.DAO.UsuarioDAO;
import tienda.modelo.Direccion;
import tienda.modelo.TipoUsuario;
import tienda.modelo.Usuario;
import util.Email;

/**
 *
 * @author Vanesa
 */
public class UsuarioHelper {

    private UsuarioDAO uDAO = new UsuarioDAO();
    /*private UsuarioDAO ud;

    public UsuarioHelper()
    {
    ud = new UsuarioDAO();
    }*/

    /*public boolean loguear(Usuario usuario)
    {
    List<Usuario> listaUsuarios = findUsuarios();
    for (int i = 0; i < listaUsuarios.size(); i++)
    {
    // También hay que comprobar que esté activo
    if (usuario.getEmail().equalsIgnoreCase(listaUsuarios.get(i).getEmail())
    && usuario.getPassword().equalsIgnoreCase(listaUsuarios.get(i).getPassword()))
    {
    usuario = listaUsuarios.get(i);
    if (usuario.getActivo())
    {
    return true;
    }
    else
    {
    //usuario = null;
    return false;
    }
    }
    }
    return false;
    }*/
    public Usuario loguear(HttpServletRequest request) {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        Usuario u = new Usuario();

        Integer idUsuario = uDAO.existeUsuario(email, pass);
        if (idUsuario != null) {
            u = uDAO.findUsuarioById(idUsuario);
        } else {
            u = null;
        }
        return u;
    }

    public Usuario generarUsuario(HttpServletRequest request) {
        Usuario usuario = new Usuario();
        usuario.setEmail(request.getParameter("email"));
        usuario.setPassword(request.getParameter("password"));
        if (uDAO.existeUsuario(usuario.getEmail(), usuario.getPassword()) == null) {
            usuario.setNombre(request.getParameter("nombre"));

            usuario.setTelefono(request.getParameter("telefono"));
            usuario.setTipo("basic");

            Direccion direccion = new Direccion();
            direccion.setDireccion(request.getParameter("calle"));
            direccion.setLocalidad(request.getParameter("localidad"));
            direccion.setProvincia(request.getParameter("provincia"));
            direccion.setCp(request.getParameter("cp"));

            usuario.setDireccion(direccion);
            return usuario;
        }
        /*List<Usuario> listaUsuarios = findUsuarios();
        for (int i = 0; i < listaUsuarios.size(); i++)
        {
        // También hay que comprobar que esté activo
        if (usuario.getEmail().equalsIgnoreCase(listaUsuarios.get(i).getEmail())
        && usuario.getPassword().equalsIgnoreCase(listaUsuarios.get(i).getPassword()))
        {
        usuario = listaUsuarios.get(i);

        }
        }*/
        return null;
    }

    // Sin probar si funciona lo del email.
    public boolean registrar(Usuario usuario) {
        //List<Usuario> listaUsuarios = findUsuarios();
        /*for (int i = 0; i < listaUsuarios.size(); i++) {
        if (usuario.getEmail().equalsIgnoreCase(listaUsuarios.get(i).getEmail())) {
        return false;
        }
        }*/
        Boolean r = uDAO.insertarUsuario(usuario);
        if (r) {
            Email e = new Email();
            String mensaje = "Se ha dado de alta en Tienda DAWA.";
            e.enviaMail(usuario.getEmail(), mensaje, "Registro de usuario");
            return true;
        } else {
            return false;
        }
    }

    public List<Usuario> findUsuarios() {
        List<Usuario> l;
        l = uDAO.findUsuarios();
        return l;
    }

    public HttpSession listaUsuarios(HttpSession session, HttpServletRequest request) {
        List<Usuario> l;

        l = uDAO.findUsuarios();
        Integer registros = 4;

        Integer paginas = l.size() / registros;
        if (l.size() % registros > 0) {
            paginas = paginas + 1;
        }

        String pagina = request.getParameter("pagina");
        if (pagina == null) {
            pagina = "1";
        }
        session.setAttribute("usuarios", l);
        session.setAttribute("paginas", paginas);
        session.setAttribute("pagina", pagina);
        session.setAttribute("registros", registros);
        return session;
    }

    public boolean activarUsuario(Integer idUsuario, Boolean activar) {
        uDAO.activarUsuario(idUsuario, activar);
        return true;
    }

    public Usuario findUsuarioById(Integer idUsuario) {
        Usuario u;
        u = uDAO.findUsuarioById(idUsuario);
        return u;
    }

    public HttpSession modificarUsuario(HttpSession session, HttpServletRequest request, Integer idUsuario) {
        Boolean activo;
        if (request.getParameter("activo") == null || request.getParameter("activo").equalsIgnoreCase("false")) {
            activo = false;
        } else {
            activo = true;
        }
        Usuario u = new Usuario(idUsuario,
                request.getParameter("nombre"),
                request.getParameter("password"),
                request.getParameter("telefono"),
                request.getParameter("email"),
                activo,
                Integer.parseInt(request.getParameter("idTipoUsuario")),
                Double.parseDouble(request.getParameter("totalCompra")));
        String idDireccionS = request.getParameter("idDireccion");
        Integer idDireccion = null;
        if (idDireccionS != null) {
            idDireccion = Integer.parseInt(idDireccionS.trim());
        }
        Direccion d = new Direccion();
        d.setIdDireccion(idDireccion);
        d.setDireccion(request.getParameter("direccion"));
        d.setLocalidad(request.getParameter("localidad"));
        d.setProvincia(request.getParameter("provincia"));
        d.setCp(request.getParameter("cp"));
        u.setDireccion(d);

        uDAO.modificarUsuario(u);
        return session;
    }

    public boolean borrarUsuario(Integer idUsuario) {
        uDAO.borrarUsuario(idUsuario);
        return true;
    }

    public List<TipoUsuario> findTiposUsuario() {
        List<TipoUsuario> l;
        l = uDAO.findTiposUsuario();
        return l;
    }

    public boolean cambiaPassUsuario(Integer idUsuario, String pass) {
        return uDAO.cambiaPassUsuario(idUsuario, pass);
    }
}
