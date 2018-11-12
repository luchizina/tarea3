package Servlets;

import config.Utils;
import java.io.IOException;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.List;
import java.util.Properties;
@WebServlet(name = "Propuestas", urlPatterns = {"/Propuestas"})
public class Propuestas extends HttpServlet {

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
        
        Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
String servicio2=p.getProperty("serv2");
String servicio3=p.getProperty("serv3");
try{
        URL hola = new URL(http+ip+puerto+servicio1);
        URL hola2 = new URL(http+ip+puerto+servicio2);
        URL hola3 = new URL(http+ip+puerto+servicio3);
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
      
        
        response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            // LISTAR PROPUESTAS 
            if (request.getParameter("T") == null) {
            
                List<servicios.DtPropuesta> x = port3.listarPropuestasWeb().getListita();
                request.setAttribute("propuestas", x);
                request.setAttribute("paso", "si");
                this.getServletContext().getRequestDispatcher("/vistas/pros.jsp").forward(request, response);
            } else {
            // CONSULTA A UNA PROPUESTA 
                String t = request.getParameter("T");
                String titulo = t.replace("+"," ");
                //boolean existe = IP.existeTitulo(titulo);
                boolean existe = port3.existePropuesta(titulo);
                if(existe){
                //DtPropuesta p_consulta = IP.SeleccionarProp(titulo);
                servicios.DtPropuesta p_consulta = port3.selccionarPropuesta(titulo);
                List<String> colaborador = port3.colaboradoresDePropuesta().getListita();
                request.setAttribute("propu", p_consulta);
                request.setAttribute("col", colaborador);    
                request.setAttribute("paso", "si");
                this.getServletContext().getRequestDispatcher("/vistas/prop_info.jsp").forward(request, response);
          
                }
               
    }
             }catch(Exception EX){
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
