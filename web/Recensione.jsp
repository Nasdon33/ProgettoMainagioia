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
        <link href="css/recensione.css" rel="stylesheet" type="text/css">
        
        <title>Ristorante Magnagioia</title>
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
       
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
       
        
        
        <div class="container">
            <form role="form" action="Recensione" method="GET">
        <center>
            <div class="row">
		<h2>Inserisci la tua Recensione:</h2>
            </div>
            <div class="container">
                <div class="col-md-2 col-xs-3 col-md-offset-1">
                    <hr>
                    <h4>Voto globale</h4>
                    <br>
                    <input type="range" id="total" min="1" max="5" value="3" step="1" onchange="showValue(this.value)" />
                    <span id="range">3</span>
                    <script type="text/javascript">
                    function showValue(newValue)
                    {
                            document.getElementById("range").innerHTML=newValue;
                    }
                    </script>

                </div>
                <div class="col-md-2 col-xs-3 col-md-offset-2">
                    <hr>
                    <h4>Cibo</h4>
                    <br>
                    <input type="range" id="food" min="1" max="5" value="3" step="1" onchange="showValue2(this.value)" />
                    <span id="range2">3</span>
                    <script type="text/javascript">
                    function showValue2(newValue)
                    {
                            document.getElementById("range2").innerHTML=newValue;
                    }
                    </script>

                </div>
                <div class="col-md-2 col-xs-3 col-md-offset-2">
                    <hr>
                    <h4>Servizio</h4>
                    <br>
                    <input type="range" id="service" min="1" max="5" value="3" step="1" onchange="showValue3(this.value)" />
                    <span id="range3">3</span>
                    <script type="text/javascript">
                    function showValue3(newValue)
                    {
                            document.getElementById("range3").innerHTML=newValue;
                    }
                    </script>

                </div>
            </div>
   
           <hr>
           
           <div class="container">
                <div class="col-md-2 col-xs-3 col-md-offset-3 col-xs-offset-2">
                    <hr>
                    <h4>Qualità/prezzo</h4>
                    <br>
                    <input type="range" id="value_for_money" min="1" max="5" value="3" step="1" onchange="showValue4(this.value)" />
                    <span id="range4">3</span>
                    <script type="text/javascript">
                    function showValue4(newValue)
                    {
                            document.getElementById("range4").innerHTML=newValue;
                    }
                    </script>

                </div>
                <div class="col-md-2 col-xs-3 col-md-offset-2 col-xs-offset-2">
                    <hr>
                    <h4>Atmosfera</h4>
                    <br>
                    <input type="range" id="atmosphere" min="1" max="5" value="3" step="1" onchange="showValue5(this.value)" />
                    <span id="range5">3</span>
                    <script type="text/javascript">
                    function showValue5(newValue)
                    {
                            document.getElementById("range5").innerHTML=newValue;
                    }
                    </script>

                </div>
            </div>
           <hr>
                <!-- the comment box -->
                <div>
                      <center>
                    <h2><i class="fa fa-paper-plane-o"></i> TITOLO:</h4>
                    <div class="form-group">
                        
                        <textarea class="form-control" rows="1" id="name"></textarea>
                    </div>
                        <h4><i class="fa fa-paper-plane-o"></i> Descrizione:</h4>

                            <div class="form-group">
                                <textarea class="form-control" rows="3" id="description"></textarea>
                            </div>
                        <input type="hidden" value="<%=request.getParameter("id") %>" name="id_restaurant"/>
                        <input type="hidden" value="<%=utente.getId() %>" name="id_creator"/>
                        <button type="submit" class="btn btn-primary">Submit </button>

                </div>

   </center>
  
                </form>

	</div>
  

        
        
        
        
    </body>
</html>
