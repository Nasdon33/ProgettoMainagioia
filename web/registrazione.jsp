<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PAGINA DA SISTEMARE>
<html>
    <head>
        <%@include file="head.html" %>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        
        <title>Registrazione</title>
    </head>
    <body>
        <%@page import="db.Utente" %>
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
			<hr class="colorgraph">
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
			
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-12"><input type="submit" value="Registrati" class="btn btn-primary btn-block btn-lg" tabindex="7" id="Azzurro"></div>
                        </div>
		</form>
	</div>
</div>
<!-- Modal -->

    </div>
    </body>
</html>
