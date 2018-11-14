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
  <%
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
  <body style="background-color: #32383e" >
      <div class="container">
             <h2 class="h33">Selecciona una propuesta:</h2>
       <div class="row">
            <%   List<servicios.DtPropuesta> a = (List<servicios.DtPropuesta>) request.getAttribute("propuestas");
        if(a.size()>0){
                for (servicios.DtPropuesta propa : a) {
                    String h = propa.getTitulo().replace(" ", "+");
        %>
       
            <div class="col-4 col-sm-4 col-xs-6 col-lg-3 propuestason">
                <% if (propa.getImg() != null && !propa.getImg().equals("")) {%>
                <a href="Propuestas?T=<%=h%>" title="<%= propa.getTitulo()%>"><img class="img-rounded" src="/tarea3/retornarimagen?T=<%= propa.getTitulo() %>" width="150" height="150"></a>
                 <%   } else {%>     
                <a href="Propuestas?T=<%=h%>" title="<%= propa.getTitulo()%>"><img class="img-rounded"  src="/tarea3/img/pro.jpeg"  width="150" height="150" ></a>
                       <%    }%>
                <h4><%= propa.getTitulo()%></h4>
            </div>
           <!--/span-->  
             <% }
                } %>
            </div> 
      </div>
    <!-- Footer -->
    
    
    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

