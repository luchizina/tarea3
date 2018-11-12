<%-- 
    Document   : prop_info
    Created on : 31/10/2018, 06:25:50 PM
    Author     : nambr
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Propuesta</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <link rel='stylesheet' href='<%=request.getContextPath()%>/css/font-awesome.min.css'>
        <jsp:include page="/vistas/menu.jsp" />
    </head>
    <body style="background-color: #32383e">  

        <% servicios.DtPropuesta prop = (servicios.DtPropuesta) request.getAttribute("propu");%>
       <div class="container">
        <div class="row">
      <div class="col-sm-4 col-md-4  col-sm-offset-5 col-md-offset-4 col-xs-offset-1">
      <h4 class="text-on-pannel text-primary"><strong class="text-uppercase"> <%= prop.getTitulo()%> </strong></h4>
      
                <% if (prop.getImg() != null && !prop.getImg().equals("")) {  %>
                <img class="img-thumbnail " src="/tarea3/retornarimagen?T=<%= prop.getTitulo()%>" width="200" height="200">
                <%   } else {%>     
                <img class="img-rounded"  src="/tarea3/img/pro.jpeg"  width="200" height="200" >
                <%    }%>

            </div><!--/span-->  
        </div>
            <div class="row">
            <div class="col-sm-4 col-md-3 col-lg-5 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3" style="padding-top:10px; height:50px">
                <button type="button" class=" btn-circle">colaborar</button>
            </div>  
            </div>
            <div class="row">

                <div class="col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3"  style="max-width: 600px !important" >

                    <ul class="list-group">
                        <li class="list-group-item">Fecha: <%=new SimpleDateFormat("dd/MM/yyyy").format(prop.getFecha().toGregorianCalendar().getTime())%></li>
                        <li class="list-group-item">Lugar: <%=prop.getLugar()%></li>
                        <li class="list-group-item">Precio de entrada: <%= prop.getPrecio()%></li>
                        <li class="list-group-item">Monto recaudado: <%= prop.getMontoActual()%></li>
                        <li class="list-group-item">Tipo de retorno: <%=prop.getTRetornos()%></li>
                            <%
                                String propu = prop.getEstActual().getEstado().toString();
                                String propu2 = propu.replace("_", " ");%>
                        <li class="list-group-item">Estado actual: <%=  propu2%></li>
                          <%   
              List<String> am = (List<String>) request.getAttribute("col");
            String ca = "";
           
        if(am != null && am.size()>0){
            int we = 0;
                for (String propa : am) {
                   if(we!=0) ca+=", "; 
                   ca += propa;
                   we+=1;
                   
                }
        
        
        
        
        %>
                        <li class="list-group-item">Colaboradores: <%=ca %></li>
                   
                <%   
                 }else {
%>
     <li class="list-group-item">Colaboradores: aún no tiene colaboradores...</li>
                        <%}%>
         
          </ul>
                </div><!-- /.col-sm-4 -->
            </div>
                         </div>
       
    </body>
</html>
