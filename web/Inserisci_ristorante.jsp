<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!DOCTYPE html SISTEMARE PAGINA INSERENDO L'HEADER>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <title>Magnagioia</title>
    </head>
    <body>
        <div>
       <%@include file="header.jsp" %>
        </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    <%
            if(utente==null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
       
       <div class="row">
        <div class="col-xs-10 col-md-6 col-md-offset-3 col-xs-offset-1">
		<form role="form" method="POST" action="Ristorante">
                    <center><h2>Inserisci ristorante</h2></center>
			<hr class="colorgraph">
			<div class="form-group2">
                            <center><b>Nome:</b></center>
				<input type="text" name="name" id="display_name" class="form-control input-lg" placeholder="Nome Ristorante" tabindex="3">
			</div>
                         <br>
			<div class="form-group2">
                            <center><b>Descrizione:</b></center>
                            <textarea name="description" id="display_name" class="form-control input-lg" placeholder="Descrizione" tabindex="3"></textarea>
			</div>
                          <br>
			<div class="form-group2">
                                <center><b>Sito Web:</b></center>
				<input type="text" name="web_site_url" id="display_name" class="form-control input-lg" placeholder="Sito Web" tabindex="3">
			</div>
                           <br>
			<div class="form-group2">
                                <center><b>Fascia di prezzo:</b></center>
                                <input type="radio" name="prezzo" value="0" checked> 0-8€<br>
                                <input type="radio" name="prezzo" value="1"> 8-20€<br>
                                <input type="radio" name="prezzo" value="2"> 20-50€<br>
                                <input type="radio" name="prezzo" value="3"> 50+€<br>
                        </div>
                           <br>
                           <div class="form-group2">
                               <center><b>Indirizzo:</b></center>
				<input type="text" name="address1" id="display_name" class="form-control input-lg" placeholder="Via Napoleone 57" tabindex="3">
			</div>
                           <div class="form-group2">
                               <center><b>CAP:</b></center>
				<input type="text" name="address2" id="display_name" class="form-control input-lg" placeholder="38122" tabindex="3">
			</div>
                           <div class="form-group2">
                               <center><b>Città:</b></center>
				<input type="text" name="address3" id="display_name" class="form-control input-lg" placeholder="Trento" tabindex="3">
			</div>
			<div class="form-group2">
                                <center><b>Tipo di cucina:</b></center>
                                <input type="checkbox" name="Italiana" value="Italiana"> Italiana &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Vegetariana" value="Vegetariana"> Vegetariana &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Steakhouse" value="Steakhouse"> Steakhouse &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Americana" value="Americana"> Americana &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Araba" value="Araba"> Araba &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Francese" value="Francese"> Francese<br>
                                <input type="checkbox" name="Spagnola" value="Spagnola"> Spagnola &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Cinese" value="Cinese"> Cinese &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Giapponese" value="Giapponese"> Giapponese &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Dolci" value="Dolci"> Dolci &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Pizza" value="Pizza"> Pizza &nbsp &nbsp &nbsp
                                <input type="checkbox" name="Cibo di Strada" value="Cibo di Strada"> Cibo di Strada<br>
                        </div>
                           
                        <div class="form-group2">
                            <center><b>Orari:</b></center><br>
                                <center>Lunedì</center>
                                <input type="radio" name="lunedì" value="0" checked> 0-8€<br>
                                <input type="radio" name="prezzo" value="1">
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