<%-- 
    Document   : login
    Created on : 17-gen-2017, 12.03.31
    Author     : Carlo
--%>

<%@page import="db.DBManager"%>
<%@page import="db.Utente" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <script src="js/scelta_ristorante.js"></script>
        <title>Gestisci Ristorante</title>
    </head>
    <body>
        <div>
        <%@include file="header.jsp" %>
        <%
            if(!utente.getRuolo().contains("owner")){
                response.sendRedirect("index.jsp");
            }
        %>
        </div>
        <div class="row pagina" style="background-color: white; opacity:0.85; border-radius: 30px" id="Spazio">  
            <div class="row">
                <div>
                    <center><h1>Modifica ristorante:</h1></center>
                </div>
                <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1"> <!-- campi per cambiare i dati del ristorante, molto simile a inserisci ristorante-->
                    <hr class="colorgraph">
                   <!-- parte di selezione del ristorante da modificare (nel caso di utenti con piu ristoranti-->
                    <center>
                        <h4>Seleziona il ristorante da modificare:</h4>

                    <div>
                        <br>
                        <%! private DBManager manager; %>
                        <%! 
                            public void init() throws ServletException {
                            // inizializza il DBManager dagli attributi di Application
                            this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                            //System.out.println("DBManager attivato\n");
                            } 
                        %>
                        <div class="radio">
                            <br>
                        <%

                            String id = request.getParameter("id");
                            String sql = "SELECT R.id as id, R.name as name, R.web_site_url as url, P.name as price, C.address as address, C.cap as cap, C.city as city, C.province as province, C.state as state FROM Restaurants as R, Price_ranges as P, Restaurant_coordinate as RC, Coordinates as C WHERE R.id_owner = ? AND R.id_price_range = P.id AND R.id = RC.id_restaurant AND RC.id_coordinate = C.id";
                            ResultSet ristoranti = manager.getData(sql, id);
                            while(ristoranti.next()){
                        %>
                        <div class="row">
                            <label><input type="radio" name="scelta" onclick="validate('<%=ristoranti.getString("id") %>', '<%=ristoranti.getString("name") %>', '<%=ristoranti.getString("url") %>',  '<%=ristoranti.getString("price") %>', '<%=ristoranti.getString("address") %>', '<%=ristoranti.getString("cap") %>', '<%=ristoranti.getString("city") %>', '<%=ristoranti.getString("province") %>', '<%=ristoranti.getString("state") %>')" class="btn btn-responsive btn-info" value="<%=ristoranti.getString("id") %>" /> <%=ristoranti.getString("name") %></label>
                        </div>
                        <br>
                        <%
                            }
                        %>
                        <input type="hidden" id="rico" name="id" value="" />
                        <hr>
                        <h4> Hai selezionato <span id="nome" style="color: #5bc0de"> </span></h4>
                        </div>
                    </center>
                    <!-- fine parte di selezione -->
                    <hr>
                    <div class="form-group2 hid">
                        <center><h4>Nome attuale: </h4><span id="n"> </span></center> <!-- mostro il vecchio campo e subito dopo la possibilità di cambiarlo -->
                        <input type="text" name="nome" id="display_name" class="form-control input-lg" placeholder="Nuovo nome" tabindex="3">
                    </div>
                    <br>
                    <div class="form-group2 hid">
                        <center><h4>Cambia descrizione: </h4><span id="d"> </span></center>
                        <textarea name="description" id="display_name" class="form-control input-lg" placeholder="Nuova descrizione" tabindex="3"></textarea>
                    </div>
                    <br>
                    <div class="form-group2 hid">
                        <center><h4>Sito Web attuale: </h4><span id="w"> </span></center>
                        <input type="text" name="web_site_url" id="display_name" class="form-control input-lg" placeholder="Nuovo sito Web" tabindex="3">
                    </div>

                    <div class="form-group2 hid">
                        <hr>
                        <center><h4>Fascia di prezzo attuale: </h4><span id="p"> </span></center>
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

                    <div class="form-group2 hid">
                        <center><h4>Indirizzo attuale: </h4><span id="a"> </span></center>
                        <input type="text" name="address1" id="display_name" class="form-control input-lg" placeholder="Nuovo indirizzo" tabindex="3">
                    </div>
                    <div class="form-group2 hid">
                        <br>
                        <center><h4>CAP attuale: </h4><span id="cap"> </span></center>
                        <input type="text" name="address2" id="display_name" class="form-control input-lg" placeholder="Nuovo CAP" tabindex="3">
                    </div>
                    <div class="form-group2 hid">
                        <br>
                        <center><h4>Città attuale: </h4><span id="cit"> </span></center>
                        <input type="text" name="address3" id="display_name" class="form-control input-lg" placeholder="Nuova città" tabindex="3">
                    </div>
                    <div class="form-group2 hid">
                        <br>
                        <center><h4>Provincia attuale: </h4><span id="pro"> </span></center>
                        <input type="text" name="address4" id="display_name" class="form-control input-lg" placeholder="Nuova provincia" tabindex="3">
                    </div>
                    <div class="form-group2 hid">
                        <br>
                        <center><h4>Stato attuale: </h4><span id="s"> </span></center>
                        <input type="text" name="address5" id="display_name" class="form-control input-lg" placeholder="Nuovo stato" tabindex="3">
                    </div>
                </div>
            </div>
            <div class="row hid">
                <div class="form-group2 col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1" id="Altezza">
                    <hr>
                    <center><h4>Cambia cucina:</h4></center>
                    <br>
                    <div class="Spazio">
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Italiana" value="Italiana"> Italiana
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Vegetariana" value="Vegetariana"> Vegetariana
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Steakhouse" value="Steakhouse"> Steakhouse
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Americana" value="Americana"> Americana
                        </div>
                    </div>

                    <div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Araba" value="Araba"> Araba
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Francese" value="Francese"> Francese<br>
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Spagnola" value="Spagnola"> Spagnola
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Cinese" value="Cinese"> Cinese
                        </div>
                    </div>
                    <div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Giapponese" value="Giapponese"> Giapponese
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Dolci" value="Dolci"> Dolci
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Pizza" value="Pizza"> Pizza
                        </div>
                        <div class="col-md-3 col-xs-3">
                            <input type="checkbox" class="cucina" name="Cibo di Strada" value="Cibo di Strada"> Cibo di Strada<br>
                        </div>
                    </div>
                </div>
            </div>
            <center>
            <div class="row hid">
                <div class="form-group2 col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1" id="orari">
                    <hr>
                    <center><h4>Cambia orari:</h4></center>  
                    <br>
                    <H4> LUNEDI'</H4>
                    <input type="checkbox" class="giorno" name="lun0" value="lun0"> Pranzo <select name="oraplun0">
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

                    <input type="checkbox" class="giorno" name="lun1" value="lun1"> Cena   <select name="oraplun1">
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
                    <input type="checkbox" class="giorno" name="mar0" value="mar0"> Pranzo <select name="orapmar0">
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
                    <input type="checkbox" class="giorno" name="mar1" value="mar1"> Cena   <select name="orapmar1">
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
                    <input type="checkbox" class="giorno" name="mer0" value="mer0"> Pranzo     <select name="orapmer0">
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
                    <input type="checkbox" class="giorno" name="mer1" value="mer1"> Cena <select name="orapmer1">
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
                    <input type="checkbox" class="giorno" name="gio0" value="gio0"> Pranzo     <select name="orapgio0">
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
                    <input type="checkbox" class="giorno" name="gio1" value="gio1"> Cena   <select name="orapgio1">
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
                    <input type="checkbox" class="giorno" name="ven0" value="ven0"> Pranzo     <select name="orapven0">
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
                    <input type="checkbox" class="giorno" name="ven1" value="ven1"> Cena   <select name="orapven1">
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
                    <input type="checkbox" class="giorno" name="sab0" value="sab0"> Pranzo <select name="orapsab0">
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

                    <input type="checkbox" class="giorno" name="sab1" value="sab1"> Cena   <select name="orapsab1">
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
                    <input type="checkbox" class="giorno" name="dom0" value="dom0"> Pranzo <select name="orapdom0">
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
                    <input type="checkbox" class="giorno" name="dom1" value="dom1"> Cena   <select name="orapdom1">
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
                </div>
            </div>
            </center>
            <center>
            

                <div class="col-md-10 col-md-offset-1">

                </div>

                <div class="col-xs-6 col-md-6 col-md-offset-3 col-xs-offset-3 hid">
                    <div class="form-group2">
                            <center><h4>Password:</h4></center>
                            <input type="password" name="password" id="display_name" class="form-control input-lg" placeholder="Inserisci la password per confermare le modifiche" tabindex="3">
                            <input type="hidden" name="email" value="<%=utente.getEmail() %>">
                    </div>
                </div>
                    <hr class="colorgraph col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1">

            </center>
            <div class="row hid">

                <div class="row">

                    <div class="col-xs-6 col-xs-offset-3 col-md-4 col-md-offset-4">
                        <button type="submit" onclick=ristorante() class="btn btn-primary btn-block btn-lg Azzurro" tabindex="7"> Modifica </button>
                    </div>
                </div>
            </div>
	</div>
    </body>
</html>
