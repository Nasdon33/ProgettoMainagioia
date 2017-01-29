<%-- 
    Document   : ristorante
    Created on : Jan 17, 2017, 12:06:37 PM
    Author     : adribuc
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="db.DBManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.Ristorante"%>
<%@page import="db.Utente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/style2.css" rel="stylesheet" type="text/css">  
        <link href="css/Commenti.css" rel="stylesheet" type="text/css">
        <link href="css/Valutazione.css" rel="stylesheet" type="text/css">
        <link href="css/recensione.css" rel="stylesheet" type="text/css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvqLGJyMiDEZIohhJaX63cDfyXTDHky-g"></script>
        
        
        <title>Ristorante Magnagioia</title>
    </head>
    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        
        <%-- Script per i MODAL --%>
        
        <%! private DBManager manager; %>
            <%! 
                public void init() throws ServletException {
                    // inizializza il DBManager dagli attributi di Application
                    this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                    //System.out.println("DBManager attivato\n");
                } 
            %>
        
        <%      
        String idris = request.getParameter("id");
        String sql = "SELECT R.NAME, R.DESCRIPTION, R.WEB_SITE_URL, R.ID_OWNER, RC.ID_COORDINATE, P.ID FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Price_ranges as P  WHERE R.id = ? AND R.id = RC.id_restaurant AND R.ID_PRICE_RANGE = P.id";
        ResultSet ristorante = manager.getData(sql, idris);
        ristorante.next();
        %>
        
        
        <div class="row2" id="Spazio">
            <div class="col-md-3 col-xs-3">
                <div>
                    <%
                        String sql10 = "SELECT path FROM Mainagioia.Photos WHERE id_restaurant = ? AND description = 'Principale' ";
                        ResultSet foto = manager.getData(sql10,idris);
                        foto.next();
                        String sql11 = "SELECT * FROM Mainagioia.Photos WHERE id_restaurant = ? AND description <> 'Principale'";
                        ResultSet foto2 = manager.getData(sql11,idris);
                    %>
                    <img src="<%=foto.getString("path") %>" width="100%" alt="immagine"> 

                </div>
                <div id="Spazio">
                    <div class="container">
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-primary btn-responsive Azzurro" id="myBtn">Inserisci foto</button>
                    <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">
                            <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header col-md-12 col-xs-12 " style="padding:35px 50px;">
                                    <center>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                                    <p style="font-size:30px">
                                        <span class="glyphicon glyphicon-open"></span>
                                        Inserisci foto:
                                    </p>
                                    <hr>
                                    <form action="Photos" method="post" enctype="multipart/form-data" id="Spazio">
                                    <input type="file" name="file" />
                                    <h4>
                                        <i class="fa fa-paper-plane-o"></i>
                                        Descrizione:
                                    </h4>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="2" name="descrizione"></textarea>
                                    </div>
                                    <input type="hidden" value="<%=idris %>" name="idris" />
                                    <br>
                                    <input type="submit" value="Carica Foto" class="btn btn-primary btn-responsive Azzurro"/>
                                    </form>
                                    </center>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary btn-responsive pull-left Azzurro" data-dismiss="modal">Chiudi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>           
            <script>
            $(document).ready(function(){
                $("#myBtn").click(function(){
                    $("#myModal").modal();
                });
            });
            </script>
        </div>
        <div class="col-md-6 col-xs-5">
            <div>
                <b style="font-size: 25px"><%= ristorante.getString("name") %></b>
            </div>
            <div>
                <div id="Spazio"> <%--Descrizione --%> 
                <% out.println(ristorante.getString("description")); %>
                </div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-3 col-xs-4">
            <center>  
            <form action="Recensione.jsp?id=<%=idris %>" method="post">
                <input type="submit" class="btn btn-primary btn-responsive Azzurro" value="Scrivi una Recensione" />
            </form>  
            <!-- Boxes de Acoes -->
            <div class="col-xs-12 col-md-12 Sparisci_2">
                <div class="icon">
                    <a class="btn btn-primary btn-responsive" href="#primary" data-toggle="modal"><i class="fa fa-soundcloud"></i>Visualizza Orari</a>
                    <!-- Modal -->
                    <div class="modal fade" id="primary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header modal-header-primary">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <p style="font-size: 30px"> <i class="fa fa-bar-chart-o"></i><h4>Visualizza Orari </h4>
                                </div>
                                <div class="modal-body">
                                    <!-- INSERIRE LA TABELLA CON GLI ORARI -->
                                    <% String url = "tabella_orari.jsp?id="+idris; %>
                                    <jsp:include page="<%=url %>" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-responsive pull-left Azzurro" data-dismiss="modal">Chiudi</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    <!-- Modal -->
                </div>
            </div>
            </center>                            
        </div>
	<div class="space">
        </div>	 
        <div class="row3">
            <div class="col-md-5 col-xs-9" id="spazio">
                <hr>
                <%
                    String sql6 = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                    ResultSet recensioni = manager.getData(sql6,idris);
                    ResultSet recensioni2 = recensioni;
                    int c[] = {0,0,0,0,0};
                    double tot = 0.0;

                    double voto = 0.0;
                    while(recensioni.next()){
                        tot++;
                        int i = recensioni.getInt("global_value");
                        voto += i;
                        c[i-1]++;
                    }
                    double media = 0.0;
                        if(tot > 0)
                            media = voto / tot;
                %> 
                    
                <div id="Sparisci_3">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="well well-sm">
                                <div class="row">
                                    <div class="col-xs-5 col-md-5 text-center">
                                        <h1 class="rating-num">
                                        <% 
                                            if(media > 0)
                                                out.print((float)((int) (media*10)) /10);
                                            else
                                                out.print("-");
                                        %>
                                        </h1>
                                        <div class="rating">
                                            <% 
                                                for(int k = 0;k < 5; k++){
                                                    if((int) media-k > 0){ %>
                                                        <span class="glyphicon glyphicon-star"></span>
                                                        <%
                                                    }
                                                    else{
                                                        %>
                                                        <span class="glyphicon glyphicon-star-empty"></span>
                                                        <%
                                                    }
                                                }
                                            %>
                                        </div>
                                        <div>
                                            <span class="glyphicon glyphicon-user"></span><%=(int)tot %> recensioni
                                        </div>
                                    </div>
                                    <div class="col-xs-7 col-md-7" id="sx">
                                        <div class="row rating-desc">
                                            <% 
                                                for(int n = 5; n > 0; n--){
                                                    int p = (int) ((c[n-1]/tot) * 100);
                                            %>
                                            <div class="col-xs-3 col-md-3 text-right">
                                                <span class="glyphicon glyphicon-star"></span><%=n %>
                                            </div>
                                            <div class="col-xs-8 col-md-9">
                                                <div class="progress progress-striped">
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                                        aria-valuemin="0" aria-valuemax="100" style="width: <%=p %>%">
                                                        <span class="sr-only">
                                                            <%=p %>%
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                }
                                            %>
                                            <!-- end 1 -->
                                        </div>
                                    <!-- end row -->
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" id="Spazio2">
                                    <% 
                                        int x = 0;
                                        if(foto2.next()){
                                            do{
                                                x++;
                                    %>   
                                    <div class="col-md-4 col-xs-4 thumb">
                                        <a id="img" class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="<%=foto2.getString("name") %>" data-caption="<%=foto2.getString("description") %>" data-image="<%=foto2.getString("path") %>" data-target="#image-gallery">
                                        <div>
                                            <img class="img-responsive" src="<%=foto2.getString("path") %>" alt="Short alt text">
                                        </div>
                                        </a>
                                        <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <center>
                                                    <div class="modal-body">
                                                        
                                                        <div class="caption">
                                                            <div id="titolo"></div><hr>
                                                            <img id="image-gallery-image" class="img-responsive" src="" alt="UEUE" width="350px"> <!--INSERIRE LINK A FOTO SELEZIONATA-->
                                                            <div id="descrizione"></div>
                                                        </div>
                                                    </div>
                                                    </center>
                                                    <div class="modal-footer">
                                                        <div class="col-md-2 col-xs-2">
                                                            <button type="button" class="btn btn-primary btn-responsive pull-left Azzurro" data-dismiss="modal">Chiudi</button>
                                                        </div>                
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                        $(document).ready(function () { //Dom Ready
                                            $('#image-gallery').on('show.bs.modal', function (e) { //Event listener
                                                var image = $(e.relatedTarget).data("image"); //.getAttribute("data-image"); //Fetch image url from modal trigger <a> link
                                                var titolo = $(e.relatedTarget).data("title"); //getAttribute("data-title"); //Fetch image url from modal trigger <a> link
                                                var descrizione = $(e.relatedTarget).data("caption"); //getAttribute("data-caption"); //Fetch image url from modal trigger <a> link
                                                document.getElementById("image-gallery-image").setAttribute("src", image); //load image in modal
                                                document.getElementById("titolo").innerHTML = "<H2>"+titolo+"</H2>";                                        
                                                document.getElementById("descrizione").innerHTML = "<H4>"+descrizione+"</H4>";
                                            });
                                        });
                                        </script>                   
                                    </div>                    
                                    <%
                                            }while((foto2.next()) && (x < 3));
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-xs-3 Altezza" id="Sparisci">
            <jsp:include page="<%=url %>" />
        </div>                                
        <div class="row2">
            <div class="col-md-12 col-xs-12" id="Spazio">
                <table class="table table-bordered">
                    <br>
                    <thead>
                        <tr>
                            <th>Indirizzo</th>
                            <th>Prezzo</th>
                            <th>Cucina</th>
                            <th>Sito</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <% 
                                    String idcoo = ristorante.getString("id_coordinate");
                                    String sql2 = "SELECT * FROM mainagioia.coordinates WHERE id = ?";
                                    ResultSet address = manager.getData(sql2,idcoo);
                                    address.next();
                                    float lati=Float.parseFloat(address.getString("latitude"));
                                    float longi=Float.parseFloat(address.getString("longitude"));
                                %>
                                <input type="hidden" id="latitude"  name="latitude" value="<%=lati%>">
                                <input type="hidden" id="longitude"  name="longitude" value="<%=longi%>">
                                <%
                                    out.println(address.getString("address")+", "+address.getString("city")+" "+address.getString("province")); 
                                %>
                                <a class="btn btn-primary btn-responsive Azzurro" href="#secondary" data-toggle="modal"><i class="fa fa-soundcloud"></i><img src="https://www.shareicon.net/data/128x128/2015/11/05/667119_map_512x512.png" height="20">
                                    Visualizza su Mappa
                                </a>
                                <!-- Modal -->
                                <div class="modal fade" id="secondary" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <!-- INSERIRE LA TABELLA CON GLI ORARI -->  
                                                <center>
                                                <div id="map-canvas" style="height:350px; width:100%"></div>
                                                    <script>

                                                        var map;
                                                        var tmp1=document.getElementById('latitude').value;
                                                        var lat=parseFloat(tmp1);
                                                        console.log(lat);
                                                        var tmp2=document.getElementById('longitude').value;
                                                        var long=parseFloat(tmp2);
                                                        console.log(long);
                                                        $("#secondary").on("shown.bs.modal", function () {
                                                        google.maps.event.trigger(map, "resize");
                                                        });
                                                        function initialize() {
                                                            var mapOptions = {
                                                                zoom: 13,
                                                                center: new google.maps.LatLng(lat+0.018345, long-0.029393 )
                                                            };
                                                            map = new google.maps.Map(document.getElementById('map-canvas'),
                                                                    mapOptions);
                                                                    TestMarker();
                                                             }

                                                        google.maps.event.addDomListener(window, 'load', initialize);
                                                        function addMarker(location) {
                                                            marker = new google.maps.Marker({
                                                                position: location,
                                                                map: map
                                                                });
                                                            }

                                                             // Testing the addMarker function
                                                        function TestMarker() {
                                                               mark = new google.maps.LatLng(lat, long);
                                                               addMarker(mark);
                                                        }
                                                    </script> 
                                                </center>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary btn-responsive pull-left Azzurro" data-dismiss="modal">Chiudi</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                                <!-- Modal -->
                            </td>
                            <td>
                                <% 
                                    String idpri = ristorante.getString("id");
                                    String sql3 = "SELECT name FROM mainagioia.price_ranges WHERE id = ?";
                                    ResultSet price = manager.getData(sql3,idpri);
                                    price.next();
                                    out.println(price.getString("name")); //si potrebbe anche stamparlo come icone in € volendo
                                %>
                            </td>
                            <td>
                                <% 
                                String sql4 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                                ResultSet cuisine = manager.getData(sql4,idris);
                                cuisine.next();
                                out.print(cuisine.getString("name"));
                                    while(cuisine.next())
                                            out.print(", " + cuisine.getString("name"));
                                %>
                            </td>
                            <td>
                                <%
                                    out.println(ristorante.getString("web_site_url"));
                                %>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row6"> 
            <div class="col-md-12 col-xs-12">
                <div class="row.header">
                    <div class="row">
                        <div class="col-sm-12" id="Arancio">
                            <h3><center>Scopri le recensioni dei clienti:</center></h3>
                        </div><!-- /col-sm-12 -->
                    </div><!-- /row -->
                    <div>
                        <%
                            recensioni = manager.getData(sql6,idris);
                            while(recensioni.next()){
                        %>
                    </div>
                    <div>    
                        <div class="col-sm-1 col-xs-2">
                            <div class="thumbnail">
                                <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                            </div><!-- /thumbnail -->
                        </div><!-- /col-sm-1 -->
                        <div class="col-sm-5 col-xs-10">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <strong>
                                                <%
                                                    String sql7 = "SELECT nickname FROM mainagioia.Users WHERE id = ?";
                                                    ResultSet user = manager.getData(sql7,recensioni.getString("id_creator"));
                                                    user.next();
                                                    out.print(user.getString("nickname"));
                                                %>
                                            </strong>
                                            <span class="text-muted"> postato 
                                            <%
                                                Timestamp time = recensioni.getTimestamp("date_creation");
                                                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                                                long diff = timestamp.getTime() - time.getTime();
                                                long seconds = diff / 1000;
                                                long minutes = seconds / 60 ;
                                                seconds = seconds % 60;
                                                long hours = minutes / 60;
                                                minutes = minutes % 60;
                                                long days = hours / 24;
                                                hours = hours % 24;
                                                long months = days / 30;
                                                days = days % 30;
                                                long years = months / 12;
                                                months = months % 12;

                                                if(years > 0){
                                                    out.print(years+" ann");
                                                    if(years > 1)
                                                        out.print("i");
                                                    else
                                                        out.print("o");
                                                    if(months > 1)
                                                        out.print(" e "+ months +" mesi");
                                                }
                                                else if (months > 0){
                                                    out.print(months+" mes");
                                                    if(months > 1)
                                                        out.print("i");
                                                    else
                                                        out.print("e");
                                                }
                                                else if (days > 0){
                                                    out.print(days+" giorn");
                                                    if(days > 1)
                                                        out.print("i");
                                                    else
                                                        out.print("o");
                                                }
                                                else if (hours > 0){
                                                    out.print(hours+" or");
                                                    if(hours > 1)
                                                        out.print("e");
                                                    else
                                                        out.print("a");
                                                }
                                                else if (minutes > 0){
                                                    out.print(minutes+" minut");
                                                    if(minutes > 1)
                                                        out.print("i");
                                                    else
                                                        out.print("o");
                                                }
                                                 else{
                                                    out.print(seconds+" second");
                                                        if(seconds > 1)
                                                            out.print("i");
                                                        else
                                                            out.print("o");
                                                 }
                                                out.print(" fa");
                                            %>
                                        </div>
                                        <div class="col-md-3">
                                            <%
                                                String sql12 = "SELECT like_type FROM user_review_likes WHERE id_review = ?";
                                                ResultSet likes = manager.getData(sql12, recensioni.getString("id"));
                                                int l = 0;
                                                while(likes.next()){
                                                    l += Integer.parseInt(likes.getString("like_type"));
                                                }
                                                if(l > 0)
                                                    out.println("+");
                                                out.println(l);
                                            %>
                                            <a href="Recensione?id=<%=recensioni.getString("id_creator") %>&idr=<%=recensioni.getString("id") %>&val=1" >
                                                <img src="https://www.forzacavallasca.it/wp-content/plugins/like-dislike-counter-for-posts-pages-and-comments/images/up.png" alt="like">
                                            </a>
                                            <a href="Recensione?id=<%=recensioni.getString("id_creator") %>&idr=<%=recensioni.getString("id") %>&val=-1">
                                                <img src="https://www.forzacavallasca.it/wp-content/plugins/like-dislike-counter-for-posts-pages-and-comments/images/down.png" alt="like">
                                            </a>
                                        </div>
                                    </div>
                                    <div>
                                        <% 
                                            out.print("Voto Globale: ");
                                            for(int k = recensioni.getInt("global_value"); k > 0; k--)
                                            out.print("♥");
                                        %>
                                    </div>
                                    <div>
                                        <%
                                            out.print("Voto Cibo: ");
                                            for(int k = recensioni.getInt("food"); k > 0; k--)
                                            out.print("♥");
                                        %>
                                    </div>
                                    <div>    
                                        <%
                                            out.print("Voto Servizio: ");
                                            for(int k = recensioni.getInt("service"); k > 0; k--)
                                            out.print("♥");
                                        %>
                                    </div>
                                    <div>    
                                        <%   
                                            out.print("Voto Qualità/Prezzo: ");
                                            for(int k = recensioni.getInt("value_for_money"); k > 0; k--)
                                            out.print("♥");
                                        %>
                                    </div>
                                    <div>    
                                        <%
                                            out.print("Voto Atmosfera: ");
                                            for(int k = recensioni.getInt("atmosphere"); k > 0; k--)
                                            out.print("♥");
                                       %>
                                    </div>
                                    </span>
                                </div>
                                <div>
                                    <div class="panel-body">
                                        <div style="font-weight: bold" class="Font_ufficale_titoli">
                                            <%=recensioni.getString("name") %>
                                        </div>
                                        <div class="Font_ufficale_normale">
                                            <%=recensioni.getString("description") %>
                                        </div>
                                    </div><!-- /panel-body -->
                                    <div class="panel-body">
                                        <% 
                                            String sql8 = "SELECT description, date_creation, id_validator FROM Replies WHERE id_review = ?";
                                            ResultSet risposta = manager.getData(sql8,recensioni.getString("id"));

                                            if(risposta.next()){
                                                if(risposta.getString("id_validator") != null){
                                                    out.print("Risposta del ristoratore ");
                                                    time = risposta.getTimestamp("date_creation");
                                                    timestamp = new Timestamp(System.currentTimeMillis());
                                                    diff = timestamp.getTime() - time.getTime();
                                                    seconds = diff / 1000;
                                                    minutes = seconds / 60 ;
                                                    seconds = seconds % 60;
                                                    hours = minutes / 60;
                                                    minutes = minutes % 60;
                                                    days = hours / 24;
                                                    hours = hours % 24;
                                                    months = days / 30;
                                                    days = days % 30;
                                                    years = months / 12;
                                                    months = months % 12;

                                                    if(years > 0){
                                                        out.print(years+" ann");
                                                        if(years > 1)
                                                            out.print("i");
                                                        else
                                                            out.print("o");
                                                        if(months > 1)
                                                            out.print(" e "+ months +" mesi");
                                                    }
                                                    else if (months > 0){
                                                        out.print(months+" mes");
                                                        if(months > 1)
                                                            out.print("i");
                                                        else
                                                            out.print("e");
                                                    }
                                                    else if (days > 0){
                                                        out.print(days+" giorn");
                                                        if(days > 1)
                                                            out.print("i");
                                                        else
                                                            out.print("o");
                                                    }
                                                    else if (hours > 0){
                                                        out.print(hours+" or");
                                                        if(hours > 1)
                                                            out.print("e");
                                                        else
                                                            out.print("a");
                                                    }
                                                    else if (minutes > 0){
                                                        out.print(minutes+" minut");
                                                        if(minutes > 1)
                                                            out.print("i");
                                                        else
                                                            out.print("o");
                                                    }
                                                     else{
                                                        out.print(seconds+" second");
                                                            if(seconds > 1)
                                                                out.print("i");
                                                            else
                                                                out.print("o");
                                                     }
                                                    out.print(" fa:");
                                                    out.println(risposta.getString("description"));
                                                }
                                            }
                                            else{
                                                if (utente != null)
                                                    if(utente.getId().equals(ristorante.getString("id_owner"))){
                                                        %>
                                                            RISPONDI
                                                        <%
                                                    }
                                            }  
                                          %>    
                                    </div>
                                </div>
                            </div><!-- /panel panel-default -->
                        </div><!-- /col-sm-5 -->
                        <%
                            }
                        %>
                    </div> 
                </div><!-- /container -->
            </div>
        </div>
    </body> 
</html>
    
    
