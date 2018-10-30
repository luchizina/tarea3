<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Culturarte</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> 
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">
</head>
<body >
    <div class="login-form" style="background-color: transparent">
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
            <button type="submit" class="btn btn-primary btn-lg btn-block">Entrar</button>
        </div>   
    </form>
</div>
</body>
</html>                              