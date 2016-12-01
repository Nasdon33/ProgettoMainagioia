<%-- 
    Document   : index
    Created on : Jun 14, 2016, 12:35:48 PM
    Author     : carlo.toniatti-2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css">
        <title>Magnagioia</title>
    </head>
    <body>
        <div id="menu">
            <div id="intestazione">
               
                    <img src="Magnagioia_orange.png" id="logo" alt="Magnagioia">
                    <form id="ricerca_per" action="">
                        <p id="testo"> Ricerca per: 
                        <input type="radio" name="ricerca" value="zona" checked="checked"> Zona
                        <input type="radio" name="ricerca" value="cucina"> Cucina
                        <input type="radio" name="ricerca" value="nome"> Nome
                        <input type="radio" name="ricerca" value="indirizzo"> Indirizzo
                        </p>
                    </form>
                    <div id="cerca">
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
            
        <div id="contenitore">
            <div id ="ristorante1">
                <div id="immagine_ristorante">
                    

                </div>
                
                <div id="descrizone_ristorante">
                   
                </div>
            
            </div>
            
            
                
            <div id="footer"></div>
            </div>
        </div>
    </body>
</html>
