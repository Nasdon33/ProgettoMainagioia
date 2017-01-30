<%@page import="db.DBManager"%>
<%@page import="db.Utente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.Ristorante"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <link href="css/style2.css" rel="stylesheet" type="text/css">
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvqLGJyMiDEZIohhJaX63cDfyXTDHky-g"></script>
        <link href="css/Commenti.css" rel="stylesheet" type="text/css">
        <link href="css/Valutazione.css" rel="stylesheet" type="text/css">
       
        
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
        <title>Recensione</title>
        
    </head>
    <body>
        <div>
         <%@include file="header.jsp" %>
        </div>
        <div class="container" style="background-color: white; opacity:0.9; border-radius: 30px">
            <form role="form" action="Recensione" method="POST">
            <center>
                <div class="row" id="Spazio">
                    <p style="font-size:30px">Inserisci la tua Recensione:</p>
                    <hr class="colorgraph">
                </div>
                <div class="container" id="Altezza">
                    <div class="col-md-4 col-xs-4">
                        
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
                        <h3><i class="fa fa-paper-plane-o"></i> TITOLO:</h3>
                        <div class="form-group">
                            <input type="text" class="form-control"  name="name" value="" required="" />
                        </div>
                        <h4><i class="fa fa-paper-plane-o"></i> Descrizione:</h4>
                        <div class="form-group">
                            <textarea  class="form-control textarea" name="description" rows="3" required=""></textarea>
                        </div>
                        <input type="hidden" value="<%=request.getParameter("id") %>" name="id_restaurant"/>
                        <input type="hidden" value="<%=utente.getId() %>" name="id_creator"/>
                        <hr class="colorgraph">
                        <button type="submit" class="btn btn-info Azzurro  btn-responsive"><span class="glyphicon glyphicon-send"></span> Invia Recensione</button>
                    </div>
                </center>
            </form>
        </div>
    </body>
</html>
