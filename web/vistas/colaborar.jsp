<%-- 
    Document   : colaborar
    Created on : 11/11/2018, 10:41:43 PM
    Author     : Nuevo
--%>

<%@page import="Servlets.inicSesion"%>
<%@page import="servicios.DtColaborador"%>
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
    <body style="background-color: #32383e" >
        <% servicios.DtUsuario userop = inicSesion.getUsuarioLogueado(request); // agregado servicios
            String sesionAct = (String) session.getAttribute("sesionAct");
            if (sesionAct != null || userop instanceof servicios.DtColaborador) {
                DtColaborador cola = (DtColaborador) userop;
        %> 
        <%if (((String) request.getAttribute("tipoR")).equalsIgnoreCase("entrada")) {%> 
        <div class="container">
            <form action="/tarea3/colaborar" method="post">
                <div class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3" style="color: #fff">
                    <h1 style="color: white">Registrar Colaboracion</h1>
                    <div class=" form-group ">
                        <label for="input" style="color: white">Elija tipo de retorno:</label>

                        <div class="form-check">
                            <input type="radio" name="tipoRetorno" value="porcentaje" id="con" disabled>
                            <label class="control-label " for="content" >Porcentaje</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" name="tipoRetorno" value="entrada" id="con2" checked>
                            <label class="control-label " for="colaborador">Entrada</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" pattern="[0-9]*" id="monto" name="monto" placeholder="Monto" required="required"/>
                        </div>
                        <input type="hidden" name="Titulo" value="<%=request.getParameter("T")%>">
                        <div class="form-group">
                            <button type="submit" class="btn-circle">Colaborar</button>	
                        </div> 
                    </div>
                </div>
            </form>
        </div>
        <%}%>
        <%if (((String) request.getAttribute("tipoR")).equalsIgnoreCase("porcentaje")) {%> 
        <div class="container">
            <form action="/tarea3/colaborar" method="post">
                <div class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3" style="color: #fff">
                    <h1 style="color: white">Registrar Colaboracion</h1>
                    <div class=" form-group ">
                        <label for="input" style="color: white">Elija tipo de retorno:</label>
                        <div class="form-check">
                            <input type="radio" name="tipoRetorno" value="porcentaje" id="con" checked>
                            <label class="control-label " for="content" >Porcentaje</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" name="tipoRetorno" value="entrada" id="con2" disabled>
                            <label class="control-label " for="colaborador">Entrada</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" pattern="[0-9]*" id="monto" name="monto" placeholder="Monto" required="required"/>
                        </div>
                        <input type="hidden" name="Titulo" value="<%=request.getParameter("T")%>">
                        <div class="form-group">
                            <button type="submit" class="btn-circle">Colaborar</button>	
                        </div> 
                    </div>
                </div>
            </form>
        </div>
        <%}%>
        <%if (((String) request.getAttribute("tipoR")).equalsIgnoreCase("entrada, porcentaje")) {%> 
        <div class="container">
            <form action="/tarea3/colaborar" method="post">
                <div class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3" style="color: #fff">
                    <h1 style="color: white">Registrar Colaboracion</h1>
                    <div class=" form-group ">
                        <div class="form-check">
                            <input type="radio" name="tipoRetorno" value="porcentaje" id="con">
                            <label class="control-label " for="content" >Porcentaje</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" name="tipoRetorno" value="entrada" id="con2">
                            <label class="control-label " for="colaborador">Entrada</label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" pattern="[0-9]*" id="monto" name="monto" placeholder="Monto" required="required"/>
                        </div>
                        <input type="hidden" name="Titulo" value="<%=request.getParameter("T")%>">
                        <div class="form-group">
                            <button type="submit" class="btn-circle">Colaborar</button>	
                        </div> 
                    </div>
                </div>
            </form>
        </div>
        <%}%>
    </div>




    <%}%>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script  src="<%= request.getContextPath()%>/js/limpiar.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</body>
</html>
