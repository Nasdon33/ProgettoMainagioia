<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>       
        <title>Inserisci Ristorante</title>
    </head>
    
    
    <body>
        <div>
       <%@include file="header.jsp" %>
        </div>
   
    
        <%
            if(utente==null){
                response.sendRedirect("index.jsp");
            }
        %>
       
        <div class="row" style="background-color: white; opacity:0.85; border-radius: 30px" id="Spazio">
            <form method="POST" action="Ristorante" enctype="multipart/form-data">
                <div>
                    <center><h1>Inserisci ristorante:</h1></center>
                </div>
                
                <div class="row">
                    <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1"> <!-- contiene tutti i campi per il ristorante fino a "stato"-->

                        <hr class="colorgraph">


                        <div class="form-group2">
                            <center><h4>Nome:</h4></center>
                            <input type="text" name="nome" id="display_name" required="" class="form-control input-lg" placeholder="Nome Ristorante" tabindex="3">
                        </div>
                        <br>
                        <div class="form-group2">
                            <center><h4>Descrizione:</h4></center>
                            <textarea name="description" id="display_name" required="" class="form-control input-lg" placeholder="Descrizione" tabindex="3"></textarea>
                        </div>
                        <br>
                        <div class="form-group2">
                            <center><h4>Sito Web:</h4></center>
                            <input type="text" name="web_site_url" id="display_name" class="form-control input-lg" placeholder="Sito Web" tabindex="3">
                        </div>

                        <div class="form-group2">
                            <hr>
                            <center><h4>Fascia di prezzo:</h4></center>
                            <br>
                            <div class="col-md-3 col-xs-3">
                                <input type="radio" name="prezzo" value="0" checked> 0 - 8€<br>
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="radio" name="prezzo" value="1"> 8 - 20€<br>
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="radio" name="prezzo" value="2"> 20 - 50€<br>
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="radio" name="prezzo" value="3"> 50+ €<br>
                            </div>
                            <br>
                            <hr>
                        </div>

                        <div class="form-group2">
                           
                            <center><h4>Indirizzo:</h4></center>
                            <input type="text" name="address1" id="display_name" required="" class="form-control input-lg" placeholder="Via Napoleone 57" tabindex="3">
                        </div>
                        <div class="form-group2">
                            <br>
                            <center><h4>CAP:</h4></center>
                            <input type="text" name="address2" id="display_name" required="" class="form-control input-lg" placeholder="38122" tabindex="3">
                        </div>
                        <div class="form-group2">
                            <br>
                            <center><h4>Città:</h4></center>
                            <input type="text" name="address3" id="display_name" required="" class="form-control input-lg" placeholder="Trento" tabindex="3">
                        </div>
                        <div class="form-group2">
                            <br>
                            <center><h4>Provincia:</h4></center>
                            <input type="text" name="address4" id="display_name" required="" class="form-control input-lg" placeholder="TN" tabindex="3">
                        </div>
                        <div class="form-group2">
                            <br>
                            <center><h4>Stato:</h4></center>
                            <input type="text" name="address5" id="display_name" required="" class="form-control input-lg" placeholder="Italia" tabindex="3">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group2 col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1" id="Altezza"> <!-- contiene i tipi di cucina, id=Altezza ha un whitespace:nowrap; per sovrapporre il testo e non spostare la posizione   -->
                        <hr>
                        <center><h4>Tipo di cucina:</h4></center>
                        <br>
                        <div class="Spazio">
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Italiana" value="Italiana"> Italiana
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Vegetariana" value="Vegetariana"> Vegetariana
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Steakhouse" value="Steakhouse"> Steakhouse
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Americana" value="Americana"> Americana
                            </div>
                        </div>

                        <div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Araba" value="Araba"> Araba
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Francese" value="Francese"> Francese<br>
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Spagnola" value="Spagnola"> Spagnola
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Cinese" value="Cinese"> Cinese
                            </div>
                        </div>
                        <div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Giapponese" value="Giapponese"> Giapponese
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Dolci" value="Dolci"> Dolci
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Pizza" value="Pizza"> Pizza
                            </div>
                            <div class="col-md-3 col-xs-3">
                                <input type="checkbox" name="Cibo di Strada" value="Cibo di Strada"> Cibo di Strada<br>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <center>
                <div class="row">
                    <div class="form-group2 col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1"> <!-- inserimento orari -->
                        <center><h4>Orari:</h4></center>    
                        <br>
                        <H4> LUNEDI'</H4>
                        <input type="checkbox" name="lun0" value="lun0"> Pranzo <select name="oraplun0">
                                                                                    <option value="10:00">10.00</option>
                                                                                    <option value="10:30">10.30</option>
                                                                                    <option value="11:00">11.00</option>
                                                                                    <option value="11:30">11.30</option>
                                                                                    <option value="12:00">12.00</option>
                                                                                    <option value="12:30">12.00</option>
                                                                                    <option value="13:00">13.00</option>
                                                                                </select>

                                                                                <select name="orchlun0">
                                                                                    <option value="13:00">13.00</option>
                                                                                    <option value="13:30">13.30</option>
                                                                                    <option value="14:00">14.00</option>
                                                                                    <option value="14:30">14.30</option>
                                                                                    <option value="15:00">15.00</option>
                                                                                    <option value="15:30">15.00</option>
                                                                                    <option value="16:00">16.00</option>
                                                                                </select>

                        <input type="checkbox" name="lun1" value="lun1"> Cena   <select name="oraplun1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchlun1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                        <hr id="hr1">
                        <H4> MARTEDI'</H4>
                        <input type="checkbox" name="mar0" value="mar0"> Pranzo <select name="orapmar0">
                                                                                    <option value="10:00">10.00</option>
                                                                                    <option value="10:30">10.30</option>
                                                                                    <option value="11:00">11.00</option>
                                                                                    <option value="11:30">11.30</option>
                                                                                    <option value="12:00">12.00</option>
                                                                                    <option value="12:30">12.00</option>
                                                                                    <option value="13:00">13.00</option>
                                                                                </select>
                                                                                <select name="orchmar0">
                                                                                    <option value="13:00">13.00</option>
                                                                                    <option value="13:30">13.30</option>
                                                                                    <option value="14:00">14.00</option>
                                                                                    <option value="14:30">14.30</option>
                                                                                    <option value="15:00">15.00</option>
                                                                                    <option value="15:30">15.00</option>
                                                                                    <option value="16:00">16.00</option>
                                                                                </select>
                        <input type="checkbox" name="mar1" value="mar1"> Cena   <select name="orapmar1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchmar1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                        <hr id="hr1">
                        <H4> MERCOLEDI'</H4>
                        <input type="checkbox" name="mer0" value="mer0"> Pranzo     <select name="orapmer0">
                                                                                        <option value="10:00">10.00</option>
                                                                                        <option value="10:30">10.30</option>
                                                                                        <option value="11:00">11.00</option>
                                                                                        <option value="11:30">11.30</option>
                                                                                        <option value="12:00">12.00</option>
                                                                                        <option value="12:30">12.00</option>
                                                                                        <option value="13:00">13.00</option>
                                                                                    </select>
                                                                                    <select name="orchmer0">
                                                                                        <option value="13:00">13.00</option>
                                                                                        <option value="13:30">13.30</option>
                                                                                        <option value="14:00">14.00</option>
                                                                                        <option value="14:30">14.30</option>
                                                                                        <option value="15:00">15.00</option>
                                                                                        <option value="15:30">15.00</option>
                                                                                        <option value="16:00">16.00</option>
                                                                                    </select>  
                        <input type="checkbox" name="mer1" value="mer1"> Cena <select name="orapmer1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchmer1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                        <hr id="hr1">
                        <H4> GIOVEDI'</H4>
                        <input type="checkbox" name="gio0" value="gio0"> Pranzo     <select name="orapgio0">
                                                                                        <option value="10:00">10.00</option>
                                                                                        <option value="10:30">10.30</option>
                                                                                        <option value="11:00">11.00</option>
                                                                                        <option value="11:30">11.30</option>
                                                                                        <option value="12:00">12.00</option>
                                                                                        <option value="12:30">12.00</option>
                                                                                        <option value="13:00">13.00</option>
                                                                                    </select>
                                                                                    <select name="orchgio0">
                                                                                        <option value="13:00">13.00</option>
                                                                                        <option value="13:30">13.30</option>
                                                                                        <option value="14:00">14.00</option>
                                                                                        <option value="14:30">14.30</option>
                                                                                        <option value="15:00">15.00</option>
                                                                                        <option value="15:30">15.00</option>
                                                                                        <option value="16:00">16.00</option>
                                                                                    </select>
                        <input type="checkbox" name="gio1" value="gio1"> Cena   <select name="orapgio1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchgio1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                        <hr id="hr1">
                        <H4> VENERDI'</H4>
                        <input type="checkbox" name="ven0" value="ven0"> Pranzo     <select name="orapven0">
                                                                                        <option value="10:00">10.00</option>
                                                                                        <option value="10:30">10.30</option>
                                                                                        <option value="11:00">11.00</option>
                                                                                        <option value="11:30">11.30</option>
                                                                                        <option value="12:00">12.00</option>
                                                                                        <option value="12:30">12.00</option>
                                                                                        <option value="13:00">13.00</option>
                                                                                    </select>
                                                                                    <select name="orchven0">
                                                                                        <option value="13:00">13.00</option>
                                                                                        <option value="13:30">13.30</option>
                                                                                        <option value="14:00">14.00</option>
                                                                                        <option value="14:30">14.30</option>
                                                                                        <option value="15:00">15.00</option>
                                                                                        <option value="15:30">15.00</option>
                                                                                        <option value="16:00">16.00</option>
                                                                                    </select>
                        <input type="checkbox" name="ven1" value="ven1"> Cena   <select name="orapven1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchven1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                        <hr id="hr1">
                        <H4> SABATO</H4>
                        <input type="checkbox" name="sab0" value="sab0"> Pranzo <select name="orapsab0">
                                                                                    <option value="10:00">10.00</option>
                                                                                    <option value="10:30">10.30</option>
                                                                                    <option value="11:00">11.00</option>
                                                                                    <option value="11:30">11.30</option>
                                                                                    <option value="12:00">12.00</option>
                                                                                    <option value="12:30">12.00</option>
                                                                                    <option value="13:00">13.00</option>
                                                                                </select>
                                                                                <select name="orchsab0">
                                                                                    <option value="13:00">13.00</option>
                                                                                    <option value="13:30">13.30</option>
                                                                                    <option value="14:00">14.00</option>
                                                                                    <option value="14:30">14.30</option>
                                                                                    <option value="15:00">15.00</option>
                                                                                    <option value="15:30">15.00</option>
                                                                                    <option value="16:00">16.00</option>
                                                                                </select>

                        <input type="checkbox" name="sab1" value="sab1"> Cena   <select name="orapsab1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchsab1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                        <hr id="hr1">
                        <H4> DOMENICA</H4>
                        <input type="checkbox" name="dom0" value="dom0"> Pranzo <select name="orapdom0">
                                                                                    <option value="10:00">10.00</option>
                                                                                    <option value="10:30">10.30</option>
                                                                                    <option value="11:00">11.00</option>
                                                                                    <option value="11:30">11.30</option>
                                                                                    <option value="12:00">12.00</option>
                                                                                    <option value="12:30">12.00</option>
                                                                                    <option value="13:00">13.00</option>
                                                                                </select>
                                                                                <select name="orchdom0">
                                                                                    <option value="13:00">13.00</option>
                                                                                    <option value="13:30">13.30</option>
                                                                                    <option value="14:00">14.00</option>
                                                                                    <option value="14:30">14.30</option>
                                                                                    <option value="15:00">15.00</option>
                                                                                    <option value="15:30">15.00</option>
                                                                                    <option value="16:00">16.00</option>
                                                                                </select>
                        <input type="checkbox" name="dom1" value="dom1"> Cena   <select name="orapdom1">
                                                                                    <option value="18:00">18.00</option>
                                                                                    <option value="18:30">18.30</option>
                                                                                    <option value="19:00">19.00</option>
                                                                                    <option value="19:30">19.30</option>
                                                                                    <option value="20:00">20.00</option>
                                                                                    <option value="20:30">20.30</option>
                                                                                    <option value="21:00">21.00</option>
                                                                                </select>
                                                                                <select name="orchdom1">
                                                                                    <option value="21:00">21.00</option>
                                                                                    <option value="21:30">21.30</option>
                                                                                    <option value="22:00">22.00</option>
                                                                                    <option value="22:30">22.30</option>
                                                                                    <option value="23:00">23.00</option>
                                                                                    <option value="23:30">23.30</option>
                                                                                    <option value="24:00">24.00</option>
                                                                                    <option value="00:30">00.30</option>
                                                                                    <option value="01:00">01.00</option>
                                                                                    <option value="01:30">01.30</option>
                                                                                    <option value="02:00">02.00</option>
                                                                                </select>
                         <hr id="hr1">
                    </div> <!-- fine inserimento orari -->
                </div>
                </center>
                <center>
                <div class="row">
                    <div id="Spazio"> <!-- form per inserimento foto -->
                        <div class="container row">
                            <div class="col-md-12 col-xs-12">
                                <h1>  <span class="glyphicon glyphicon-open"></span> Inserisci foto:</h1>
                                <input type="file" name="file" required=""/>
                            </div>
                        </div>
                    </div>
                </div>
                </center>
                <hr>
                <center>
                <div class="row">
                    <H4>Sei il proprietario del ristorante?</H4>
                    <div class="col-md-2 col-xs-2 col-md-offset-4 col-xs-offset-4">
                        <input type="radio" name="owner" value="1"/> Sì
                    </div>
                    <div class="col-md-2 col-xs-2">
                        <input type="radio" name="owner" value="0" checked/> No
                    </div>
                    
                </div>
                    
                </center>
               
                <div class="row">
                    <hr class="colorgraph col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1">
                    <div class="row">
                        
                        <div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4">
                            
                            <input type="submit" value="Inserisci" class="btn btn-primary btn-block btn-lg Azzurro" tabindex="7">
                        </div>
                    </div>
                </div>
            </form>
	</div>    
    </body>
</html>