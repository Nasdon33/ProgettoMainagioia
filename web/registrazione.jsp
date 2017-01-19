<%-- 
    Document   : registrazione
    Created on : 17-gen-2017, 12.29.47
    Author     : Carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PAGINA DA SISTEMARE>
<html>
    <head>
        <%@include file="head.html" %>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        
        <link href="style2.css" rel="stylesheet" type="text/css">
        <link href="Login.css" rel="stylesheet" type="text/css">
        
        <title>Registrazione</title>
    </head>
    <body>
        <%@page import="db.Utente" %>
        <%@include file="header.jsp" %>
        <%
            utente = (Utente)ses.getAttribute("utente");
            if(utente!=null){
                response.sendRedirect("index_nuovo.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10 col-xs-12">
                    <div class="panel panel1 panel-default">
                        <div class="panel1 panel-heading">
                            Registration Form
                        </div>
                        <div class="panel1 panel-body">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <form method="post" action="Registrazione" id="registrazione">
                                        <table>
                                            <tr>
                                                <td>
                                                    <b>Nome:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="nome" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Cognome:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="cognome" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Nickname:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="nickname" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>E-mail:</b>
                                                </td>
                                                <td>
                                                    <input type="email" name="email" maxlength="50" required>          
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    <b>Password:</b>
                                                </td>
                                                <td>
                                                    <input type="password" name="password" maxlength="50" required>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Ripeti password:</b>
                                                </td>
                                                <td>
                                                    <input type="password" name="pass2" maxlength="50" required>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Registrati">
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
