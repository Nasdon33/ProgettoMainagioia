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
            if(utente!=null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
        <%@include file='modal.jsp' %>
            
                    <div class="col-sm-3"></div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-2 col-xs-6" id="banner">
                        <div class="panel panel3 panel-default" >
                            
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>