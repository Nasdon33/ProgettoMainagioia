<%@page import="db.Utente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
       
        
        <title>Rgistrazione</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        
        <%
            utente = (Utente)ses.getAttribute("utente");
            if(utente!=null){
                response.sendRedirect("index.jsp");
            }
        %>
        
<div class="container" id="Spazio">
    <div class="row" >
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"  style="background-color: white; opacity:0.9; border-radius: 30px"> <!-- pagina di registrazione -->
        <form role="form" method="POST" action="Registrazione">
                    <center><h1>Registrati a Magnagioia!</h1></center>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group2">
                                            
                        <input type="text" name="nome" required="" id="first_name" class="form-control input-lg" placeholder="Nome" tabindex="1">
                    </div>
                </div>
                            
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group2">
                        <input type="text" name="cognome" required="" id="last_name" class="form-control input-lg" placeholder="Cognome" tabindex="2">
                    </div>
                </div>
            </div>
                         <br>
            <div class="form-group2">
                <input type="text" name="nickname" required="" id="display_name" class="form-control input-lg" placeholder="Nickname" tabindex="3">
            </div>
                          <br>
            <div class="form-group2">
                <input type="email" name="email" id="email" required="" class="form-control input-lg" placeholder="Email" tabindex="4">
            </div>
                           <br>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group2">
                        <input type="password" name="password" required="" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
                </div>
                                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">  <!-- controllo password -->
                    <div class="form-group2">
                        <input type="password" name="pass2" required="" id="password_confirmation" class="form-control input-lg" placeholder="Conferma Password" tabindex="6">
                    </div>
                                        
                                </div>
                              <br>
                              
            </div>
                           <br>
            <ul>
                                        <li id="letter" class="invalid">Almeno <strong>una lettera</strong></li>
                                        <li id="capital" class="invalid">Almeno <strong>una lettera maiuscola</strong></li>
                                        <li id="number" class="invalid">Almeno <strong>un numero</strong></li>
                                        <li id="length" class="invalid">Almeno <strong>8 caratteri</strong></li>
                                        </ul>
                           <br>
            
            <hr class="colorgraph">
            <div class="row">
                            <div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4">
                                <input type="submit" id="reg_but" value="Registrati" class="btn btn-info btn-block btn-lg" tabindex="7"></div>
                        </div>
        </form>
    </div>
</div>
<!-- Modal -->
    </div>
    </body>
</html>