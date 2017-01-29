<%@page import="java.sql.Timestamp"%>
<%@page import="db.DBManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.Ristorante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
       
        <link href="css/style2.css" rel="stylesheet" type="text/css">  
        <link href="css/Commenti.css" rel="stylesheet" type="text/css">
        <link href="css/Valutazione.css" rel="stylesheet" type="text/css">
        <link href="css/recensione.css" rel="stylesheet" type="text/css">
        <%-- Script per i MODAL --%>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
        body {
        height:100%;
        width:100%;
        background-image:url("img/SfondoGrandeBlurred.jpg");/*your background image*/  
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
        
        <title>Profilo</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        
        
        <%
            if(utente==null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
       
       <div class="row">
        <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1"  id="Spazio" style="background-color: white; opacity:0.9; border-radius: 30px">
		<form role="form" method="POST" action="Registrazione">
                    <center><p style="font-size: 30px">Modifica i tuoi dati:</p></center>
			<hr class="colorgraph">
			<div class="form-group2">
                            <center><b>Email Attuale:</b>"vecchia email"</center>
				<input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Nuova Email" tabindex="3">
			</div>
                         <hr>
			<div class="form-group2">
                            <center><b>Nickname Attuale:</b>"vecchio nickname"</center>
				<input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Nuovo Nickname" tabindex="3">
			</div>
                          <hr>
                         <center><b>Cambia Password:</b></center>
			<div class="form-group2">
				<input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Password Attuale" tabindex="3">
			</div>
                           <br>
			<div class="form-group2">
				<input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Nuova Password" tabindex="3">
			</div>
                           <br>
                           <div class="form-group2">
				<input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Ripeti Nuova Password" tabindex="3">
			</div>
			
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-12"><input type="submit" value="Conferma" class="btn btn-primary btn-block btn-lg Azzurro" tabindex="7"></div>
                        </div>
		</form>
	</div>
</div>
        
        
        
        
        
        
        
        
    </body>
</html>
