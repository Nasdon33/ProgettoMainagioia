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
        
        
        <title>Ristorante Magnagioia</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
       
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
       <script src="js/Recensione.js"></script>
        
        
        <div class="container">
            <center>
	<div class="row">
		<h2>Inserisci la tua Recensione:</h2>
	</div>
            
    <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span class="count" id="total">0</span> star(s)
	</div>
            
            <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span class="count" id="food">0</span> star(s)
	</div>
            
            <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span class="count" id="valueformoney">0</span> star(s)
	</div>
            
            <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span class="count" id="service">0</span> star(s)
	</div>
            
             <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span class="count" id="atmosphere">0</span> star(s)
	</div>
            </center>
    
        </div>
        <div>
           <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
	
		<div class="row">
   
  
  
  
  
  <hr>
  <center>
                <!-- the comment box -->
                <div>
                    <form role="form">
                    <h2><i class="fa fa-paper-plane-o"></i> TITOLO:</h4>
                    <div class="form-group">
                        <textarea class="form-control" rows="1" id="titolo"></textarea>
                    </div>
                        <h4><i class="fa fa-paper-plane-o"></i> Descrizione:</h4>

                            <div class="form-group">
                                <textarea class="form-control" rows="3" id="descrizione"></textarea>
                            </div>
                        <button type="submit" name="say" value="" class="btn btn-primary"><i class="fa fa-reply"></i> Submit</button>
                    </form>
                </div>

   </center>
  
  
	</div>

	</div>

       </div>
        
        
        
        
        
    </body>
</html>
