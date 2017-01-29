<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <link href="css/not_found.css" rel="stylesheet" type="text/css">
        <title>Error 404</title>
        
    </head>
    
    <body  class="corpo">
        
        <%@page import="db.Utente" %>
        
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <div class="row header">
            <div class="col-md-6 col-xs-8 col-md-offset-3"> 
                <form action=Ricerca.jsp method=GET>
                    <a href="index_nuovo.jsp"><img src="img/Magnagioia_orange.png" id="logo" alt="Magnagioia"  width="100%"> </a>
                </form>
            </div>
        </div>
            <hr class="spazio">
      <footer>
            <div class="container">
                <div class="col-md-12">
                    <div class="centered">
                        <center>
                            <img src="img/piatto404.png" alt="Error 404" width=50% >
                            <br>
                            <h1>Page not found</h1>
                        </center>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>