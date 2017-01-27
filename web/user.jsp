<%-- 
    Document   : login
    Created on : 17-gen-2017, 12.03.31
    Author     : Carlo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.html" %>
        <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/style2.css" rel="stylesheet" type="text/css">
        <link href="css/notifiche.css" rel="stylesheet" type="text/css">
        <title>Magnagioia Login</title>
    </head>
    <body>
        <%@page import="db.Utente" %>
        <div class="row">
        <%@include file="header.jsp" %>
        <%
            if(!utente.getRuolo().contains("user")){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
        </div>
        <center>
            <!-- Notification header -->
            <div>
                <h3>Ecco le tue notifiche:</h3>
            </div>
        </center>
        <!-- Notifications -->
        <div class="container">
            <%--<c:forEach items="listaNotifiche" var="notifica">--%>
             <%-- <c:forEach var="i" begin="1" end="5"> --%>
                 <div class="row">
                     <div class="col-md-2">
                         <p> </p>
                     </div>
                     <div class="col-md-8">
                         <div class="row">
                         <button type="button" class="btn btn-warning ribbon">
                             <!-- if foto_rimossa then -->                             
                             <img src="immagine-utente.jpg" alt="nome-utente" class="profile_img">
                                Ha rimosso la
                                <a href="link-recensione">foto</a>
                                che ci hai segnalato
                             <%-- OPPURE: <c:out value="${notifica.testo}"/> --%>
                             <c:out value="${i}}"/>
                         </button>
                         </div>
                     </div>
                     <div class="col-md-2">
                         <p>  </p>
                     </div>
                 </div>
                 <br>
             <%-- </c:forEach> --%>
        </div>
    </body>
</html>