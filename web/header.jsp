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
        <script type="text/javascript">
        window.onload = savecheckbox('ricerca');
        </script>
        <link rel="stylesheet" href="css/flexform.css">
        <link rel="stylesheet" href="css/Menu_tendina.css">
        <title>JSP Page</title>
    </head>
    <body>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <div class="row header">
            <div class="col-md-3 col-xs-1">  
            </div>
            
            <div class="col-md-6 col-xs-8"> 
                <form action=Ricerca.jsp method=GET>
                    <img src="img/Magnagioia_orange.png" id="logo" alt="Magnagioia"  width="100%">
                        <div id="Ricerca_per">
                            <center>
                        <p> Ricerca per: 
                        <input type="radio" id="r1" name="ricerca" value="zona" checked="checked"> Zona
                        <input type="radio" id="r2" name="ricerca" value="cucina"> Cucina
                        <input type="radio" id="r3" name="ricerca" value="nome"> Nome
                        <input type="radio" id="r4" name="ricerca" value="indirizzo"> Indirizzo
                        </p>
                            </center>
                       
                            <div class="flexsearch">
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
            </div>
            
            <div class="col-md-3 col-xs-3">
                <%
                HttpSession ses = request.getSession();
                Utente utente;
                utente = (Utente)ses.getAttribute("utente");
                if(utente==null){
                   
                %>
                <a href="login.jsp">ACCEDI</a> | <a href="registrazione.jsp">REGISTRATI</a>
               
                <% }
                else


                {
                %>
                
	
        <div class="dropdown">
		<button type="button" class="btn dropdown-toggle Arancio" id="dropdownMenu1" data-toggle="dropdown">
            <%= utente.getNome()+" "+utente.getCognome()%> <span class="caret"></span>
        </button>
        
        <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu1">
            <% 
                                String ruolo = utente.getRuolo();
                             if(ruolo.contains("owner")) { %>
                                <li><a href="impostazioni_ristorante.jsp">Gestisci Ristorante</a></li>
                            <% } %>
                                <li><a href="user.jsp">Notifiche</a></li>
                            
                            <li><a href="impostazioni_profilo.jsp">Gestisci Profilo</a></li>
                            <li><a href="Inserisci_ristorante.jsp">Aggiungi Ristorante</a></li>
                           
                            <li><a href="User">Esci</a></li> 
                <% } %>
        </ul>
        
                            
            </div>
        </div>
    </body>
</html>
