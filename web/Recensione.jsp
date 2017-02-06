<%@page import="db.DBManager"%>
<%@page import="db.Utente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <%@include file="head.html" %>
        <title>Recensione</title>
        
    </head>
    <body>
        
        <div>
         <%@include file="header.jsp" %>
        </div>
        <%
            ses = request.getSession();
            utente = (Utente)ses.getAttribute("utente");
            if(utente == null)
                response.sendRedirect("ristorante.jsp?id="+request.getParameter("id"));
            else{
        %>
        <div class="container" style="background-color: white; opacity:0.9; border-radius: 30px">
            <form role="form" action="Recensione" method="POST">
            <center>
                <div class="row" id="Spazio">
                    <h1>Inserisci la tua Recensione:</h1>
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
                        <div class="col-xs-8 col-xs-offset-2 col-md-4 col-md-offset-4">
                        <button type="submit" class="btn btn-info Azzurro  btn-block"><span class="glyphicon glyphicon-send"></span> Invia Recensione</button>
                        </div>
                    </div>
                </center>
            </form>
        </div>
        <%
            }
        %>
    </body>
</html>
