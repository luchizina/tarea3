<%-- 
    Document   : propuesta_list
    Created on : 30/10/2018, 04:55:07 PM
    Author     : nambr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>3 Col Portfolio - Start Bootstrap Template</title>
    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css>

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/3-col-portfolio.css" rel="stylesheet">
<jsp:include page="/vistas/menu.jsp" />
  </head>

  <body>
  <div class="container">
  <div class="row">
    <h2>Pinterest Responsive Grid</h2>

    <p>Best viewed <a href="http://bootsnipp.com/iframe/Zkk0O" target="_blank">full screen</a>
    </p>
    <hr>
    <section id="pinBoot">

      <article class="white-panel"><img src="http://i.imgur.com/sDLIAZD.png" alt="">
        <h4><a href="#">Title 1</a></h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </article>

      <article class="white-panel"> <img src="http://i.imgur.com/8lhFhc1.gif" alt="">
        <h4><a href="#">Title 2</a></h4>
        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </article>

      <article class="white-panel"> <img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
        <h4><a href="#">Title 3</a></h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
      </article>


      <article class="white-panel"> <img src="http://i.imgur.com/3gXW3L3.jpg" alt="">
        <h4><a href="#">Title 4</a></h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </article>

      <article class="white-panel"> <img src="http://i.imgur.com/o2RVMqm.jpg" alt="">
        <h4><a href="#">Title 5</a></h4>
        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </article>

      <article class="white-panel"> <img src="http://i.imgur.com/kFFpuKA.jpg" alt="">
        <h4><a href="#">Title 6</a></h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
      </article>



      <article class="white-panel"><img src="http://i.imgur.com/E9RmLPA.jpg" alt="">
        <h4><a href="#">Title 7</a></h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </article>

      <article class="white-panel"> <img src="http://i.imgur.com/8lhFhc1.gif" alt="">
        <h4><a href="#">Title 8</a></h4>
        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </article>

    </section>


    <hr>


  </div>
  <p>
    <a href="http://validator.w3.org/check?uri=http%3A%2F%2Fbootsnipp.com%2Fiframe%2FZkk0O" target="_blank"><small>HTML</small><sup>5</sup></a>
    <br>
    <br>

  </p>

</div>
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

