/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dao.NoticiaDAO;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Noticia;

/**
 *
 * @author vrebo
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.err.println(request.getServletPath());
        RequestDispatcher despachador = null;
        switch (request.getServletPath()) {
            case "/IniciarSesion.do":
                String usuario = request.getParameter("usuario");
                String contraseña = request.getParameter("contrasenia");
                System.out.println("usuario = " + usuario);
                System.out.println("contraseña = " + contraseña);
                despachador = request.getRequestDispatcher("/MuestraNoticias.do");
                break;
            case "/RegistraNoticia.do":
                String titulo = request.getParameter("titulo");
                String autor = request.getParameter("autor");
                String contenido = request.getParameter("contenido");
                Noticia noticia = new Noticia(titulo, contenido, new Date(), autor);
                NoticiaDAO.altaNoticia(noticia);
                despachador = request.getRequestDispatcher("/MuestraNoticias.do");
                break;
            case "/MuestraNoticias.do":
                List<Noticia> listaNoticias = NoticiaDAO.getNoticias();
                System.out.println(listaNoticias.size());
                request.setAttribute("listaNoticias", listaNoticias);
                despachador = request.getRequestDispatcher("/jsp/noticias.jsp");
                break;
            case "/EliminarNoticia.do":
                System.out.println("Eliminando noticia");
                long id = Long.parseLong(request.getParameter("id_noticia"));
                NoticiaDAO.eliminarNoticia(id);
                despachador = request.getRequestDispatcher("/MuestraNoticias.do");
                break;
        }
        despachador.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
