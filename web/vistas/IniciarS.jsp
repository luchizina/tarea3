<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page session="true" %>


<html lang="en" >
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Culturarte</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> 
<script src="<%=request.getContextPath()%>/js/limpiar.js"></script> 
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">

</head>
<body style="background-color:  #32383e">
        <%
                String control = (String) request.getAttribute("paso");
                if(control == null){
                    %>
                    <jsp:forward page="ErrorIP.jsp"/>
                    <% }%>
     <%
 
 String sesionAct=(String) session.getAttribute("sesionAct");
 if(sesionAct!=null) { %>

 <%  }else{ %>
    <div class="login-form" style="background-color:  #32383e" >
    <form action="iniciarS" method="post">
        <div>
        <h2 class="text-center">Iniciar Sesión</h2>       
        </div> 
        <div class="form-group">
        	<input type="text" class="form-control" name="nick" placeholder="Nick o Email" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Contraseña" required="required">
        </div>        
        <div class="form-group">
            <input type="checkbox" name="rec"> Recordarme
            <button type="submit" class="btn btn-primary btn-lg btn-block">Entrar</button>
            <% String a = (String) request.getAttribute("error");
                if (a != null){%>
                <br>
           
            <div class="alert alert-danger" role="alert">
  <a href="#" class="alert-link">Esto es incómodo, parece que hubo un problema </a>
</div>
             <% } %>	
        </div>   
    </form>
</div>
         <% } %>	
</body>
</html>                              