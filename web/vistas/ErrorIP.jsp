<%-- 
    Document   : ErrorIP
    Created on : Nov 9, 2018, 2:10:40 PM
    Author     : Aeliner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
        <meta http-equiv="default_style" content=URL=/CulturarteWeb/vistas/ErrorIP.jsp">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 500</title>
            <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="background-color:  #32383e">
        <div class="container" style="padding-top: 50px ">
         <div class="alert alert-warning" role="alert">
                        <a  class="alert-link"> ¡UPSS! Esto es incómodo.. :( </a>
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
                          <hr>
                         <p class="mb-0">Hubo un problema accediendo al servidor central.<a href="<%=request.getContextPath()%>/cerrarSesion" class="alert-link"> Volver al menú principal</a></p>
                       
         </div>
                         <img class="img-rounded col-sm-3 col-md-4 col-xs-8 col-sm-offset-5 col-md-offset-4 col-xs-offset-1"  src="/tarea3/img/error500.png"  style="max-width: 200; max-height: 200" ></a>
       
        </div>
    </body>
</html>
