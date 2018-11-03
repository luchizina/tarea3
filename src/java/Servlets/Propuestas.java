package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.List;
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
    servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService();
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            // LISTAR PROPUESTAS 
            if (request.getParameter("T") == null) {
            
                List<servicios.DtPropuesta> x = port3.listarPropuestasWeb().getListita();
                request.setAttribute("propuestas", x);
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
                request.setAttribute("propu", p_consulta);
                this.getServletContext().getRequestDispatcher("/vistas/prop_info.jsp").forward(request, response);
          
                }
               
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
