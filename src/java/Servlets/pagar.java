package Servlets;

import config.Utils;
import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
@WebServlet(name = "pagar", urlPatterns = {"/pagar"})
public class pagar extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
String servicio2=p.getProperty("serv2");
String servicio3=p.getProperty("serv3");

        URL hola = new URL(http+ip+puerto+servicio1);
        URL hola2 = new URL(http+ip+puerto+servicio2);
        URL hola3 = new URL(http+ip+puerto+servicio3);
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
            
            // LISTAR PROPUESTAS 
            HttpSession respuesta = request.getSession(true);
         
            if (request.getParameter("T") == null) {
            servicios.DtUsuario user=inicSesion.getUsuarioLogueado(request);
                List<servicios.DtColaboracion> x = port.traerPropuestasColaboradasNoPagas2(user.getNick()).getListita();
                request.setAttribute("col", x);
                this.getServletContext().getRequestDispatcher("/vistas/pro_pagar.jsp").forward(request, response);
            
    } else{
                 String t = request.getParameter("T");
                 String titulo = t.replace("+"," ");
               
                 request.setAttribute("pro", titulo);
                   
             this.getServletContext().getRequestDispatcher("/vistas/pro_pag_prop.jsp").forward(request, response);
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
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
         Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
String servicio2=p.getProperty("serv2");
String servicio3=p.getProperty("serv3");
        URL hola = new URL(http+ip+puerto+servicio1);
        URL hola2 = new URL(http+ip+puerto+servicio2);
        URL hola3 = new URL(http+ip+puerto+servicio3);
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
             HttpSession respuesta = request.getSession(true);
         String t = request.getParameter("usuario");
         String nu = request.getParameter("num");
          String propu = request.getParameter("prop");
            String usu = request.getParameter("usu");
        if(t!=null && t.equals("proponente")){
             
             String retor= request.getParameter("tar");
              String cvc = request.getParameter("cvc");
                    
            
            SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");
            try {
              String a = request.getParameter("fecha");
               XMLGregorianCalendar parametro_fecha = null;
              if(!a.equals("")){
                Date fecha = formatoDeFecha.parse(a);
                GregorianCalendar parametro = new GregorianCalendar();
                parametro.setTime(fecha);
               
                parametro_fecha = DatatypeFactory.newInstance().newXMLGregorianCalendar(parametro);
              }
                

            if(nu.equals("") || propu.equals("") || retor.equals("") || cvc.equals("") || a.equals("") || usu.equals("")){
               request.setAttribute("error", "jaja");
               this.getServletContext().getRequestDispatcher("/vistas/pro_pagar.jsp").forward(request, response);
               
            }
            else{
             boolean ok = port3.pagarTarjeta2(nu, retor, parametro_fecha, cvc, propu, usu);
             if(ok){
                   request.setAttribute("ok", "jaja");
                  this.getServletContext().getRequestDispatcher("/vistas/pro_pagar.jsp").forward(request, response);
             }
             else{
             request.setAttribute("error", "jaja");
                  this.getServletContext().getRequestDispatcher("/vistas/pro_pag_prop.jsp").forward(request, response);
            
             }}
                     
                     
         } catch (ParseException | DatatypeConfigurationException ex) {
            Logger.getLogger(pagar.class.getName()).log(Level.SEVERE, null, ex);
        }
       }
        if(t != null && t.equals("colaborador")){
        String banco = request.getParameter("banco");
         boolean ok = port3.pagarTrans2(nu,banco,propu,usu);
       
        }
        if(t != null && t.equals("colaborador2")){
        String banco = request.getParameter("banco");
        boolean ok = port3.pagarPayPal2(nu,banco,propu,usu);
       
        }
        
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
