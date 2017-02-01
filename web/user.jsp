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
                response.sendRedirect("index_nuovo.jsp");
            }
            else{
        %>
        <div class="col-md-8 col-xs-10 col-md-offset-2 col-xs-offset-1" id="Spazio" style="background-color: white; opacity:0.9; border-radius: 30px;"> <!-- Pagina di notifiche -->
            <!-- Notification header -->
            <div>
                <center>
                <p style="font-size: 30px">Ecco le tue notifiche:</p>
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
                    ResultSet segnalazioni = manager.getData(sqlW, utente.getId());
                    String sqlR ="SELECT RP.description as rpdes, RP.date_creation as rpdc, RP.date_validation as rpdv, rp.accepted as acc, rp.id_validator as rpv, rv.name as rvn, rv.description as rvdes, rv.date_creation as rvdc  FROM REPLIES as RP, REVIEWS as RV WHERE RP.id_owner = ? AND RP.id_review = RV.id ORDER BY RP.date_creation DESC";
                    ResultSet risposte = manager.getData(sqlR, utente.getId());
                    int a = 0;
                    int b = 0;
            %>
            <!-- NOTIFICHE PER IL RISTORATORE -->
            <div>
                ECCO LE TUE SEGNALAZIONI NELL'ULTIMO MESE
                <%
                    while(segnalazioni.next()){
                        a++;
                %>
                <div class="col-md-12 Azzurro_tondo">
                    <div id="segnalazione_controllata" class="btn btn-responsive Azzurro_no_bordo"> 
                        <%
                            if(segnalazioni.getString("result") == "true"){
                                
                        %>
                        <p> La tua segnalazione alla foto del ristorante <%=segnalazioni.getString("name") %> è stata controllata e non rispettando i nostri standard è stata cancellata </p> 
                        <%
                            }
                            else{
                                String sql2 = "SELECT path FROM Photos WHERE id = ?";
                                ResultSet foto = manager.getData(sql2, segnalazioni.getString("id_photo"));
                                foto.next();
                                if(segnalazioni.getString("date_validation") == null){
                        %>
                        <p> La tua segnalazione alla seguente foto non è ancora stata controllata </p>
                        <img src="<%=foto.getString("path") %>" width="250">
                        <%
                                }
                                else{
                        %>
                        <p> La tua segnalazione alla seguente foto è stata controllata ed è stata ritenuta consona ai nostri standard</p>
                        <img src="<%=foto.getString("path") %>" width="250">            
                        <%
                                }
                            }
                        %>
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
                ECCO LE TUE RISPOSTE NELL'ULTIMO MESE
                <%
                    while(risposte.next()){
                        b++;
                %>
                <div class="col-md-12 Azzurro_tondo">
                    <div id="segnalazione_controllata"  class="btn btn-responsive Azzurro_no_bordo"> 
                        <%
                            if(risposte.getString("acc") == "true"){
                        %>
                        <p> La tua risposta alla recensione del tuo ristorante è stata pubblicata</p> 
                        <%
                            }
                            else if(risposte.getString("acc") == "false"){
                        %>
                        <p> La tua risposta alla recensione del tuo ristorante non è stata pubblicata</p> 
                        <%
                            }
                            else{
                        %>
                        <p> La tua risposta alla recensione del tuo ristorante deve ancora essere controllata</p> 
                        <%
                            }
                        %>
                        <div>
                            <%=risposte.getString("rvn") %>
                        </div>
                        <div>
                            <%=risposte.getString("rvdes") %>
                        </div>
                        LA TUA RISPOSTA:
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
                    String sqlR ="SELECT RP.description as rpdes, RP.date_creation as rpdc, RP.date_validation as rpdv, rp.accepted as acc, rp.id_validator as rpv, rv.name as rvn, rv.description as rvdes, rv.date_creation as rvdc  FROM REPLIES as RP, REVIEWS as RV WHERE RP.id_review = RV.id AND RP.accepted IS NULL";
                    ResultSet risposte = manager.getData(sqlR);
                    int a = 0;
                    int b = 0;
            %>   
            <!-- NOTIFICHE PER L' ADMIN -->
            <div>
                ECCO LE FOTO SEGNALATE DA CONTROLLARE
                <%
                    while(segnalazioni.next()){
                        a++;
                %>
                <div class="col-md-12 Azzurro_tondo">
                    <div id="segnalazione_controllata"  class="btn btn-responsive Azzurro_no_bordo"> 
                        <img src="<%=segnalazioni.getString("path") %>" width="250">
                        <br>
                        Per il ristorante <%=segnalazioni.getString("name") %>
                        <div>
                            <input type="button" value="conserva" /> <input type="button" value="elimina" />
                        </div>
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
                
                ECCO LE RISPOSTE DA CONTROLLARE
                <%
                    while(risposte.next()){
                        b++;
                %>
                <div class="col-md-12 Azzurro_tondo">
                    <div id="segnalazione_controllata"  class="btn btn-responsive Azzurro_no_bordo"> 
                        <div>
                            <%=risposte.getString("rvn") %>
                        </div>
                        <div>
                            <%=risposte.getString("rvdes") %>
                        </div>
                        LA TUA RISPOSTA:
                        <div>
                            <%=risposte.getString("rpdes") %>
                        </div>
                        <div>
                            <input type="button" value="accetta" /> <input type="button" value="rifiuta" />
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
            %> 
        </div>
        <%
            }
        %>
    </body>
</html>