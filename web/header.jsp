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
        <title>JSP Page</title>
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <div class="row">
            <div class="col-md-3 ">  
            </div>
            
            <div class="col-md-6 col-xs-10">

               
                    <img src="Magnagioia_orange.png" id="logo" alt="Magnagioia"  width="100%">
                    <form action="" id="Cerca_per" >
                        <p> Ricerca per: 
                        <input type="radio" name="ricerca" value="zona" checked="checked"> Zona
                        <input type="radio" name="ricerca" value="cucina"> Cucina
                        <input type="radio" name="ricerca" value="nome"> Nome
                        <input type="radio" name="ricerca" value="indirizzo"> Indirizzo
                        </p>
                    </form> 
                    <div>
                        <div class="flexsearch">
                                        <div class="flexsearch--wrapper">
                                                <form class="flexsearch--form" action="#" method="post">
                                                        <div class="flexsearch--input-wrapper">
                                                                <input class="flexsearch--input" type="search" placeholder="cerca">
                                                        </div>
                                                        <input class="flexsearch--submit" type="submit" value="&#10140;"/>
                                                </form>
                                        </div>
                        </div>
                    </div>
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
                <a href="User">LOGOUT</a>
                <% } %>
            </div>
    </body>
</html>
