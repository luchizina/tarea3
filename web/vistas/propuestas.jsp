<%-- 
    Document   : propuestas
    Created on : 13/11/2018, 01:38:59 AM
    Author     : Nuevo
--%>

<%@page import="java.util.List"%>
<%@page import="servicios.DtColaborador"%>
<%@page import="Servlets.inicSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <body style="background-color: #32383e">
        <%
            String control = (String) request.getAttribute("paso");
            if (control == null) {
        %>
        <jsp:forward page="ErrorIP.jsp"/>
        <% }%>
        <% servicios.DtUsuario userop = inicSesion.getUsuarioLogueado(request); // agregado servicios
            String sesionAct = (String) session.getAttribute("sesionAct");
            if (sesionAct != null || userop instanceof servicios.DtColaborador) {
                DtColaborador cola = (DtColaborador) userop;
        %> 
        <div class="container">
            <h3 class="h33">SELECCIONE PROPUESTA A COLABORAR:</h3>
            <div class="row" >
                <%
                    List<servicios.DtPropuesta> am = (List<servicios.DtPropuesta>) request.getAttribute("propus");
                    String ca = "";

                    if (am != null && am.size() > 0) {
                        int we = 0;
                        for (servicios.DtPropuesta propa : am) {
                            ca = propa.getTitulo().replace(" ", "+");

                %>    
                <div class="col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">

                    <ul class="list-group">
                        <li class="list-group-item">Titulo: <a href="Propuestas?T=<%= ca%>" ><%= propa.getTitulo()%> </a></li>
                        <li class="list-group-item">Proponente: <%= propa.getPropoACargo()%> </li>
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
