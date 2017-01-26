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
       
        <div>
            <div class="col-md-6 col-md-offset-3 col-xs-6 col-xs-offset-3">
               <div class="container">
                <form class="form-horizontal">
                <fieldset>

                <!-- Form Name -->
                
                <legend>Gestisci Profilo</legend>
                
                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="textinput">Cambia Email</label>  
                  <div class="col-md-4">
                  <input id="textinput" name="textinput" type="text" placeholder="Nuova Email" class="form-control input-md">
                   
                  </div>
                </div>

                <!-- Password input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="passwordinput">Cambia Password</label>
                  <div class="col-md-4">
                    <input id="passwordinput" name="passwordinput" type="password" placeholder="Nuova Password" class="form-control input-md">

                  </div>
                </div>

                <!-- Password input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="passwordinput">Ripeti Password</label>
                  <div class="col-md-4">
                    <input id="passwordinput" name="passwordinput" type="password" placeholder="Ripeti Password" class="form-control input-md">

                  </div>
                </div>

                 <div class="form-group">
                  <label class="col-md-4 control-label" for="passwordinput">Cambia Password</label>
                  <div class="col-md-4">
                    <input id="passwordinput" name="passwordinput" type="password" placeholder="Nuova Password" class="form-control input-md">

                  </div>
                </div>

                 <div class="form-group">
                  <label class="col-md-4 control-label" for="passwordinput">Cambia Password</label>
                  <div class="col-md-4">
                    <input id="passwordinput" name="passwordinput" type="password" placeholder="Nuova Password" class="form-control input-md">

                  </div>
                </div>

                </fieldset>
                </form>
                </div>

            </div>
        </div>
        
        
        
        
        
        
        
        
    </body>
</html>
