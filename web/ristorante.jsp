<%-- 
    Document   : ristorante
    Created on : Jan 17, 2017, 12:06:37 PM
    Author     : adribuc
--%>

<%@page import="db.DBManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.Ristorante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html    DA SISTEMARE SFONDO PER INSERIRE HEADER>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

        <link href="style2.css" rel="stylesheet" type="text/css">
        <link href="Commenti.css" rel="stylesheet" type="text/css">
        
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
        
        <%! private DBManager manager; %>
            <%! 
                public void init() throws ServletException {
                    // inizializza il DBManager dagli attributi di Application
                    this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                    //System.out.println("DBManager attivato\n");
                } 
            %>
        
        <%
        String idris = request.getParameter("idris");
        String sql = "SELECT * FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Restaurant_cuisine as C, mainagioia.Price_ranges as P, mainagioia.Opening_hours_range_restaurant_coordinate as O  WHERE R.id = ? AND R.id = RC.id_restaurant AND R.id = C.id_restaurant AND R.id = P.id AND R.id = O.id_restaurant";
        ResultSet ristorante = manager.getData(sql, idris);
        %>
        
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
                    <b><% out.println(ristorante.getString("name")); %></b>
                    
                </div>
                
                <div class="col-md-4 col-xs-4">
                    valutazione <% out.println(ristorante.getString("global_value")); %>
                </div>
                <div class="col-md-3 col-xs-3">
                    <center><button type="button" class="btn btn-primary">Scrivi una Recensione</button></center>
                    
                </div>
            </div>
        
            <div class="row3">
                <div class="col-md-2 col-xs-2">
                    
                </div>
                
                
                <div class="col-md-4 col-xs-4">
                    descrizione: <% out.println(ristorante.getString("description")); %>
                    </div>
                
                
                
                <div class="col-md-3 col-xs-3">
                    <table class="table">
                    <thead>
                      <tr>
                    <th>Orari</th>
                      </tr>
                    </thead>
                    <tbody>
                        <% //Dopo aver gestito l'SQL in modo che ritorni un array allora si può fare un while dove si scrivono gli orari in una tabella %>
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
        
        
        <div class="row2">
             
                
                <div class="col-md-12 col-xs-12">
                    <table class="table table-bordered">
                    <thead>
                      <tr>
                          
                        <th>Indirizzo</th>
                        <th>Prezzo</th>
                        <th>Cucina</th>
                        <th>Sito</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><% 
                            String idcoo = ristorante.getString("id_coordinate");
                            String sql2 = "SELECT address FROM mainagioia.coordinates WHERE id = ?";
                            ResultSet address = manager.getData(sql2,idcoo);
                            out.println(address.getString(1)); %></td>
                        <td><% 
                            String idpri = ristorante.getString("P.id");
                            String sql3 = "SELECT name FROM mainagioia.price_ranges WHERE id = ?";
                            ResultSet price = manager.getData(sql3,idpri);
                            out.println(price.getString(1)); //si potrebbe anche stamparlo come icone in € volendo %></td>
                        <td><% 
                            String idcui = ristorante.getString("C.id_cuisine");
                            String sql4 = "SELECT name FROM mainagioia.cuisines WHERE id = ?";
                            ResultSet cuisine = manager.getData(sql4,idcui);
                                while(price.next())
                                        out.print(cuisine.getString("name")+", "); %></td>
                        <td><% out.println(ristorante.getString("web_site_url")); %></td>
                      </tr>
                     
                    </tbody>
                  </table>
                </div>
               
            
        </div>
        
        <div class="row6"> 
            <div class="col-md-12 col-xs-12">
                <div class="container">
                   <div class="row">
                   <div class="">
                       <h3><center>Scopri le recensioni dei clienti:</center></h3>
                   </div><!-- /col-sm-12 -->
                   </div><!-- /row -->
                   <div class="row">
                   <div class="col-sm-1 col-xs-2">
                   <div class="thumbnail">
                   <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   </div><!-- /thumbnail -->
                   </div><!-- /col-sm-1 -->

                   <div class="col-sm-5 col-xs-10">
                   <div class="panel panel-default">
                   <div class="panel-heading">
                   <strong>myusername</strong> <span class="text-muted">commented 5 days ago</span>
                   </div>
                   <div class="panel-body">
                   Panel content
                   </div><!-- /panel-body -->
                   </div><!-- /panel panel-default -->
                   </div><!-- /col-sm-5 -->

                   <div class="col-sm-1 col-xs-2">
                   <div class="thumbnail">
                   <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   </div><!-- /thumbnail -->
                   </div><!-- /col-sm-1 -->

                   <div class="col-sm-5 col-xs-10">
                   <div class="panel panel-default">
                   <div class="panel-heading">
                   <strong>myusername</strong> <span class="text-muted">commented 5 days ago</span>
                   </div>
                   <div class="panel-body">
                   Panel content
                   </div><!-- /panel-body -->
                   </div><!-- /panel panel-default -->
                   </div><!-- /col-sm-5 -->
                   </div><!-- /row -->
                   
                   <div class="row">
                   <div class="col-sm-1 col-xs-2">
                   <div class="thumbnail">
                   <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   </div><!-- /thumbnail -->
                   </div><!-- /col-sm-1 -->

                   <div class="col-sm-5 col-xs-10">
                   <div class="panel panel-default">
                   <div class="panel-heading">
                   <strong>myusername</strong> <span class="text-muted">commented 5 days ago</span>
                   </div>
                   <div class="panel-body">
                   Panel content
                   </div><!-- /panel-body -->
                   </div><!-- /panel panel-default -->
                   </div><!-- /col-sm-5 -->

                   <div class="col-sm-1 col-xs-2">
                   <div class="thumbnail">
                   <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   </div><!-- /thumbnail -->
                   </div><!-- /col-sm-1 -->

                   <div class="col-sm-5 col-xs-10">
                   <div class="panel panel-default">
                   <div class="panel-heading">
                   <strong>myusername</strong> <span class="text-muted">commented 5 days ago</span>
                   </div>
                   <div class="panel-body">
                   Panel content
                   </div><!-- /panel-body -->
                   </div><!-- /panel panel-default -->
                   </div><!-- /col-sm-5 -->
                   </div><!-- /row -->
                   
                   
                   
                   

            </div><!-- /container -->
             </div>
        </div>
            
       
        
        
            
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</html>
    
    