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
import java.net.URLDecoder;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

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
  request.setCharacterEncoding("UTF-8");
Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
String servicio2=p.getProperty("serv2");
String servicio3=p.getProperty("serv3");
//try{
//    
//
//        URL hola = new URL(http+ip+puerto+servicio1);
//        URL hola2 = new URL(http+ip+puerto+servicio2);
//        URL hola3 = new URL(http+ip+puerto+servicio3);
//        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
//        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
//        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
//        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
//        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
//        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
//}catch(Exception EX){
//    request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
//}
 HttpSession respuesta = request.getSession(true);
        Cookie [] cookies = request.getCookies();
         String identificador = ""; 
         if(cookies!= null){
        for (Cookie cookieActual : cookies) {
         identificador = cookieActual.getName();
           
            if(identificador.equals("usuario"))
            {
                respuesta.setAttribute("sesionAct",URLDecoder.decode(cookieActual.getValue(), "UTF-8") );
                request.setAttribute("paso", "si");
                request.getRequestDispatcher("/vistas/menu.jsp").forward(request, response);
               break; 
            }
           
        }
         }
 
     if(respuesta.getAttribute("sesionAct")==null && !(identificador.equals("usuario"))){
           request.setAttribute("paso", "si");
        request.getRequestDispatcher("/iniciarS").forward(request, response);
     }
     
     else if(respuesta.getAttribute("sesionAct") != null && !(identificador.equals("usuario")))
     {
         request.setAttribute("paso", "si");
                request.getRequestDispatcher("/vistas/menu.jsp").forward(request, response);
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
