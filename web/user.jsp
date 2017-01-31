<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
       
        <%@include file="head.html" %>
       
        <title>Notifiche</title>
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
        
    
    
    
        <div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1" id="Spazio"style="background-color: white; opacity:0.9; border-radius: 30px;"> <!-- Pagina di notifiche -->
            <!-- Notification header -->
            <div>
                <center>
                <p style="font-size: 30px">Ecco le tue notifiche:</p>
                </center>
                <hr class="colorgraph">
            </div>
        
        <!-- Notifications -->
       
            <%
                if(utente.getRuolo().contains("user")){
            %>
                <!-- NOTIFICHE PER L'UTENTE GENERICO -->
               
                
                    <div class="col-md-12 Azzurro_tondo">
                        
                        <button id="segnalazione_controllata" type="button" class="btn btn-responsive Azzurro_no_bordo">                           
                             <p> "Nome utente" ha controllato la
                               <a href="link-recensione">segnalazione</a>
                               che ci hai inviato.</p>
                        </button>
                        
                    </div>
                    
                    <div class="col-md-12">
                        <br>                    <!--Spazio per le notifiche-->
                    </div>
                    
                
                    <div class="col-md-12 Azzurro_tondo">
                        
                        <button id="segnalazione_controllata" type="button" class="btn btn-responsive Azzurro_no_bordo">                           
                             <p> "Nome utente" ha controllato la
                               <a href="link-recensione">segnalazione</a>
                               che ci hai inviato.</p>
                        </button>
                        
                    </div>
                
                 <div class="col-md-12">
                        <br>                    <!--Spazio per le notifiche-->
                    </div>
                       
                <div class="col-md-12 Azzurro_tondo">
                        
                        <button id="segnalazione_controllata" type="button" class="btn btn-responsive Azzurro_no_bordo">                           
                             <p> "Nome utente" ha controllato la
                               <a href="link-recensione">segnalazione</a>
                               che ci hai inviato.</p>
                        </button>
                         
                    </div>
               <div class="col-md-12">
                        <br>                    <!--Spazio per le notifiche-->
                    </div>
                
                <hr class="colorgraph">
                
                 </div>
                
                
                
                
                   <!-- DA QUI IN POI NON è A POSTO DAL PUNTO DI VISTA GRAFICO -->
                   
                   
                   
                   
                   
               
             <%
                 }
                else if(utente.getRuolo().contains("owner")){
            %>   
                
                <!-- NOTIFICHE PER IL RISTORATORE -->
                <div class="row">
                    
                        
                        <div class="col-md-12">
                            
                            <button id="risposta_approvata" type="button" class="btn btn-responsive col-md-12">                         
                                <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                    Ha approvato la tua
                                    <a href="link-recensione">risposta</a>
                                    ad una recensione.
                            </button>
                           
                        <br>
                        </div>
                        <br>
                    
                   
                    <div class="row">
                            <div class="col-md-12">
                            <div class="row">
                            <button id="risposta_approvata" type="button" class="btn btn-responsive">                         
                                <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                    Ha approvato la tua
                                    <a href="link-recensione">risposta</a>
                                    ad una recensione.
                            </button>
                            </div>
                        <br>
                        
                        </div>
                         
                    </div>
                </div>
                
                
                <%
                    }
                   else if(utente.getRuolo().contains("admin")){
                %> 
                <!-- NOTIFICHE PER L'ADMIN -->
                <div class="row">
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="row">
                            <button id="foto_segnalata" type="button" class="btn btn-responsive">                           
                                <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                    Ha segnalato una
                                    <a href="link-recensione">foto</a>
                                    da rimuovere.
                            </button>
                            </div>
                        <br>
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="row">
                            <button id="risposta_pubblicata" type="button" class="btn btn-responsive">                           
                                <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                    Ha pubblicato una
                                    <a href="link-recensione">risposta</a>
                                    ad una recensione.
                            </button>
                            </div>
                        <br>
                        </div>
                        <br>
                    </div>
                </div>
                <% 
                    }
                %>
            </div>
 
    </body>
</html>