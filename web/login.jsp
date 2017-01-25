<%@page import="db.Utente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html    DA SISTEMARE SFONDO PER INSERIRE HEADER>
<html>
    <head>
        <%@include file="head.html" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

        <link href="css/style2.css" rel="stylesheet" type="text/css">  
        
        <title>Ristorante Magnagioia</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        <%
            if(utente!=null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        
        
        <div id="login-overlay" class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">Effettua il Login su Magnagioia!</h4>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6 col-md-6">
                      <div class="col-md-12 col-xs-12">
                          <form id="login" method="POST" action="User">
                              <div class="form-group1">
                                  <label for="email" class="control-label">Email</label>
                                  <input type="text" class="form-control" id="username" name="email" value="" required="" title="Please enter you email" placeholder="example@gmail.com">
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group1">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" value="" required="" title="Please enter your password">
                                  <span class="help-block"></span>
                              </div>
                              <div class="errore invisibile" id="login-error">Email o Password errati</div>
                              
                              <button type="submit" class="btn btn-success btn-block">Login</button>
                              <a href="Password" class="btn btn-default btn-block">Dimenticato la password?</a>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-6">
                      <p class="lead">Registrati ora è <span class="text-success">GRATIS!</span></p>
                      <ul class="list-unstyled" style="line-height: 2">
                          <li><i class="fa fa-check text-success"></i> Gestisci il tuo ristorante</li>
                          <li><span class="fa fa-check text-success"></span> Scegli il ristorante più adatto a te</li>
                          <li><span class="fa fa-check text-success"></span> Risparmia denaro</li>
                          <li><span class="fa fa-check text-success"></span> Risparmia tempo</li>
                          <li><span class="fa fa-check text-success"></span> Recensisci i ristoranti</li>
                          
                      </ul>
                      <p><a href="registrazione.jsp" class="btn btn-info btn-block">Registrati ora!</a></p>
                  </div>
              </div>
          </div>
      </div>
  </div>
        
        
        
        
        
    </body>
</html>