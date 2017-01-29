<%@page import="db.Utente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html    DA SISTEMARE SFONDO PER INSERIRE HEADER>
<html>
    <head>
        <%@include file="head.html" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
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
        <link href="css/style2.css" rel="stylesheet" type="text/css">  
        
        <title>Ristorante Magnagioia</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        
        <%
            utente = (Utente)ses.getAttribute("utente");
            if(utente!=null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
        
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" method="POST" action="Registrazione">
                    <center><h2>Registrati a Magnagioia!</h2></center>
			<hr class="colorgraph col-md-6 col-md-offset-3">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group2">
                                            
                        <input type="text" name="nome" id="first_name" class="form-control input-lg" placeholder="Nome" tabindex="1">
					</div>
				</div>
                            
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group2">
						<input type="text" name="cognome" id="last_name" class="form-control input-lg" placeholder="Cognome" tabindex="2">
					</div>
				</div>
			</div>
                         <br>
			<div class="form-group2">
				<input type="text" name="nickname" id="display_name" class="form-control input-lg" placeholder="Nickname" tabindex="3">
			</div>
                          <br>
			<div class="form-group2">
				<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email" tabindex="4">
			</div>
                           <br>
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group2">
						<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
					</div>
				</div>
                             
				<div class="col-xs-6 col-sm-6 col-md-6">
					<div class="form-group2">
						<input type="password" name="pass2" id="password_confirmation" class="form-control input-lg" placeholder="Conferma Password" tabindex="6">
					</div>
				</div>
                              <br>
			</div>
                           <br>
			
			
			<hr class="colorgraph col-md-6 col-md-offset-3">
			<div class="row">
				<div class="col-xs-12 col-md-12"><input type="submit" value="Registrati" class="btn btn-primary btn-block btn-lg Azzurro" tabindex="7"></div>
                        </div>
		</form>
	</div>
</div>
<!-- Modal -->

    </div>
    </body>
</html>
