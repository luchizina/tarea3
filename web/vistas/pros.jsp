<%-- 
    Document   : propuesta_list
    Created on : 30/10/2018, 04:55:07 PM
    Author     : nambr
--%>

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
    <title>Lista de Propuestas </title>
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

<jsp:include page="/vistas/menu.jsp" />
  </head>

  <body>
      <div class="row">
            <%   List<servicios.DtPropuesta> a = (List<servicios.DtPropuesta>) request.getAttribute("propuestas");
        if(a.size()>0){
                for (servicios.DtPropuesta propa : a) {
                    String h = propa.getTitulo().replace(" ", "+");
        %>
            <div class="col-6 col-sm-6 col-lg-4">
                <% if (propa.getImg() != null && !propa.getImg().equals("")) {%>
                <img class="img-circle" src="/tarea3/retornarimagen?T=<%= propa.getTitulo() %>" width="200" height="200" >
                 <%   } else {%>     
                 <img class="img-circle" src="/tarea3/img/noimg.png"  width="200" height="200" >
                       <%    }%>
              <h2> <%= propa.getTitulo()%> </h2>
              <p><a class="btn btn-default" href="Propuestas?T=<%=h%>" role="button">Ver detalles &raquo;</a></p>
            </div><!--/span-->  
            </div>
             <% }
                } %>
    <!-- Footer -->
    
    
    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

