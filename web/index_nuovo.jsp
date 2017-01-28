<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <style>
        body {
        height:100%;
        width:100%;
        background-image:url("img/SfondoGrande.jpg");/*your background image*/  
        background-repeat:no-repeat;/*we want to have one single image not a repeated one*/  
        background-size:cover;    
        }

      @media only screen and (max-width: 767px) {
       body {
         /* The file size of this background image is 93% smaller
            to improve page load speed on mobile internet connections */
         background-image: url(img/SfondoPiccolo.jpg);
         
        }
       }
       </style>
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <title>Magnagioia</title>
        
    </head>
    
    <body>
        
        <%@page import="db.Utente" %>
        
        <div>
       <%@include file="header.jsp" %>
        </div>  

       
        <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-xs-12" style="background-color: white; opacity:0.8; border-radius: 30px">
            <center>
                <b>  <p class="Font_ridimensionato">Benvenuti su Magnagioia!</p></b>
                <p class="Font_ridimensionato2">Scopri nuovi ristoranti e aiutali a migliorare</p>
                <hr>
            </center>
        </div>
        
                <div class=" col-sm-10 col-md-10 col-md-offset-1 col-xs-12 col-sm-offset-2">
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
                                 "Nome della zoccola"
                               </strong> <span class="text-muted">ha commentato 2 mesi fa
                               </span>
                               </div>
                               <div class="panel-body">
                                   <div style="font-weight: bold" class="Font_ufficale_titoli">
                                       Commento figo <br>
                                       di almeno 2 righe
                                       
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
                                  
                               </strong>"nome dello scemo" <span class="text-muted"> ha commentato 3 mesi fa
                               </span>
                               
                               </div>
                               <div class="panel-body">
                                   <div style="font-weight: bold" class="Font_ufficale_titoli">
                                       commento figo <br>
                                       di almeno 2 righe
                                   </div>
                                   <div class="Font_ufficale_normale">
                                      
                                   </div>
                               </div><!-- /panel-body -->
                               </div><!-- /panel panel-default -->
                               </div><!-- /col-sm-5 -->
                             </div>
                    
                   
                   
                   
                   
                   
                </div> 
                <hr>
                <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-xs-12" style="background-color: white; opacity:0.8; border-radius: 30px">
                     <center>
                         <p style="font-size:20px;"> Sei un nuovo utente? <a href="registrazione.jsp">Registrati</a></p>
                <p style="font-size:20px;"> Hai già un account? <a href="login.jsp">Accedi</a></p>
                <p style="font-size:20px;">#Magnagioia</p>
                    </center>
                </div>

            
        </div>
        


       


            
               

    </body>
</html>
