/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Noticia;

/**
 *
 * @author vrebo
 */
public class NoticiaDAO {

    public static final String NOMBRE_TABLA;
    public static final String ID_NOTICIA;
    public static final String TITULO;
    public static final String CONTENIDO;
    public static final String FECHA_PUBLICACION;
    public static final String ID_AUTOR;

    private static final NoticiaDAO dao;

    static {
        dao = new NoticiaDAO("root", "");
        NOMBRE_TABLA = "noticia";
        ID_NOTICIA = "id_noticia";
        TITULO = "titulo";
        CONTENIDO = "contenido";
        FECHA_PUBLICACION = "fecha_publicacion";
        ID_AUTOR = "id_autor";
    }

    public static void altaNoticia(final Noticia noticia) {
        try {
            Connection con;
            PreparedStatement ps;
            String sql
                    = new StringBuilder("INSERT INTO noticia (titulo, contenido, fecha_publicacion, id_autor)")
                    .append(" VALUES (?, ?, ?, ?);").toString();

            con = dao.getConexion();
            ps = con.prepareStatement(sql);

            ps.setString(1, noticia.getTitulo());
            ps.setString(2, noticia.getContenido());
            ps.setDate(3,
                    new java.sql.Date(noticia.getFechaPublicacion().getTime()));
            ps.setString(4, noticia.getAutor());
            ps.execute();

        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
    }

    public static List<Noticia> buscarNoticias() {
        List<Noticia> listaNoticias = new ArrayList<>();
        Connection con;
        Statement stm;
        ResultSet rs;
        String sql
                = new StringBuilder("SELECT * FROM noticia;").toString();
        try {
            con = dao.getConexion();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            long id;
            String titulo, contenido, autor;
            Date fechaPublicacion;
            while (rs.next()) {
                id = rs.getLong(ID_NOTICIA);
                titulo = rs.getString(TITULO);
                contenido = rs.getString(CONTENIDO);
                fechaPublicacion = (Date) rs.getDate(FECHA_PUBLICACION);
                autor = rs.getString(ID_AUTOR);
                listaNoticias.add(
                        new Noticia(id, titulo, contenido, fechaPublicacion, autor));
            }
            rs.close();
            stm.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return listaNoticias;
    }

    public static void eliminarNoticia(long id) {
        Connection con = dao.getConexion();
        PreparedStatement ps;
        String sql = new StringBuilder("DELETE FROM noticia WHERE id_noticia = ?;").toString();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, (int) id);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void actualizarNoticia(Noticia noticia) {
        Connection con = dao.getConexion();
        PreparedStatement ps;
        String sql = new StringBuilder("UPDATE noticia SET titulo = ?, contenido = ?, id_autor = ?  WHERE id_noticia = ?;").toString();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, noticia.getTitulo());
            ps.setString(2, noticia.getContenido());
            ps.setString(3, noticia.getAutor());
            ps.setLong(4, noticia.getId());
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Noticia buscarPorId(long id) {
        Noticia noticia = null;
        Connection con = dao.getConexion();
        PreparedStatement ps;
        ResultSet rs;
        String query = new StringBuilder("SELECT * FROM noticia WHERE noticia.id_noticia = ?;").toString();
        try {
            ps = con.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            String titulo, contenido, autor;
            Date fechaPublicacion;
            while (rs.next()) {
                titulo = rs.getString(TITULO);
                contenido = rs.getString(CONTENIDO);
                fechaPublicacion = (Date) rs.getDate(FECHA_PUBLICACION);
                autor = rs.getString(ID_AUTOR);
                noticia = new Noticia(id, titulo, contenido, fechaPublicacion, autor);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return noticia;
    }

    private String usuario;
    private String contraseña;

    public NoticiaDAO(String usuario, String contraseña) {
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    private Connection getConexion() {
        try {
            String url = "jdbc:mysql://localhost:3306/notitec";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            return DriverManager.getConnection(url, usuario, contraseña);
        } catch (SQLException ex) {
            System.err.println(ex);
            return null;
        }
    }
}
