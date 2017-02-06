<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <title>Notifiche</title>
    </head>
    
    
    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        <%
            utente = (Utente)ses.getAttribute("utente");
            if(utente==null || utente.getRuolo().contains("user")){
                response.sendRedirect("index.jsp");
            }
            else{
        %>
        <div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1" id="Spazio" style="background-color: white; opacity:0.9; border-radius: 30px;"> <!-- Pagina di notifiche -->
            <!-- Notification header -->
            <center>
            <div>
                <center>
                <h1>Ecco le tue notifiche:</h1>
                </center>
                <hr class="colorgraph">
            </div>
            <!-- Notifications -->
            <%! private DBManager manager; %>
                <%! 
                    public void init() throws ServletException {
                    // inizializza il DBManager dagli attributi di Application
                    this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                    //System.out.println("DBManager attivato\n");
                    } 
                %>
            <%
                if(utente.getRuolo().contains("owner")){
                    String sqlW = "SELECT W.result, W.date_creation, W.date_validation, W.id_photo, R.name FROM WARNING as W, PHOTOS as P, RESTAURANTS as R WHERE R.id_owner = ? AND R.id = P.id_restaurant AND W.id_photo = P.id ORDER BY W.date_creation DESC";
                    ResultSet segnalazioni = manager.getData(sqlW, request.getParameter("id"));
                    String sqlR ="SELECT RP.description as rpdes, RP.date_creation as rpdc, RP.date_validation as rpdv, rp.accepted as acc, rp.id_validator as rpv, rv.name as rvn, rv.description as rvdes, rv.date_creation as rvdc  FROM REPLIES as RP, REVIEWS as RV WHERE RP.id_owner = ? AND RP.id_review = RV.id ORDER BY RP.date_creation DESC";
                    ResultSet risposte = manager.getData(sqlR, request.getParameter("id"));
                    int a = 0;
                    int b = 0;
            %>
            <!-- NOTIFICHE PER IL RISTORATORE -->
           
            <div>
                
                <h4>Segnalazioni:</h4>
               
                <%
                    while(segnalazioni.next()){
                        a++;
                %>
                <div class="col-md-12 col-xs-12 Azzurro_tondo">
                    <div id="segnalazione_controllata" id="Altezza"> 
                        <%
                            if(segnalazioni.getString("result") == "true"){
                                
                        %>
                        <p style="color: white"> La tua segnalazione alla foto del ristorante <%=segnalazioni.getString("name") %> è stata controllata e non rispettando i nostri standard è stata cancellata </p> 
                        <br>
                        <%
                            }
                            else{
                                String sql2 = "SELECT path FROM Photos WHERE id = ?";
                                ResultSet foto = manager.getData(sql2, segnalazioni.getString("id_photo"));
                                foto.next();
                                if(segnalazioni.getString("date_validation") == null){
                        %>
                        <p style="color: white"> La tua segnalazione alla seguente foto non è ancora stata controllata </p>
                        <img src="<%=foto.getString("path") %>" width="70%">
                        <br>
                        <%
                                }
                                else{
                        %>
                        <p style="color: white"> La tua segnalazione alla seguente foto è stata controllata ed è stata ritenuta consona ai nostri standard</p>
                        <img src="<%=foto.getString("path") %>" width="70%">     
                        <br>
                        <%
                                }
                            }
                        %>
                        <br>
                    </div>
                  
                </div>
                <%
                    }
                    if(a == 0){
                %>
                <div>
                    -
                </div>
                <%
                    }
                %>
            </div>
            <div>
                <h4>Risposte:</h4>
                <%
                    while(risposte.next()){
                        b++;
                %>
                <div class="col-md-12 col-xs-12 Azzurro_tondo">
                    <div id="segnalazione_controllata">
                        <%
                            if(risposte.getString("acc") == "true"){
                        %>
                        <p style="color: white"> La tua risposta alla recensione del tuo ristorante è stata pubblicata</p> 
                        <%
                            }
                            else if(risposte.getString("acc") == "false"){
                        %>
                        <p style="color: white"> La tua risposta alla recensione del tuo ristorante non è stata pubblicata</p> 
                        <%
                            }
                            else{
                        %>
                        <p style="color: white"> La tua risposta alla recensione del tuo ristorante deve ancora essere controllata</p> 
                        <%
                            }
                        %>
                        <div>
                            <%=risposte.getString("rvn") %>
                        </div>
                        <div>
                            <%=risposte.getString("rvdes") %>
                        </div>
                        <p style="color: white"> LA TUA RISPOSTA:</p>
                        <div>
                            <%=risposte.getString("rpdes") %>
                        </div>
                        
                    </div>
                </div>
                <%
                    }
                if(b == 0){
                %>
                <div>
                    -
                </div>
                <%
                    }
                %>
            </div>
             <%
                 }
                else if(utente.getRuolo().contains("admin")){
                    String sqlW = "SELECT W.result, W.date_creation, W.date_validation, P.path, W.id_photo, R.name FROM WARNING as W, PHOTOS as P, RESTAURANTS as R WHERE R.id = P.id_restaurant AND W.id_photo = P.id AND W.result IS NULL";
                    ResultSet segnalazioni = manager.getData(sqlW);
                    String sqlR ="SELECT RP.id as id, RP.description as rpdes, RP.date_creation as rpdc, rv.name as rvn, rv.description as rvdes, rv.date_creation as rvdc  FROM REPLIES as RP, REVIEWS as RV WHERE RP.id_review = RV.id AND RP.accepted IS NULL";
                    ResultSet risposte = manager.getData(sqlR);
                    int a = 0;
                    int b = 0;
            %>   
            <!-- NOTIFICHE PER L' ADMIN -->
            <div>
                <h4>Segnalazioni:</h4>
                <%
                    while(segnalazioni.next()){
                        a++;
                %>
                <div class="col-md-12 Azzurro_tondo">
                    <div id="segnalazione_controllata"> 
                        <p style="color: white">Per il ristorante <%=segnalazioni.getString("name") %></p>
                        <img src="<%=segnalazioni.getString("path") %>" width="70%">
                        <br>
                        
                        <form action="RimuoviFoto" method="POST">
                            <br>
                            <div>
                            <input type="hidden" name="idp" value="<%=segnalazioni.getString("id_photo") %>" />
                            <input type="submit" class="btn btn-success btn-responsive" name="choice" value="Accetta" /> <input type="submit" class="btn btn-danger btn-responsive" name="choice" value="Elimina" />
                            
                        </div>
                            <br>
                        </form>
                    </div>
                </div>
                <%
                    }
                if(a == 0){
                %>
                <div>
                    -
                </div>
                <%
                    }
                %>
            </div>
            <div>
                
                <h4>Risposte:</h4>
                <%
                    while(risposte.next()){
                        b++;
                %>
                <div class="col-md-12 Azzurro_tondo">
                    <div id="segnalazione_controllata"> 
                        <div>
                            <%=risposte.getString("rvn") %>
                        </div>
                        <div id="Altezza">
                            <%=risposte.getString("rvdes") %>
                        </div>
                        <p style="color: white">RISPOSTA RISTORATORE:</p>
                        <div>
                            <%=risposte.getString("rpdes") %>
                            
                        </div>
                        <form action="RimuoviFoto" method="GET">
                            <br>
                            <div>
                            <input type="hidden" name="idr" value="<%=risposte.getString("id") %>" />
                            <input type="submit" class="btn btn-success btn-responsive" name="choice" value="Accetta" /> <input type="submit" class="btn btn-danger btn-responsive" name="choice" value="Elimina" />
                        </div>
                            <br>
                    </div>
                </div>
                <%
                    }
                if(b == 0){
                %>
                <div>
                    -
                </div>
                <%
                    }
                %>
            </div>
            <%
                }
            %> 
            </center>
        </div>
        <%
            }
        %>
    </body>
</html>