<%-- 
    Document   : prop_info
    Created on : 31/10/2018, 06:25:50 PM
    Author     : nambr
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Propuesta</title>
    </head>
    <body>
        
        
     <% servicios.DtPropuesta prop=(servicios.DtPropuesta) request.getAttribute("propu");%>
          <div class="page-header">
        <h1>List groups</h1>
      </div>
      <div class="row">
        <div class="col-sm-4">
          <ul class="list-group">
            <li class="list-group-item">Fecha: <%= prop.getFecha().toGregorianCalendar().getTime() %></li>
            <li class="list-group-item">Lugar: <%=prop.getLugar() %></li>
            <li class="list-group-item">Precio de entrada: <%= prop.getPrecio() %></li>
            <li class="list-group-item">Monto recaudado: <%= prop.getMontoActual() %></li>
            <li class="list-group-item">Tipo de retorno: <%=prop.getTRetornos() %></li>
            <li class="list-group-item">Estado actual: <%= prop.getEstActual().getEstado().toString() %></li>
          </ul>
        </div><!-- /.col-sm-4 -->
           </div>
    </body>
</html>
