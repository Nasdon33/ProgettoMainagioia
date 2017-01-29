<%-- 
    Document   : login
    Created on : 17-gen-2017, 12.03.31
    Author     : Carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html    PAGINA DA SISTEMARE>
<html>
    <head>
        <%@include file="head.html" %>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <title>Magnagioia</title>
    </head>
    <body>
        <div>
        <%@page import="db.Utente" %>
        <%@include file="header.jsp" %>
        <%-- <%
            if(!utente.getRuolo().contains("owner")){
                response.sendRedirect("index_nuovo.jsp");
            }
        %> --%>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1">
                    <form role="form" method="POST" action="Registrazione">
                    <center><h2>Modifica i dati relativi al ristorante:</h2></center>
                </div>
                <div>
                    <hr class="colorgraph col-md-12"></div>
                <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1">
                    <div class="form-group2">
                        <center><b>Nome del ristorante:</b></center>
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Inserisci il nome" tabindex="3">
                    </div>
                    <hr>
                    <div class="form-group2">
                        <center><b>Indirizzo:</b></center>
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Inserisci la via e il numero" tabindex="3">
                    </div>
                    <br>
                    <div class="form-group2">
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Inserisci la città" tabindex="3">
                    </div>
                    <br>
                    <div class="form-group2">
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Inserisci il paese" tabindex="3">
                    </div>
                    <hr>
                    <div class="form-group2">
                        <center><b>Sito web:</b></center>
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Inserisci l'indirizzo web" tabindex="3">
                    </div>
                    <hr>
                    <div class="form-group2">
                        <center><b>Orario di apertura:</b></center>
                        <table class="table table-sm">
                            <thead>
                              <tr>
                                <th>Giorno</th>
                                <th>Apertura</th>
                                <th>Chiusura</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">Lunedì</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                              <tr>
                                <th scope="row">Martedì</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                              <tr>
                                <th scope="row">Mercoledì</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                              <tr>
                                <th scope="row">Giovedì</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                              <tr>
                                <th scope="row">Venerdì</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                              <tr>
                                <th scope="row">Sabato</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                              <tr>
                                <th scope="row">Domenica</th>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                                <td><input type="text" id="hours" class="form-control input-lg" placeholder="00:00"></td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                    <hr>
                    <div class="form-group2" contentEditable="true" style="min-height: 80px">
                        <center><b>Descrizione del ristorante:</b></center>
                        <input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Inserisci una descrizione" tabindex="3">
                    </div>
                </div>
                <hr>
                <hr class="colorgraph col-md-12">
                <div class="row">
                    <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1"><input type="submit" value="Conferma" class="btn btn-primary btn-block btn-lg Azzurro" tabindex="7"></div>
                </div>
            </div>
        </div>
    </body>
</html>
