<%-- 
    Document   : ristorante
    Created on : Jan 17, 2017, 12:06:37 PM
    Author     : adribuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

        <link href="style2.css" rel="stylesheet" type="text/css">
        <link href="Login.css" rel="stylesheet" type="text/css">
        <title>Ristorante Magnagioia</title>
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
             ACCEDI | REGISTRATI   
            </div>
        </div>
        
        <div class="row_separatoria">
            <div class="col-md-12">
                <center> Ristoranti > Trento > NOME </center>
            </div>
            
        </div>
            <div class="row2">
                <div class="col-md-3 col-xs-3">
                    <img src="ristorantiprova.jpeg" width="100%">
                </div>
                <div class="col-md-2 col-xs-2">
                    <b>NOME</b>
                    
                </div>
                
                <div class="col-md-4 col-xs-4">
                    valutazione
                </div>
                <div class="col-md- col-xs-3">
                    <center><button type="button" class="btn btn-primary">Scrivi una Recensione</button></center>
                    
                </div>
            </div>
        
            <div class="row3">
                
                
                <div class="col-md-4 col-xs-4">
                    descrizione
                    </div>
                
                
                
                <div class="col-md-3 col-xs-3">
                    <table class="table">
                    <thead>
                      <tr>
                    <th>Orari</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>11.30-14.00</td>
                        <td id="aperto">Ora aperto</td> 
                      </tr>
                      <tr>
                          <td>18.00-22.00</td>
                      </tr>
                     
                    </tbody>
                  </table>
                    
                </div>
                </div>
        
        
        <div class="row5">
             
                
                <div class="col-md-12 col-xs-12">
                    <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Indirizzo</th>
                        <th>Città (CAP)</th>
                        <th>Prezzo</th>
                        <th>Cucina</th>
                        <th>Telefono</th>
                        <th>Sito</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Via Marogone di Ravina, 15</td>
                        <td>Trento (38123)</td>
                        <td>€€€</td>
                        <td>Italiana, Tipica</td>
                        <td>046448585</td>
                        <td>www.pinkopallo.it</td>
                      </tr>
                     
                    </tbody>
                  </table>
                </div>
               
            
        </div>
            
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</html>
    
    