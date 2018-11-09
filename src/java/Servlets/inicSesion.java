/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import config.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.net.URL;
import java.util.Properties;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nambr
 */
@WebServlet(name = "inicSesion", urlPatterns = {"/iniciarS"})
public class inicSesion extends HttpServlet {
//    private final IUsuario usuario = fabrica.getICtrlUsuario();
      
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
 PrintWriter out = response.getWriter();
 Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
        URL hola = new URL(http+ip+puerto+servicio1);
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
  
        
      HttpSession respuesta = request.getSession(true);
     if(respuesta.getAttribute("sesionAct")==null){
    
      String nick = request.getParameter("nick");
      if(nick!=null){
        
      String pass = request.getParameter("password");
     
      servicios.DtInfo resultado= port.resolverLogin(nick, pass);
    
 if (resultado.getTipoUser().equalsIgnoreCase("colaborador")){
 if(resultado.isEstLogin()){
     String checkcita= request.getParameter("rec");
       if(request.getParameter("rec")!=null){
            Cookie miCookie = new Cookie("usuario",nick);
    // hacemos que nuestra cookie tenga sentido durante un día
    miCookie.setMaxAge(60*60*24);
    response.addCookie(miCookie);
          }
      respuesta.setAttribute("sesionAct", resultado.getNick());
      respuesta.setAttribute("tipo", resultado.getTipoUser());
      respuesta.setAttribute("mensaje", resultado.getMensaje());
      
       this.getServletContext().getRequestDispatcher("/vistas/menu.jsp").forward(request, response);
 }
 
 else if(!resultado.isEstLogin()){
     respuesta.setAttribute("error", resultado.getMensaje());
     this.getServletContext().getRequestDispatcher("/vistas/IniciarS.jsp").forward(request, response);
    
 }
 }  else{
            request.setAttribute("error","proponente");
           this.getServletContext().getRequestDispatcher("/vistas/IniciarS.jsp").forward(request, response);
      }
    }
      else{
           this.getServletContext().getRequestDispatcher("/vistas/IniciarS.jsp").forward(request, response);
      }
      
       }else{
        this.getServletContext().getRequestDispatcher("/vistas/menu.jsp").forward(request, response);  
     }
      
    }
    
    static public servicios.DtUsuario getUsuarioLogueado(HttpServletRequest request) throws ServletException, IOException{
        
        String nick;
     nick = (String) request.getSession().getAttribute("sesionAct");
     servicios.PublicadorUsuariosService servicioUsuarios2 = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port32 = servicioUsuarios2.getPublicadorUsuariosPort();
        if(nick != null)
        {
            servicios.DtUsuario usr= port32.traerDtUsuario(nick);
        return usr;
        }
     return null;
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
