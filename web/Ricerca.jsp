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
    

        <br>
            
                <div class="col-md-3 blocca" id="Sparisci" style="background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.3px solid;"> <!-- inizio div per ordinare i risultati -->
                    
                    <div class="container">
                        
                        <form>
                            <div>
                                
                                <p class="col-form-legend" id="Font">Ordina per:</p>
                            
                            <div class="col-sm-12" id="Spazio">
                              <div class="form-check">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                                  Classifica <span class="glyphicon glyphicon-stats"></span> 
                                </label>
                              </div>
                              <div class="form-check"id="Spazio">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                  Nome <span class="glyphicon glyphicon-sort-by-alphabet"></span> 
                                </label>
                              </div>
                              <div class="form-check disabled"id="Spazio">
                                <label class="form-check-label">
                                  <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3">
                                  Fascia di Prezzo <span class="glyphicon glyphicon-euro"></span> 
                                </label>
                              </div>
                              </div>
                           
                            
                            <div class="offset-md-3 col-xs-2" id="Spazio">
                              <button type="submit" class="btn btn-primary btn-responsive Azzurro">Cerca</button>
                            </div>
                                
                                
                               
                                 </div>
                           
                           </div>
                            
                        </form>
                        
                    </div> <!-- fine div -->
                    
                </div>
                <div class="col-xs-12 Sparisci_2"> <!-- tasto dropdown che sostituisce il div "ordina per" quando lo schermo va in xs -->
                    <div class="row">
        
        
		<!-- Our Special dropdown has class show-on-hover -->
                <center>
        <div class="btn-group show-on-hover">
           
            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
            Ordina Per <span class="caret"></span>
          </button>
            
          <ul class="dropdown-menu" role="menu">
            <li><a href="#"><span class="glyphicon glyphicon-stats"></span> Classifica</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-sort-by-alphabet"></span> Nome</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-euro"></span> Fascia di Prezzo</a></li>
          </ul>
                
        </div>
                </center>
                </div>
                
            </div>
       
        
                          
                          
                          
            
                    
        <div class="col-md-9 col-md-offset-3 col-xs-12" id="Spazio" > <!-- mostra i risultati della ricerca -->
               
                
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
                    String stringa = request.getParameter("search");
                    if(tipo.contains("zona")){ //da fare per bene
                        String sql = ("SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND (C.city = ? OR C.province = ? OR C.state = ?)");
                        ristoranti = manager.getData(sql, stringa, stringa, stringa);
                        
                    }
                    else if(tipo.contains("cucina")){
                        String sql = "SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C WHERE R.id = RC.id_restaurant AND RC.id_cousine = C.id AND C.name  = ?";
                        ristoranti = manager.getData(sql, stringa);
                    }
                    else if(tipo.contains("nome")){
                        String sql = "SELECT id, name FROM mainagioia.Restaurants WHERE name like ?";
                        ristoranti = manager.getData(sql,"%" + stringa + "%");
                    }
                    else{
                        String sql = ("SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND C.address like ? ");
                        ristoranti = manager.getData(sql,"%" + stringa + "%");
                    }
                    
                    if(!ristoranti.next()){                        
                    %>
                    <div class="col-md-12 col-xs-12 " style="background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.3px solid;">
                        <center>   <p style="color:red">**NESSUN RISTORANTE TROVATO**</p></center>
                    </div>
                    <%          
                    }
                    else{
                    do{
                        String idris = ristoranti.getString("id");
                    %>
                   
                    <div class="col-md-4 col-xs-4 btn-responsive" id="Altezza" style="background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.5px solid;">
                       <br>
                        <center>
                            <%
                            String sql10 = "SELECT path FROM Mainagioia.Photos WHERE id_restaurant = ? AND description='Principale'";
                            ResultSet foto = manager.getData(sql10,idris);
                            foto.next();
                        %>
                        <a href="ristorante.jsp?id=<%=idris %>"><img src="<%=foto.getString("path") %>" width="90%" style="border-radius: 30px"></a>
                    <br>
                    <a href="ristorante.jsp?id=<%=idris %>" style="font-size:18px; color: #5bc0de"> <%=ristoranti.getString("name") %> </a>
                    <br>
                    
                    <%
                        String sql = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                        ResultSet recensioni = manager.getData(sql,idris);
                        int c = 0;
                        int voto = 0;
                        while(recensioni.next()){
                            c++;
                            voto += recensioni.getInt("global_value");
                        }
                        if(c > 0){
                            out.print("Voto: ");
                            for(int k = voto / c; k > 0; k--)
                                out.print("♥");
                            out.print(" su "+c+" Recensioni");
                        }
                        else
                            out.print("0 Recensioni");
                        %>
                        <br>
                    Cucina: 
                    <%
                        String sql1 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                        ResultSet cuisine = manager.getData(sql1,idris);
                        cuisine.next();
                        out.print(cuisine.getString("name"));
                        while(cuisine.next())
                                out.print(", " + cuisine.getString("name"));
                    %>
                    
                        </center>
                    <br>
                </div>
                   
                <%
                    }while(ristoranti.next());
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
