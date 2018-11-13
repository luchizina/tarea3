/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import config.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DataListColaboraciones;
import servicios.DtPropuesta;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "colaborar", urlPatterns = {"/colaborar"})
public class colaborar extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        Properties p = Utils.getPropiedades(request);
        String http = p.getProperty("http");
        String ip = p.getProperty("ipServices");
        String puerto = p.getProperty("puertoServ");
        String servicio1 = p.getProperty("serv1");
        String servicio2 = p.getProperty("serv2");
        String servicio3 = p.getProperty("serv3");

        URL hola = new URL(http + ip + puerto + servicio1);
        URL hola2 = new URL(http + ip + puerto + servicio2);
        URL hola3 = new URL(http + ip + puerto + servicio3);
        try {
            servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
            servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
            servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
            servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
            servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
            servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
            String monto = request.getParameter("monto");
            if(request.getParameter("monto") == null && request.getParameter("T") == null){
                List<DtPropuesta> propuaColaborar = port3.listarPropuestasWeb().getListita();
                request.setAttribute("propus", propuaColaborar);
                request.setAttribute("paso", "si");
                this.getServletContext().getRequestDispatcher("/vistas/propuestas.jsp").forward(request, response);
            }
            if (request.getParameter("monto") == null && request.getParameter("T") != null) {
                String titulo = request.getParameter("T");
                servicios.DtPropuesta propuestita = port3.traerPropuesta(titulo);
                request.setAttribute("tipoR", propuestita.getTRetornos());
                request.setAttribute("Titulo", titulo);
                request.setAttribute("paso", "si");
                this.getServletContext().getRequestDispatcher("/vistas/colaborar.jsp").forward(request, response);
            }
            if (monto != null) {
                String titulo = (String) request.getParameter("Titulo");
                String tipoR = (String) request.getParameter("tipoRetorno");
                String nick = (String) request.getSession().getAttribute("sesionAct");
                port3.altaColaboracion(titulo, nick, monto, tipoR);
                request.setAttribute("paso", "si");
                this.getServletContext().getRequestDispatcher("/vistas/menu.jsp").forward(request, response);
            }
        } catch (Exception EX) {
            request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
        }
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
