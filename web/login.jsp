<%-- 
    Document   : login
    Created on : 17-gen-2017, 12.03.31
    Author     : Carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Magnagioia Login</title>
    </head>
    <body>
        <%@page import="db.Utente" %>
        <%
            HttpSession ses = request.getSession();
            Utente utente;
            utente = (Utente)ses.getAttribute("utente");
            if(utente!=null){
                response.sendRedirect("index2.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10 col-xs-12">
                    <div class="panel panel1 panel-default">
                        <div class="panel1 panel-heading">
                            Log in
                        </div>
                        <div class="panel1 panel-body">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <form id="login" action="User" method="POST"> <!Inserire qua la servlet per il controllo login>
                                        <table>
                                            <tr>
                                                <td>
                                                    <b>E-mail:</b>
                                                </td>
                                                <td>
                                                    <input type="text" name="email" maxlength="50">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Password:</b>
                                                </td>
                                                <td>
                                                    <input type="password" name="password" maxlength="50">
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="2">
                                                    <input type="submit" value="Registrati">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <a id="a" onclick="sendPassword()">Mi sono dimenticato la password</a>
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
