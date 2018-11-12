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
        <% servicios.DtUsuario userop = inicSesion.getUsuarioLogueado(request); // agregado servicios
            String sesionAct = (String) session.getAttribute("sesionAct");
            if (sesionAct != null || userop instanceof servicios.DtColaborador) {
                DtColaborador cola = (DtColaborador) userop;
        %> 
        <div class="container">
            <form action="<%=request.getContextPath()%>/pagar" method="post">
                <div class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3" style="color: #fff">
                     <div class=" form-group ">
                          <label for="input">Elija tipo de pago:</label>
                       <div class="form-check">
                        <input type="radio" name="usuario" value="proponente" id="con" onchange="javascript:showContent()" >
                          <label class="control-label " for="content">Tarjeta</label>
                       </div>
                         <div class="form-check">
                        <input type="radio" name="usuario" value="colaborador" id="con2" onchange="javascript:showContent()" >
                         <label class="control-label " for="colaborador">Transferencia</label>
                        </div>
                         <div class="form-check">
                        <input type="radio" name="usuario" value="colaborador2" id="con3" onchange="javascript:showContent()" >
                        <label class="control-label " for="colaborador">Paypal</label>
                         </div>
                         </div>
                    <div class="form-row " >
                        <div class="form-group col-md-4">
                            <label for="inputEmail4">Nombre:</label>
                            <input type="text" class="form-control" id="inputEmail4" placeholder="<%= cola.getNombre()%>"  disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="inputPassword4">Apellido:</label>
                            <input type="text" class="form-control" id="inputPassword4" placeholder="<%= cola.getApellido()%>" disabled >
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputAddress">Numero:</label>
                        <input type="number" class="form-control" id="inputAddress" placeholder="ej: 1234567" name="num">
                    </div>
                </div>
                <div id="content" style="display: none;">
                    <div class="row" style="color: #fff" >
                        <div class="col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">
                            <label for="inputState">Tipo tarjeta:</label>
                            <select id="inputState" class="form-control" name="tar">
                                <option selected>OCA</option>
                                <option>VISA</option>
                                <option>MASTER</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">
                            <label for="inputZip">CVC</label>
                            <input type="number" class="form-control" id="inputZip" name="cvc">
                        </div>
                        <div class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">
                            <label for="inputZip2">Fecha de vencimiento</label>
                            <input type="date" class="form-control" id="inputZip2" name="fecha">
                        </div>              
                    </div><!-- /.col-sm-4 -->
                </div>
                <div id="content2" style="display: none;">     
                    <div class="row" >
                        <div style="color: #fff" class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">

                            <label for="inputZip2">Nombre del banco</label>
                            <input type="text" class="form-control" id="inputZip2" name="banco">
                        </div> 

                    </div>
                </div>
                         <div style="color: #fff" class=" form-group col-sm-4 col-md-4 col-lg-6 col-xl-6 col-sm-offset-4 col-md-offset-4 col-lg-offset-3 col-xl-offset-3">
                              <% String ca = (String) request.getAttribute("pro"); %>
                             <input type="hidden" name="prop" value="<%= ca %>"/>
                              <input type="hidden" name="usu" value="<%= cola.getNick() %>"/>
                             <button type="submit" class=" btn-circle">PAGAR</button>  
                           
                        </div> 
                        
            </form>            
        </div>

        <!-- Footer -->

        <%
            }
        %>
        <!-- Bootstrap core JavaScript -->
        <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
        <script  src="<%= request.getContextPath()%>/js/limpiar.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

    </body>

</html>

