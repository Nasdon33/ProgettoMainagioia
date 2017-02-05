<%-- 
    Document   : tabella orari
    Created on : 27-gen-2017, 11.57.15
    Author     : Carlo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%! private DBManager manager; %>
            <%! 
                public void init() throws ServletException {
                    // inizializza il DBManager dagli attributi di Application
                    this.manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
                    //System.out.println("DBManager attivato\n");
                } 
            %>
            
        <div class="table">
                    <table class="table table-responsive"id="Altezza"  style="background-color: white; opacity:0.9; border-radius: 30px"> <!-- Orari del ristorante -->
                    <thead>
                      <tr>
                    <th>Giorno</th>
                    <th></th>
                    <th>Orari</th>
                      </tr>
                    </thead>
                    
                    <tbody> <!-- prende dal database i dati, la pagina verrà poi inclusa nel modal e in ristoranti.jsp -->
                        <tr>
                            
                        <%
                            String giorni[] = {"Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"};
                            String sql5 = "SELECT O.day_of_the_week, O.start_hour, O.end_hour FROM opening_hours_ranges as O, (SELECT OH.id_opening_hours_range FROM opening_hours_range_restaurant as OH WHERE OH.id_restaurant = ?) as R WHERE R.id_opening_hours_range = O.id";
                            ResultSet orari = manager.getData(sql5,request.getParameter("id"));
                            
                            
                            orari.next();
                            boolean b = true;
                            for(int i=0;i < 7; i++){
                                out.println("<tr>"
                                        + "<td>"+giorni[i]+"<td>");
                                if((b == true) && Integer.parseInt(orari.getString("day_of_the_week")) == i+1){
                                    out.println("<td>"+orari.getString("start_hour").substring(0,5)+" - "+orari.getString("end_hour").substring(0,5)+"</td>"
                                        );
                                    boolean a = true;
                                    while(a == true && orari.next()){
                                        if(Integer.parseInt(orari.getString("day_of_the_week")) == i+1)
                                            out.println(
                                            "<td></td>"
                                            + "<td>"+orari.getString("start_hour").substring(0,5)+" - "+orari.getString("end_hour").substring(0,5)+"</td>"
                                            + "</tr>");
                                        else
                                            a = false;
                                    }
                                    if(a == true)
                                        b = false;
                                }
                                else{
                                    out.println("<td id='Rosso';> CHIUSO </td>" + "</tr>");
                                }     
                            }                   
                        %>
                           
                        </tr>
                    </tbody>
                    
                  </table>
                </div>
    </body>
</html>
