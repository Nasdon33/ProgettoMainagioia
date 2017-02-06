<%@page import="db.Utente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%@include file="head.html" %>
        <title>Login</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        <%
            if(utente!=null){
                response.sendRedirect("index.jsp");
            }
        %>
        
        
        <div id="login-overlay" class="modal-dialog" style="background-color: white; opacity:0.9; border-radius: 30px">
      <div >
          <div>
              <center>
                  <h1 id="myModalLabel">Effettua il Login su Magnagioia!</h1>
              </center>
              <hr class="colorgraph">
          </div>
          <div class="modal-body">
             <div class="row">
                 <div class="col-xs-6 col-md-6"> <!-- richiesta dei dati utente per login con i relativi controlli -->
                     <div class="col-md-12 col-xs-12">
                         
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
                             <button type="submit" id="submit" onclick=sottometti() class="btn btn-info Azzurro btn-block btn-responsive">Login</button>
                         
                         <button id="a"  onclick=sendPassword() class="btn btn-default btn-block btn-responsive">Mi Sono Dimenticato La Password</button>
                     </div>
                 </div>
                 <div class="col-xs-6" id="Altezza"> <!-- barra laterale che spiega i vantaggi a iscriverti al sito -->
                     <h4>Registrati ora è <span class="text-success">GRATIS!</span></h4>
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