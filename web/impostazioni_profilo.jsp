<%@page import="java.sql.Timestamp"%>
<%@page import="db.DBManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.Ristorante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
   

       
        <title>Gestisci Profilo</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        
        
        <%
            if(utente==null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
       
       <div class="row">
        <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1"  id="Spazio" style="background-color: white; opacity:0.9; border-radius: 30px"> <!-- campi per cambiare i dati del profilo -->
            <center><p style="font-size: 30px">Modifica i tuoi dati:</p></center> <!-- mostro all'utente i vecchi dati e poi offro la possibilità di cambiarli -->
                <hr class="colorgraph">
                <div class="form-group2">
                    <center><b>Email Attuale: </b><%=utente.getEmail() %></center>
                        <input type="text" name="email" id="display_name" class="form-control input-lg" placeholder="Nuova Email" tabindex="3" required="">
                </div>
                 <hr>
                <div class="form-group2">
                    <center><b>Nickname Attuale: </b><%=utente.getNickname()%></center>
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Nuovo Nickname" tabindex="3">
                </div>
                  <hr>
                 <center><b>Cambia Password:</b></center>
                <div class="form-group2">
                        <input type="password" name="vpassword" id="display_name" class="form-control input-lg" placeholder="Password Attuale" tabindex="3"> <!-- richiesta vecchia password per cambiare -->
                </div>
                   <br>
                <div class="form-group2">
                        <input type="password" name="password" required="" id="password" class="form-control input-lg" placeholder="Nuova Password" tabindex="5">
                </div>
                   <br>
                   <div class="form-group2">
                        <input type="password" name="pass2" required="" id="password_confirmation" class="form-control input-lg" placeholder="Conferma Password" tabindex="6"> <!-- controllo nuova password -->
                </div>
                <br>
                <ul>
                <li id="letter" class="invalid">Almeno <strong>una lettera</strong></li>
                <li id="capital" class="invalid">Almeno <strong>una lettera maiuscola</strong></li>
                <li id="number" class="invalid">Almeno <strong>un numero</strong></li>
                <li id="length" class="invalid">Almeno <strong>8 caratteri</strong></li>
                </ul>
                <br>
                <input type="hidden" name="id" value="<%=utente.getId() %>">
                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <button type="submit" onclick=modifica() id="reg_but" class="btn btn-info btn-block btn-lg" tabindex="7"> Conferma </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
