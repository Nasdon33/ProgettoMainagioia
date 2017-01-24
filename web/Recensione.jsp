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
	<div class="row">
		<h2>Working Star Ratings for Bootstrap 3 <small>Hover and click on a star</small></h2>
	</div>
            
    <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span id="count">0</span> star(s)
	</div>
            
            <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span id="count">0</span> star(s)
	</div>
            
            <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span id="count">0</span> star(s)
	</div>
            
            <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span id="count">0</span> star(s)
	</div>
            
             <div class="row lead">
        <div id="stars" class="starrr"></div>
        You gave a rating of <span id="count">0</span> star(s)
	</div>
    
    
</div>
        
        
        
        
        
    </body>
</html>