<%-- 
    Document   : ristorante
    Created on : Jan 17, 2017, 12:06:37 PM
    Author     : adribuc
--%>

<%@page import="java.sql.Timestamp"%>
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

        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <link href="css/Commenti.css" rel="stylesheet" type="text/css">
        <link href="css/Valutazione.css" rel="stylesheet" type="text/css">
        <link href="css/recensione.css" rel="stylesheet" type="text/css">
        
        <title>Ristorante Magnagioia</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
        <%! private DBManager manager; %>
            <%! 
                public void init() throws ServletException {
                    // inizializza il DBManager dagli attributi di Application
                    this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                    //System.out.println("DBManager attivato\n");
                } 
            %>
        
        <%
        String idris = request.getParameter("id");
        String sql = "SELECT R.NAME, R.DESCRIPTION, R.WEB_SITE_URL, RC.ID_COORDINATE, P.ID FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Price_ranges as P  WHERE R.id = ? AND R.id = RC.id_restaurant AND R.ID_PRICE_RANGE = P.id";
        ResultSet ristorante = manager.getData(sql, idris);
        ristorante.next();
        
        %>
        
        <div class="row_separatoria">
            <div class="col-md-12">
                <center> Ristoranti > Trento > NOME </center>
            </div>
            
        </div>
            <div class="row2">
                <div class="col-md-3 col-xs-3">
                    <div>
                    <img src="ristorantiprova.jpeg" width="100%">
                    </div>
                    
                </div>
                
                <div class="col-md-4 col-xs-4">
                    <b><%= ristorante.getString("name") %></b>
                    
                </div>
                <div class="col-md-2">
                    
                </div>
                
                <div class="col-md-3 col-xs-5">
                    <center>  <button name="button" class="btn btn-primary btn-responsive">Scrivi una Recensione</button>
                        <button name="button" class="btn btn-primary btn-responsive" id="Sparisci_2">Visualizza Orari</button>
                    </center>
                </div>
            </div>
        
            <div class="row3">
                
                
                <div class="col-md-5 col-xs-9" id="spazio">
                    <div>
                    descrizione: <% out.println(ristorante.getString("description")); %>
                    </div>
                    <hr>
                    <div class="col-md-12 col-xs-12" id="Sparisci_3">
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div class="well well-sm">
                                        <div class="row">
                                            <div class="col-xs-5 col-md-5 text-center">
                                                <h1 class="rating-num">
                                                    4.0</h1>
                                                <div class="rating">
                                                    <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                                                    </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                                                    </span><span class="glyphicon glyphicon-star-empty"></span>
                                                </div>
                                                <div>
                                                    <span class="glyphicon glyphicon-user"></span>1,050,008 total
                                                </div>
                                            </div>
                                            <div class="col-xs-7 col-md-7" id="sx">
                                                <div class="row rating-desc">
                                                    <div class="col-xs-3 col-md-3 text-right">
                                                        <span class="glyphicon glyphicon-star"></span>5
                                                    </div>
                                                    <div class="col-xs-8 col-md-9">
                                                        <div class="progress progress-striped">
                                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                                                aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                                                <span class="sr-only">80%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end 5 -->
                                                    <div class="col-xs-3 col-md-3 text-right">
                                                        <span class="glyphicon glyphicon-star"></span>4
                                                    </div>
                                                    <div class="col-xs-8 col-md-9">
                                                        <div class="progress">
                                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                                                aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                                <span class="sr-only">60%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end 4 -->
                                                    <div class="col-xs-3 col-md-3 text-right">
                                                        <span class="glyphicon glyphicon-star"></span>3
                                                    </div>
                                                    <div class="col-xs-8 col-md-9">
                                                        <div class="progress">
                                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                                                aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                                <span class="sr-only">40%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end 3 -->
                                                    <div class="col-xs-3 col-md-3 text-right">
                                                        <span class="glyphicon glyphicon-star"></span>2
                                                    </div>
                                                    <div class="col-xs-8 col-md-9">
                                                        <div class="progress">
                                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                                                aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                                                <span class="sr-only">20%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end 2 -->
                                                    <div class="col-xs-3 col-md-3 text-right">
                                                        <span class="glyphicon glyphicon-star"></span>1
                                                    </div>
                                                    <div class="col-xs-8 col-md-9">
                                                        <div class="progress">
                                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                                                aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                                                <span class="sr-only">15%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end 1 -->
                                                </div>
                                                <!-- end row -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="col-md-3"
                <div class="col-md-3 col-xs-3" id="Sparisci">
                    <div class="table">
                    <table class="table table-responsive">
                    <thead>
                      <tr>
                    <th>Giorno</th>
                    <th></th>
                    <th>Orari</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            
                        <%
                            String giorni[] = {"Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"};
                            String sql5 = "SELECT O.day_of_the_week, O.start_hour, O.end_hour FROM opening_hours_ranges as O, (SELECT OH.id_opening_hours_range FROM opening_hours_range_restaurant as OH WHERE OH.id_restaurant = ?) as R WHERE R.id_opening_hours_range = O.id";
                            ResultSet orari = manager.getData(sql5,idris);
                            
                            
                            orari.next();
                            boolean b = true;
                            for(int i=0;i < 7; i++){
                                out.println("<tr>"
                                        + "<td>"+giorni[i]+"<td>");
                                if((b == true) && Integer.parseInt(orari.getString("day_of_the_week")) == i+1){
                                    out.println("<td>"+orari.getString("start_hour")+"-"+orari.getString("end_hour")+"</td>"
                                        );
                                    boolean c = true;
                                    while(c == true && orari.next()){
                                        if(Integer.parseInt(orari.getString("day_of_the_week")) == i+1)
                                            out.println(
                                            "<td></td>"
                                            + "<td>"+orari.getString("start_hour")+"-"+orari.getString("end_hour")+"</td>"
                                            + "</tr>");
                                        else
                                            c = false;
                                    }
                                    if(c == true)
                                        b = false;
                                }
                                else{
                                    out.println("<td> CHIUSO </td>"
                                        + "</tr>");
                                }     
                            }                   
                        %>
                           
                        </tr>
                    </tbody>
                    
                  </table>
                </div>
                </div>
                </div>
        
        
        <div class="row2">
             
                
                <div class="col-md-12 col-xs-12" id="Spazio">
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
                            address.next();
                            out.println(address.getString("address")); %></td>
                        <td><% 
                            String idpri = ristorante.getString("id");
                            String sql3 = "SELECT name FROM mainagioia.price_ranges WHERE id = ?";
                            ResultSet price = manager.getData(sql3,idpri);
                            price.next();
                            out.println(price.getString("name")); //si potrebbe anche stamparlo come icone in € volendo %></td>
                        <td><% 
                            String sql4 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                            ResultSet cuisine = manager.getData(sql4,idris);
                            cuisine.next();
                            out.print(cuisine.getString("name"));
                                while(cuisine.next())
                                        out.print(", " + cuisine.getString("name")); %></td>
                        <td><% out.println(ristorante.getString("web_site_url")); %></td>
                      </tr>
                     
                    </tbody>
                  </table>
                </div>
               
            
        </div>
        
        <div class="row6"> 
            <div class="col-md-12 col-xs-12">
                
    
                <div class="row.header">
                   <div class="row">
                   <div class="col-sm-12" id="Arancio">
                       <h3><center>Scopri le recensioni dei clienti:</center></h3>
                   </div><!-- /col-sm-12 -->
                   </div><!-- /row -->
                   <div>
               
                   <div class="container">
	<div class="row" style="margin-top:40px;">
		<div class="col-md-6">
    	<div class="well well-sm">
            <div class="text-right">
                <a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box">Leave a Review</a>
            </div>
        
            <div class="row" id="post-review-box" style="display:none;">
                <div class="col-md-12">
                    <form accept-charset="UTF-8" action="" method="post">
                        <input id="ratings-hidden" name="rating" type="hidden"> 
                        <textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5"></textarea>
        
                        <div class="text-right">
                            <div class="stars starrr" data-rating="0"></div>
                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
                            <span class="glyphicon glyphicon-remove"></span>Cancel</a>
                            <button class="btn btn-success btn-lg" type="submit">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
         
		</div>
	</div>
