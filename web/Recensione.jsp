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
        
       
        
        <div class="container">
            <form role="form" action="Recensione" method="GET">
        <center>
            <div class="row" id="Spazio">
		<p style="font-size:30px">Inserisci la tua Recensione:</p>
            </div>
            <div class="container" id="Altezza">
                <div class="col-md-4 col-xs-4">
                    <hr>
                    <h4><span class="glyphicon glyphicon-globe"></span> Voto globale</h4>
                    <br>
                    <input type="range"  min="1" max="5" value="3" step="1" onchange="showValue(this.value)" />
                    <input class="placeholder" id="range" name="total" value="3" readonly/>
                    <script type="text/javascript">
                    function showValue(newValue)
                    {
                            document.getElementById("range").value=newValue;
                    }
                    </script>

                </div>
                <div class="col-md-4 col-xs-4  ">
                    <hr>
                    <h4><span class="glyphicon glyphicon-apple"></span> Cibo</h4>
                    <br>
                    <input type="range"  min="1" max="5" value="3" step="1" onchange="showValue2(this.value)" />
                    <input class="placeholder" id="range2" name="food" value="3" readonly/>
                    <script type="text/javascript">
                    function showValue2(newValue)
                    {
                            document.getElementById("range2").value=newValue;
                    }
                    </script>

                </div>
                <div class="col-md-4 col-xs-4 ">
                    <hr>
                    <h4><span class="glyphicon glyphicon-heart-empty"></span> Servizio</h4>
                    <br>
                    <input type="range" min="1" max="5" value="3" step="1" onchange="showValue3(this.value)" />
                    <input class="placeholder" id="range3" name="service" value="3" readonly/>
                    <script type="text/javascript">
                    function showValue3(newValue)
                    {
                        
                                
                            document.getElementById("range3").value=newValue;
                    }
                    </script>

                </div>
            </div>
   
           
           
           <div class="container" id="Altezza">
                <div class="col-md-4 col-xs-4 col-md-offset-2 col-xs-offset-2">
                    <hr>
                    <h4><span class="glyphicon glyphicon-piggy-bank"></span> Qualità/prezzo</h4>
                    <br>
                    <input type="range"  min="1" max="5" value="3" step="1" onchange="showValue4(this.value)" />
                    <input class="placeholder" id="range4" name="value_for_money" value="3" readonly/>
                    <script type="text/javascript">
                    function showValue4(newValue)
                    {
                            document.getElementById("range4").value=newValue;
                    }
                    </script>

                </div>
                <div class="col-md-4 col-xs-4">
                    <hr>
                    <h4><span class="glyphicon glyphicon-home"></span> Atmosfera</h4>
                    <br>
                    <input type="range" min="1" max="5" value="3" step="1" onchange="showValue5(this.value)" />
                    <input class="placeholder" id="range5" name="atmosphere" value="3" readonly/>
                    <script type="text/javascript">
                    function showValue5(newValue)
                    {
                            document.getElementById("range5").value=newValue;
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
                        
                        <input type="text" class="form-control"  name="name" value="" />
                    </div>
                        <h4><i class="fa fa-paper-plane-o"></i> Descrizione:</h4>

                            <div class="form-group">
                                <input type="text" class="form-control" name="description" value="" />
                            </div>
                        <input type="hidden" value="<%=request.getParameter("id") %>" name="id_restaurant"/>
                        <input type="hidden" value="<%=utente.getId() %>" name="id_creator"/>
                        <button type="submit" class="btn btn-primary btn-responsive Azzurro">Inserisci </button>

                </div>

   </center>
  
                </form>

	</div>
  

        
        
        
        
    </body>
</html>
