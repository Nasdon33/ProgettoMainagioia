<%@page import="db.Utente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <%@include file="head.html" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
       <script src="js/sendPass.js"></script>
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <style>
        body {
        height:100%;
        width:100%;
        background-image:url("img/SfondoGrande.jpg");/*your background image*/  
        background-repeat:no-repeat;/*we want to have one single image not a repeated one*/  
        background-size:cover;    
        }

      @media only screen and (max-width: 767px) {
       body {
         /* The file size of this background image is 93% smaller
            to improve page load speed on mobile internet connections */
         background-image: url(img/SfondoPiccolo.jpg);
         
        }
       }
       </style>
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
        
        
        <div id="login-overlay" class="modal-dialog" style="background-color: white; opacity:0.9; border-radius: 30px">
      <div >
          <div>
              <center>
              <p class="modal-title" style="font-size: 30px" id="myModalLabel">Effettua il Login su Magnagioia!</p>
              </center>
              <hr class="colorgraph">
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6 col-md-6"> <!-- richiesta dei dati utente per login con i relativi controlli -->
                      <div class="col-md-12 col-xs-12">
                          <form id="login" method="GET" action="User">
                              <div class="form-group1">
                                  <label for="email" class="control-label">Email</label>
                                  <input type="text" class="form-control" id="username" name="email" value="" required="" title="Please enter you email" placeholder="example@gmail.com">
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group1">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" value="" title="Please enter your password">
                                  <span class="help-block"></span>
                              </div>
                              <div class="errore invisibile" id="login-error">Email o Password errati</div>
                              <br>
                              <button type="submit" class="btn btn-info Azzurro btn-block btn-responsive">Login</button>
                          </form>
                          <button id="a"  onclick=sendPassword() class="btn btn-default btn-block btn-responsive">Mi Sono Dimenticato La Password</button>
                      </div>
                  </div>
                  <div class="col-xs-6" id="Altezza"> <!-- barra laterale che spiega i vantaggi a iscriverti al sito -->
                      <p style="font-size:20px">Registrati ora è <span class="text-success">GRATIS!</span></p>
                      <ul class="list-unstyled" style="line-height: 2">
                          <li><i class="fa fa-check text-success"></i> Gestisci il tuo ristorante</li>
                          <li><span class="fa fa-check text-success"></span> Scegli il ristorante più adatto a te</li>
                          <li><span class="fa fa-check text-success"></span> Recensisci i ristoranti</li>
                          <li><span class="fa fa-check text-success"></span> Risparmia denaro</li>
                          <li><span class="fa fa-check text-success"></span> Risparmia tempo</li>
                          
                          
                      </ul>
                      <p><a href="registrazione.jsp" class="btn btn-info btn-block btn-responsive">Registrati ora!</a></p>
                  </div>
              </div>
          </div>
      </div>
  </div>
        
        
        
        
        
    </body>
</html>