</div>
                    
                    
                        <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Demo</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../navbar/">Default</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    
            </div>
                <div>
                   <%
                           String sql6 = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                           ResultSet recensioni = manager.getData(sql6,idris);
                           
                           while(recensioni.next()){
                    %>           
                               <div class="col-sm-1 col-xs-2">
                               <div class="thumbnail">
                               <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                               </div><!-- /thumbnail -->
                               </div><!-- /col-sm-1 -->

                               <div class="col-sm-5 col-xs-10">
                               <div class="panel panel-default">
                               <div class="panel-heading">
                               <strong>
                                   <%
                                       String sql7 = "SELECT nickname FROM mainagioia.Users WHERE id = ?";
                                       ResultSet user = manager.getData(sql7,recensioni.getString("id_creator"));
                                       user.next();
                                       out.print(user.getString("nickname"));
                                   %>
                               </strong> <span class="text-muted">commented 
                               <%
                                   Timestamp time = recensioni.getTimestamp("date_creation");
                                   Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                                   long diff = timestamp.getTime() - time.getTime();
                                   long seconds = diff / 1000;
                                   System.out.println("Seconds: "+seconds);
                                   long minutes = seconds / 60 ;
                                   System.out.println("Minutes: "+minutes);
                                   seconds = seconds % 60;
                                   long hours = minutes / 60;
                                   System.out.println("Hourse: "+hours+ "S: "+seconds);
                                   minutes = minutes % 60;
                                   long days = hours / 24;
                                   System.out.println("Days: "+days+ "M: "+minutes);
                                   hours = hours % 24;
                                   long months = days / 30;
                                   System.out.println("Months: "+months+ "H: "+hours);
                                   days = days % 30;
                                   long years = months / 12;
                                   System.out.println("Years: "+years+ "D: "+days);
                                   months = months % 12;
                                   System.out.println("M: "+months);
                                   
                                   if(years > 0){
                                        out.print(years+" year");
                                        if(years > 1)
                                            out.print("s");
                                   }
                                   else if (months > 0){
                                       out.print(months+" month");
                                        if(months > 1)
                                            out.print("s");
                                   }
                                   else if (days > 0){
                                       out.print(days+" day");
                                       if(days > 1)
                                            out.print("s");
                                   }
                                   else if (hours > 0){
                                       out.print(hours+" hour");
                                        if(hours > 1)
                                            out.print("s");
                                   }
                                   else if (minutes > 0){
                                       out.print(minutes+" minute");
                                       if(minutes > 1)
                                            out.print("s");
                                   }
                                    else{
                                       out.print(seconds+" second");
                                           if(seconds > 1)
                                            out.print("s");
                                    }
                                   out.print(" ago");
                               %>
                               <div>
                                   <% 
                                       out.print("Voto Globale: ");
                                       for(int k = recensioni.getInt("global_value"); k > 0; k--)
                                        out.print("♥");
                                    %>
                               </div>
                               <div>
                                    <%
                                       out.print("Voto Cibo: ");
                                       
                                       for(int k = recensioni.getInt("food"); k > 0; k--)
                                        out.print("♥");
                                    %>
                                </div>
                                <div>    
                                    <%
                                       out.print("Voto Servizio: ");
                                       
                                       for(int k = recensioni.getInt("service"); k > 0; k--)
                                        out.print("♥");
                                    %>
                                </div>
                                <div>    
                                    <%   
                                       out.print("Voto Qualità/Prezzo: ");
                                       
                                       for(int k = recensioni.getInt("value_for_money"); k > 0; k--)
                                        out.print("♥");
                                    %>
                                </div>
                                <div>    
                                    <%
                                        out.print("Voto Atmosfera: ");
                                       
                                       for(int k = recensioni.getInt("atmosphere"); k > 0; k--)
                                        out.print("♥");
                                   %>
                                   
                               </div>
                               </span>
                               </div>
                               <div class="panel-body">
                                   <%=recensioni.getString("name") %>
                                   <div>
                                       <%=recensioni.getString("description") %>
                                   </div>
                               </div><!-- /panel-body -->
                               </div><!-- /panel panel-default -->
                               </div><!-- /col-sm-5 -->
                           <%
                               }
                   %>
                   
                   
                   
                   <% /* <div class="row">
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
                   
                   */ %>
                   
                </div> 

            </div><!-- /container -->
             </div>
        </div>
            
       
        
        
            
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</html>
    
    