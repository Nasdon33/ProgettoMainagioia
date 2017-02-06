<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <title>Ricerca</title>
    </head>
    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        <script src="js/ricerca.js"></script>
        <%
            String tipo = request.getParameter("paramricerca");
            String stringa = request.getParameter("search");
            String radiob = request.getParameter("radioidord");
            System.out.println("TIPO RICERCA= "+tipo);
            System.out.println("STRINGA INSERITA= "+stringa);
            System.out.println("RADIO= "+radiob);
        %>
        <input type="hidden" name="paramricercatmp" value="<%=tipo%>">
        <br>
        <div class="col-md-3 blocca" id="Sparisci" style="background-color: white; opacity:0.9; border-radius: 30px; border: #D8D8D8 0.3px solid;"> <!-- inizio div per ordinare i risultati -->
             <div class="container">
                <form action="Ricerca.jsp" name="scelte" method="GET">
                    <input type="hidden" name="paramricerca" id="tmp" value="">
                    <input type="hidden" name="search" id="tmp" value="<%=stringa%>">
                    <input type="hidden" name="paramradiob" value="<%=radiob%>">
                    <div>
                        <p class="col-form-legend" id="Font">Ordina per:</p> <!-- ordinare i risultati -->
                        <div class="col-sm-12" id="Spazio">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="radioidord" id="gridRadios1" value="gridRadios1" checked>
                                    Classifica <span class="glyphicon glyphicon-stats"></span>
                                </label>
                            </div>
                            <div class="form-check"id="Spazio">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="radioidord" id="gridRadios2" value="gridRadios2">
                                    Nome <span class="glyphicon glyphicon-sort-by-alphabet"></span>
                                </label>
                            </div>
                            <div class="form-check disabled"id="Spazio">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="radioidord" id="gridRadios3" value="gridRadios3">
                                    Fascia di Prezzo <span class="glyphicon glyphicon-euro"></span>
                                </label>
                            </div>
                        </div>
                        <div class="offset-md-3 col-xs-2" id="Spazio">
                            <button type="submit" class="btn btn-primary btn-responsive Azzurro">Cerca</button>
                        </div>
                    </div>
                </form>
            </div>         
        </div> <!-- fine div -->
        <div class="col-xs-12 Sparisci_2"> <!-- tasto dropdown che sostituisce il div "ordina per" quando lo schermo va in xs -->
            <div class="row">
                <center>
                    <div class="btn-group show-on-hover">
                        <button type="button" class="btn btn-info dropdown-toggle btn-responsive" data-toggle="dropdown">
                        Ordina Per <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span class="glyphicon glyphicon-stats"></span> Classifica</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-sort-by-alphabet"></span> Nome</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-euro"></span> Fascia di Prezzo</a></li>
                        </ul>
                        <br>
                    </div>
                </center>
            </div>
        </div>       
        <div class="col-md-9 col-md-offset-3 col-xs-12" id="SpazioRicerca" > <!-- mostra i risultati della ricerca -->
        <%! private DBManager manager; %>
        <%!
           public void init() throws ServletException {
               // inizializza il DBManager dagli attributi di Application
               this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
               //System.out.println("DBManager attivato\n");
           }
        %>
        </div>
    </body>
</html>