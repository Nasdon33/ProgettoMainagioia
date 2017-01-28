<%-- 
    Document   : login
    Created on : 17-gen-2017, 12.03.31
    Author     : Carlo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <link href="css/notifiche.css" rel="stylesheet" type="text/css">
        <title>Magnagioia Login</title>
    </head>
    <body>
        <%@page import="db.Utente" %>
        <div class="row">
        <%@include file="header.jsp" %>x
        <%
            if(utente==null){
                response.sendRedirect("index_nuovo.jsp");
            }
            
        %>
        </div>
        <center>
            <!-- Notification header -->
            <div>
                <h3>Ecco le tue notifiche:</h3>
            </div>
        </center>
        <!-- Notifications -->
        <div class="container">
            <%
                if(utente.getRuolo().contains("user")){
            %>
                <!-- NOTIFICHE PER L'UTENTE GENERICO -->
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                        <button id="segnalazione_controllata" type="button" class="btn btn-warning ribbon">                           
                            <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                               Ha controllato la
                               <a href="link-recensione">segnalazione</a>
                               che ci hai inviato.
                        </button>
                        </div>
                    </div>
                    <br>
                </div>
             <%
                 }
                else if(utente.getRuolo().contains("owner")){
            %>   
                
                <!-- NOTIFICHE PER IL RISTORATORE -->
                <div class="row">
                    <div class="row">
                        <div class="col-md-2">                        
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                            <button id="risposta_approvata" type="button" class="btn btn-warning ribbon">                         
                                <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                    Ha approvato la tua
                                    <a href="link-recensione">risposta</a>
                                    ad una recensione.
                            </button>
                            </div>
                        <br>
                        </div>
                        <br>
                    </div>
                    <div class="row_separatoria"><br><br></div>
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                            <button id="risposta_approvata" type="button" class="btn btn-warning ribbon">                         
                                <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                    Ha approvato la tua
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
                   else if(utente.getRuolo().contains("admin")){
                %> 
                <!-- NOTIFICHE PER L'ADMIN -->
                <div class="row">
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                            <button id="foto_segnalata" type="button" class="btn btn-warning ribbon">                           
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
                    <div class="row_separatoria"><br><br></div>
                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                            <button id="risposta_pubblicata" type="button" class="btn btn-warning ribbon">                           
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