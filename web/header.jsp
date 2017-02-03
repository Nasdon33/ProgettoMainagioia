<%-- 
    Document   : header
    Created on : 19-gen-2017, 10.28.27
    Author     : Carlo
--%>

<%@page import="db.Utente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
       <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
       <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/autocomplete.js"></script>
        <link rel="stylesheet" href="css/flexform.css">
        <link rel="stylesheet" href="css/Menu_tendina.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row header">
            <div class="col-md-3 col-xs-1">  
            </div>
            
            <div class="col-md-6 col-xs-8"> 
                <form action=Ricerca.jsp method=GET>
                    <a href="index_nuovo.jsp"><img src="img/Magnagioia_orange.png" id="logo" alt="Magnagioia"  width="100%"> </a> <!-- logo pagina con link per tornare a index -->
                            <center>
                        <p> Ricerca per: <!-- ricerca per -->
                        <input type="radio" id="r1" name="ricerca" value="zona" checked="checked"> Zona
                        <input type="radio" id="r2" name="ricerca" value="cucina"> Cucina
                        <input type="radio" id="r3" name="ricerca" value="nome"> Nome
                        <input type="radio" id="r4" name="ricerca" value="indirizzo"> Indirizzo
                        </p>
                            </center>
                       
                            <div class="flexsearch" style="padding-bottom: 5px"> <!-- barra di ricerca con tasto incluso -->
                                            <div class="flexsearch--wrapper">
                                                 <div class="flexsearch-form" id="mainForm">
                                                        <div class="flexsearch--input-wrapper">
                                                            <%
                                                                String ricerca = request.getParameter("search");
                                                                if(ricerca == null){ 
                                                            %>
                                                                    <input class="flexsearch--input" id="ricerca" name="search" placeholder="cerca">
                                                            <% } 
                                                            else 
                                                            {
                                                            %>
                                                           <input class="flexsearch--input" id="ricerca" name="search" placeholder="<%=ricerca %>" >
                                                           <%
                                                           }
                                                           %>
                                                        </div>
                                                        <input class="flexsearch--submit" type="submit" value="&#10140;"/>
                                                        
                                                </div>
                                        </div>
                        </div>
                    </div>
                </form>
            
                                                        
                                                       
            
            <div class="col-md-3 col-xs-3"> <!-- tasti accedi e registrati, quando effettuato l'accesso diventa menù dropdown con informazioni sul proilo -->
                <%
                HttpSession ses = request.getSession();
                Utente utente;
                utente = (Utente)ses.getAttribute("utente");
                if(utente==null){
                   
                %>
                
<a class="btn icon-btn btn-info btn-responsive" href="login.jsp"><span class="glyphicon btn-glyphicon glyphicon-log-in img-circle"></span> ACCEDI</a>
<a class="btn icon-btn btn-info btn-responsive" href="registrazione.jsp"><span class="glyphicon btn-glyphicon glyphicon-user img-circle"></span> REGISTRATI</a>
</div>
                <% }
                else


                {
                %>
                
        <div class="dropdown"> <!-- menù dropdown dopo il login -->

		<button type="button" class="btn btn icon-btn btn-info dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown"><span class="glyphicon btn-glyphicon glyphicon-user img-circle"></span>
            <%= utente.getNome()+" "+utente.getCognome()%> <span class="caret"></span>
        </button>
        
        <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu1">
            <% 
                                String ruolo = utente.getRuolo();
                             if(ruolo.contains("owner")) { %>
                             <li><a href="impostazioni_ristorante.jsp?id=<%=utente.getId() %>"><span class="glyphicon glyphicon-cog"></span> Gestisci Ristorante</a></li>
                            <% } %>
                                <li><a href="user.jsp?id=<%=utente.getId() %>"><span class="glyphicon glyphicon-bell"></span> Notifiche</a></li>
                            
                            <li><a href="impostazioni_profilo.jsp"><span class="glyphicon glyphicon-cog"></span> Gestisci Profilo</a></li>
                            <li><a href="Inserisci_ristorante.jsp"><span class="glyphicon glyphicon-plus"></span> Aggiungi Ristorante</a></li>
                           
                            <li><a href="User"><span class="glyphicon glyphicon-log-out"></span> Esci</a></li> 
                <% } %>
        </ul>
        
                            
            </div>
        </div>
    
    </body>
</html>
