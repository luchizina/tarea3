<%@page import="java.text.SimpleDateFormat"%>
<%@page import="servicios.DtColaborador"%>
<%@page import="Servlets.inicSesion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <title> Pagar propuesta </title>
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    
<jsp:include page="/vistas/menu.jsp" />
  </head>
  <body style="background-color: #32383e" >
      <% servicios.DtUsuario userop=inicSesion.getUsuarioLogueado(request); // agregado servicios
 String sesionAct=(String) session.getAttribute("sesionAct");
 if(sesionAct!=null || userop instanceof servicios.DtColaborador)
{
    DtColaborador cola = (DtColaborador) userop;
      %> 
      <div class="container">
             <%   
              List<servicios.DtColaboracion> am = (List<servicios.DtColaboracion>) request.getAttribute("col");
            String ca = "";
           
        if(am != null && am.size()>0){
            int we = 0;
                for (servicios.DtColaboracion propa : am) {
                   ca = propa.getPropuesta().getTitulo().replace(" ", "+");
                
        %>
  
       <div class="row" >
                <div class="col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">

                    <ul class="list-group">
                         <input type="hidden" name="ca" value="<%= ca%>"/>
                        <li class="list-group-item">Titulo: <a href="pagar?T=<%= ca %>" ><%= propa.getPropuesta().getTitulo() %> </a></li>
                        <li class="list-group-item">Fecha de colaboración:    <%=new SimpleDateFormat("dd/MM/yyyy").format(propa.getFecha().toGregorianCalendar().getTime())%></li>
                         <li class="list-group-item">Monto colaborado: <%= propa.getMonto() %> </li>
                    </ul>
                </div><!-- /.col-sm-4 -->
            </div>
      </div>
                    
    <!-- Footer -->
    
    <%
 }
}
 }
 %>
    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
        <script  src="<%= request.getContextPath()%>/js/limpiar.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

