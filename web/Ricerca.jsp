<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html SISTEMARE PAGINA INSERENDO L'HEADER>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        
        <link href="style2.css" rel="stylesheet" type="text/css">
        <link href="Login.css" rel="stylesheet" type="text/css">
        <title>Magnagioia</title>
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
            
            <div class="row10">
                <div class="col-md-4 col-xs-12">
                    <div class="container">
                        <form>
                          <fieldset class="form-group row2">
                            <legend class="col-form-legend col-sm-2">Ordina per:</legend>
                            <div class="col-sm-10">
                              <div class="form-check">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                                  Classifica
                                </label>
                              </div>
                              <div class="form-check">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                  Alfabeto
                                </label>
                              </div>
                              <div class="form-check disabled">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
                                  Fascia di Prezzo
                                </label>
                              </div>
                            </div>
                          </fieldset>
                          
                          <div class="form-group row2">
                            <div class="offset-sm-2 col-sm-10">
                              <button type="submit" class="btn btn-primary">Cerca</button>
                            </div>
                          </div>
                        </form>
              </div>
                    
                </div>
                
                <%! private DBManager manager; %>
                <%! 
                    public void init() throws ServletException {
                    // inizializza il DBManager dagli attributi di Application
                    this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                    //System.out.println("DBManager attivato\n");
                    } 
                %>
        
                <%
                    ResultSet ristoranti;
                    if(request.getParameter("type") == "zona"){
                        String lon = request.getParameter("Longitude");
                        String lat = request.getParameter("Latitude");
                        String distance = request.getParameter("distance");
                        String sql = "SELECT id FROM (SELECT R.id as id, sqrt(pow(C.longitude - ?,2) + pow(C.latitude - ?,2)) as distance FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant  RC.id_coordinate = C.id ORDER BY sqrt(pow(C.longitude - ?,2) + pow(C.latitude - ?,2)) DESC) WHERE distance * 999.6 < ?";
                        ristoranti = manager.getData(sql,lon,lat,lon,lat,distance);
                    }
                    else if(request.getParameter("type") == "cuisine"){
                        String cuisine = request.getParameter("cuisine");
                        String sql = "SELECT R.id FROM mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C WHERE R.id = RC.id_restaurant AND RC.id_cousine = C.id AND C.name = ?";
                        ristoranti = manager.getData(sql,cuisine);
                    }
                    else if(request.getParameter("type") == "name"){
                        String name = request.getParameter("name");
                        String sql = "SELECT id FROM mainagioia.Restaurants WHERE name LIKE ?";
                        ristoranti = manager.getData(sql,name);
                    }
                    else if(request.getParameter("type") == "address"){
                        String address = request.getParameter("address");
                        String sql = "SELECT R.id FROM FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND C.address LIKE ?";
                        ristoranti = manager.getData(sql,address);
                    }
                    else{
                        //avviso che non sono stati trovati ristoranti con i parametri selezionati
                    }
                    
                %>
                
                <div class="col-md-2 col-xs-3">
                    
                    <img src="ristorantiprova.jpeg" width="80%">
                    nome con link
                    valutazione + numero di recensioni
                    cucina
                    
                    
                </div>
                <div class="col-md-2 col-xs-3">
                     <img src="ristorantiprova.jpeg" width="80%">
                    nome con link
                    valutazione + numero di recensioni
                    cucina
                </div>
                <div class="col-md-2 col-xs-3">
                     <img src="ristorantiprova.jpeg" width="80%">
                    nome con link
                    valutazione + numero di recensioni
                    cucina
                </div>
                <div class="col-md-2 col-xs-3">
                     <img src="ristorantiprova.jpeg" width="80%">
                    nome con link
                    valutazione + numero di recensioni
                    cucina
                </div>
                
            </div>