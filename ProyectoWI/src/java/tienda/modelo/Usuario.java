/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tienda.modelo;

/**
 *
 * @author Vanesa
 */
public class Usuario
{

    private Integer idUsuario;
    private String nombre;
    private String password;
    private String telefono;
    private String email;
    private Boolean activo;
    private Integer idTipoUsuario;
    private Direccion direccion;
    private Float totalCompra;
    private String tipo;

    public Usuario()
    {
    }



    public Usuario(Integer idUsuario, String nombre, String password, String telefono, String email, Boolean activo, Integer idTipoUsuario, Float totalCompra)
    {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.password = password;
        this.telefono = telefono;
        this.email = email;
        this.activo = activo;
        this.idTipoUsuario = idTipoUsuario;
        this.totalCompra = totalCompra;

    }

    public Usuario(Integer idUsuario, String nombre, String password, String telefono, String email, Boolean activo, Integer idTipoUsuario, Direccion direccion, Float totalCompra)
    {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.password = password;
        this.telefono = telefono;
        this.email = email;
        this.activo = activo;
        this.idTipoUsuario = idTipoUsuario;
        this.direccion = direccion;
        this.totalCompra = totalCompra;
    }

    public Boolean getActivo()
    {
        return activo;
    }

    public void setActivo(Boolean activo)
    {
        this.activo = activo;
    }

    public Direccion getDireccion()
    {
        return direccion;
    }

    public void setDireccion(Direccion direccion)
    {
        this.direccion = direccion;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public Integer getIdTipoUsuario()
    {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(Integer idTipoUsuario)
    {
        this.idTipoUsuario = idTipoUsuario;
    }

    public Integer getIdUsuario()
    {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario)
    {
        this.idUsuario = idUsuario;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getTelefono()
    {
        return telefono;
    }

    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }

    public Float getTotalCompra()
    {
        return totalCompra;
    }

    public void setTotalCompra(Float totalCompra)
    {
        this.totalCompra = totalCompra;
    }

    public String getTipo()
    {
        return tipo;
    }

    public void setTipo(String tipo)
    {
        this.tipo = tipo;
    }
}
