<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        
        <title>Magnagioia</title>
        
    </head>
    
    <body>
        
        <%@page import="db.Utente" %>
        
        <div>
       <%@include file="header.jsp" %> <!-- header incluso come in tutte le pagine-->
        </div>  

       
        <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-xs-12" style="background-color: white; opacity:0.8; border-radius: 30px">
            <center>
                <b>  <p class="Font_ridimensionato">Benvenuto su Magnagioia!</p></b> <!-- pagina benvenuto -->
                <p class="Font_ridimensionato2">Scopri nuovi ristoranti e aiutali a migliorare</p>
                
            </center>
        </div>
        
                <div class=" col-sm-10 col-md-10 col-md-offset-1 col-xs-12 col-sm-offset-2"> <!-- i due migliori commenti -->
                    <br>
                               <div class="col-sm-3 col-xs-3 col-md-2" id="Altezza">
                               <div class="thumbnail" >
                               <img class="img-responsive user-photo" src="img/avatar.jpeg">
                               </div><!-- /thumbnail -->
                               </div><!-- /col-sm-1 -->

                               <div class="col-sm-7 col-xs-9 col-md-4">
                               <div class="panel panel-default">
                               <div class="panel-heading">
                               <strong>
                                 Sara Sampaio
                               </strong> <span class="text-muted">ha commentato 2 mesi fa
                               </span>
                               </div>
                               <div class="panel-body">
                                   <div>
                                       Il ristorante migliore di sempre!  <br>
                                       Mai stata così contenta! <br>
                                      Ci tornerò sicuramente
                                       
                                   </div>
                                   <div class="Font_ufficale_normale">
                                      
                                   </div>
                               </div><!-- /panel-body -->
                               </div><!-- /panel panel-default -->
                               </div><!-- /col-sm-5 -->
                             
                    
                    
                               <div class="col-sm-2 col-xs-3" id="Sparisci">
                               <div class="thumbnail">
                               <img class="img-responsive user-photo" src="img/avatar2.jpeg">
                               </div><!-- /thumbnail -->
                               </div><!-- /col-sm-1 -->

                               <div class="col-sm-4 col-xs-9" id="Sparisci">
                               <div class="panel panel-default">
                               <div class="panel-heading">
                               <strong>
                                  Andrea Beltra
                               </strong> <span class="text-muted"> ha commentato 3 mesi fa
                               </span>
                               
                               </div>
                               <div class="panel-body">
                                   <div>
                                       Location veramente bella <br>
                                       Peccato per il servizio, da migliorare <br>
                                       Tutto sommato un buon ristorante.
                                       
                                   </div>
                                   <div>
                                      
                                   </div>
                               </div><!-- /panel-body -->
                               </div><!-- /panel panel-default -->
                               </div><!-- /col-sm-5 -->
                             </div> <!-- fine commenti -->
                    
                 <div class ="col-md-12 col-xs-12" style="background-color: white; opacity:0.8; border-radius: 30px"> <!-- Ristoranti in vetrina -->
                     <center>
                     <p style ="font-size: 25px">Ristoranti popolari: </p>
                     <%! private DBManager manager; %>
                    <%! 
                        public void init() throws ServletException {
                        // inizializza il DBManager dagli attributi di Application
                        this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                        //System.out.println("DBManager attivato\n");
                        } 
                    %>
                    <%     
                         
                        //String sql = "SELECT id, name FROM Restaurants  WHERE id IN (SELECT id FROM Restaurants RIGHT JOIN Reviews ON Restaurants.id=Reviews.id_restaurant ORDER BY )";
                        String sql ="SELECT id, name FROM Restaurants";
                        ResultSet ristoranti = manager.getData(sql);
                        for(int i = 0; i < 3; i++){
                            ristoranti.next();
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
                        <a href="ristorante.jsp?id=<%=idris %>"><img src="<%=foto.getString("path") %>" width="90%"></a>
                    <br>
                    <a href="ristorante.jsp?id=<%=idris %>" style="font-size:18px; color: #5bc0de"> <%=ristoranti.getString("name") %> </a>
                    <br>
                    
                    <%
                        String sql2 = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                        ResultSet recensioni = manager.getData(sql2,idris);
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
                    }
                    
                    %>
                     
                     
                    
                     
                     </center>
                 </div>
                     
                             
                             <!-- riga separatoria -->
                   <div class="col-md-12 col-xs-12">
                       <br>
                   </div>
                           
                           
            
            
                <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-xs-12" style="background-color: white; opacity:0.8; border-radius: 30px">
                     <center> <!-- alternativa ai tasti registrati e accedi -->
                         <p style="font-size:20px;"> Sei un nuovo utente? <a href="registrazione.jsp" style="color:#5bc0de;">Registrati</a></p>
                <p style="font-size:20px;"> Hai già un account? <a href="login.jsp" style="color:#5bc0de;">Accedi</a></p>
                <p style="font-size:20px;">#Magnagioia</p>
                    </center>
                </div>

            
     
        


       


            
               

    </body>
</html>
