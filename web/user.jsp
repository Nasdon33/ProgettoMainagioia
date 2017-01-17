<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page import="db.Utente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <%@include file="head.html"%>
        <title>User</title>
    </head>
    
    <body>
        <%
            HttpSession ses = request.getSession();
            Utente utente;
            utente = (Utente)ses.getAttribute("utente");
            if(utente==null){
                response.sendRedirect("login.jsp");
            } else if (!utente.getRuolo().equals("user")){
                response.sendRedirect("login.jsp");
            }
        %>
        <%@include file='modal.jsp' %>
            
                    <div class="col-sm-3"></div>
                    <div class="col-sm-1"></div>
                    <div class="col-sm-2 col-xs-6" id="banner">
                        <div class="panel panel3 panel-default" >
                            <div class="panel3 panel-heading">
                                <strong>Banner Pubblicitario</strong>
                            </div>
                            <div class="panel3 panel-body">
                                <img src="img/banner.jpg" class="img-rounded" alt="banner">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>