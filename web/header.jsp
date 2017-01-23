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
        <link rel="stylesheet" href="css/flexform.css">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <div class="row">
            <div class="col-md-3 ">  
            </div>
            
            <div class="col-md-6 col-xs-10"> 
                <form action=Ricerca.jsp method=GET>
                    <img src="Magnagioia_orange.png" id="logo" alt="Magnagioia"  width="100%">
                        <p> Ricerca per: 
                        <input type="radio" name="ricerca" value="zona" checked="checked"> Zona
                        <input type="radio" name="ricerca" value="cucina"> Cucina
                        <input type="radio" name="ricerca" value="nome"> Nome
                        <input type="radio" name="ricerca" value="indirizzo"> Indirizzo
                        </p>
                    <div>
                            <div class="flexsearch">
                                            <div class="flexsearch--wrapper">
                                                 <div class="flexsearch-form" id="mainForm">
                                                        <div class="flexsearch--input-wrapper">
                                                                <input class="flexsearch--input"  name=search" placeholder="cerca">
                                                        </div>
                                                        <input class="flexsearch--submit" type="submit" value="&#10140;"/>
                                                </div>
                                        </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <div class="col-md-3 col-xs-2">
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
                <%
                    //<ul class="nav navbar-nav navbar-right">
                    //<li class="dropdown">
                        //<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">Logged in as %>
                        <%= utente.getNome()+" "+utente.getCognome()%> <% //<span class="caret"></span></a>
                        //<ul class="dropdown-menu"> %>
                            <% 
                                String ruolo = utente.getRuolo();
                                out.println(ruolo);
                                if(ruolo.contains("admin")){ %>
                                <li><a href="admin.jsp">Notifiche</a></li>
                            <% } else if(ruolo.contains("owner")) { %>
                                <li><a href="owner.jsp">Notifiche</a></li>
                                <li><a href="impostazioni_ristorante.jsp">Ristorante</a></li>
                            <% } else { %>
                                <li><a href="user.jsp">Notifiche</a></li>
                            <% } %>
                            <% //<li role="separator" class="divider"></li> %>
                            <li><a href="impostazioni_profilo.jsp">Nome e Cognome</a></li>
                            <% //<li role="separator" class="divider"></li> %>
                            <li><a href="User">Esci</a></li> <%
                        //</ul>
                    //</li>
                //</ul> %>
                <% } %>
            </div>
             
	
    </body>
</html>
