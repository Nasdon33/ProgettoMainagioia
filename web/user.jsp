<%-- 
    Document   : login
    Created on : 17-gen-2017, 12.03.31
    Author     : Carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html    PAGINA DA SISTEMARE>
<html>
    <head>
        <%@include file="head.html" %>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        
        <link href="style2.css" rel="stylesheet" type="text/css">
        <link href="Login.css" rel="stylesheet" type="text/css">
        <title>Magnagioia Login</title>
    </head>
    <body>
        <%@page import="db.Utente" %>
        <%@include file="header.jsp" %>
        <%
            if(!utente.getRuolo().contains("user")){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
        
            
            
    </body>
</html>