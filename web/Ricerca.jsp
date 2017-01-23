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
       <%@include file="header.jsp" %>
            
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
                    String tipo = request.getParameter("ricerca");
                    out.print(tipo);
                    String stringa = request.getParameter("search");
                    out.print(stringa);
                    if(tipo.contains("zona")){ //da fare per bene
                        /*String lon = request.getParameter("Longitude");
                        String lat = request.getParameter("Latitude");
                        String sql = "SELECT id, name FROM (SELECT R.id as id, sqrt(pow(C.longitude - ?,2) + pow(C.latitude - ?,2)) as distance FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant  RC.id_coordinate = C.id ORDER BY sqrt(pow(C.longitude - ?,2) + pow(C.latitude - ?,2)) DESC) WHERE distance * 999.6 < ?";
                        ristoranti = manager.getData(sql,lon,lat,lon,lat,stringa);*/
                        
                        ristoranti = null;
                    }
                    else if(tipo.contains("cucina")){
                        String sql = "SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C WHERE R.id = RC.id_restaurant AND RC.id_cousine = C.id AND C.name like '%Italiana%'";
                        ristoranti = manager.getData(sql);
                    }
                    else if(tipo.contains("nome")){
                        String sql = "SELECT id, name FROM mainagioia.Restaurants WHERE name LIKE '%?%'";
                        ristoranti = manager.getData(sql,stringa);
                    }
                    else if(tipo.contains("indirizzo")){
                        String sql = "SELECT R.id, R.name FROM FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND C.address LIKE '%?%'";
                        ristoranti = manager.getData(sql,stringa);
                    }
                    else
                        ristoranti = null;
                    
                    if(ristoranti == null){                        
                    %>
                    <div>
                        NESSUN RISTORANTE TROVATO
                    </div>
                    <%          
                    }
                    else{
                    ristoranti.next();
                    while(ristoranti.next()){
                        String idris = ristoranti.getString("id");
                    %>
                    <div class="col-md-2 col-xs-3">
                    
                    <img src="ristorantiprova.jpeg" width="80%">
                    <a href="ristorante.jsp?id=<%=idris %>" > <%=ristoranti.getString("name") %> </a>
                     
                    Voto: 
                    <%
                        String sql = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                        ResultSet recensioni = manager.getData(sql,idris);
                        int c = 0;
                        int voto = 0;
                        while(recensioni.next()){
                            c++;
                            voto += recensioni.getInt("global_value");
                        }
                        for(int k = voto / c; k > 0; k--)
                            out.print("♥");
                        out.print(" su "+c+" Recensioni");
                        %>
                    Cucina: 
                    <%
                        String sql1 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                        ResultSet cuisine = manager.getData(sql1,idris);
                        cuisine.next();
                        out.print(cuisine.getString("name"));
                        while(cuisine.next())
                                out.print(", " + cuisine.getString("name"));
                    %>
                    
                    
                </div>
                <%
                    }
                }
                %>
                
                <% /*
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
                </div> */
                    %>
                
            </div>