
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlets.inicSesion"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
      <title>Inicio - Culturarte</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/sticky-footer-navbar.css" rel="stylesheet">

  </head>

  <body style="background-color:  #32383e">
      
          <%
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
<header>
    <div class="container">
 <% 
                               servicios.DtUsuario user=inicSesion.getUsuarioLogueado(request);
                               String nombre=user.getNombre();
                               String ape= user.getApellido();
                               
                               String nueva1=nombre+" "+ape;
  
                    String tipoUsu= (String) session.getAttribute("tipo");

                            %>
      <!-- Static navbar -->
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">CULTURARTE</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
              <a class="navbar-brand" href="#" style="text-transform: uppercase ">BIENVENIDO <%out.print(nueva1);%></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="<%= request.getContextPath() %>/Propuestas">CONSULTAR PROPUESTA</a></li>
              <li><a href="<%= request.getContextPath() %>/colaborar">REGISTRAR COLABORACIÓN</a></li>
             <li><a href="<%= request.getContextPath() %>/pagar">PAGAR COLABORACIÓN</a></li>
             
             </ul>
            <ul class="nav navbar-nav navbar-right">
               
             <li><a href="<%= request.getContextPath() %>/cerrarSesion">CERRAR SESIÓN</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
    </div> <!-- /container -->
</header>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/js/jquery.min.js"><\/script>')</script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

  </body>
</html>