/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlo
 */
public class GeoSearch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
            String sqlget = "SELECT ID FROM Cuisines ORDER BY ID DESC  fetch first 1 rows only";
            ResultSet increment = manager.getData(sqlget);
            increment.next();
            int choice = 0 + (int)(Math.random() * ((increment.getInt("id") - 0) + 1));
            System.out.println(choice);
            String cucina = String.valueOf(choice);
            String sql3 = "SELECT R.id, R.name as name, Cui.name as cucina, acos(sin(Coo.Latitude) * sin(?) + cos(Coo.Latitude) * cos(?) * cos(Coo.longitude-?)) as dist "
                    + "FROM Restaurants as R, Restaurant_cuisine as RCui, Cuisines as Cui, "
                    + "Restaurant_coordinate as RCoo, Coordinates as Coo "
                    + "WHERE R.id = RCui.id_restaurant AND RCui.id_cousine = Cui.id AND Cui.id = ? "
                    + "AND RCoo.id_restaurant = R.id AND RCoo.id_coordinate = Coo.id "
                    + "ORDER BY dist ASC";
            String latitude = request.getParameter("lati");
            String longitude = request.getParameter("long");
            ResultSet ristoranti2 = manager.getData(sql3,latitude, latitude, longitude, cucina);
            if(ristoranti2.next()){
            
                    out.println("<div class =\"col-md-12 col-xs-12\" style=\"background-color: white; opacity:0.9; border-radius: 30px\"> ");
                    out.println("<center>");
                        out.println("<h1>Ristoranti più vicini per cucina "+ ristoranti2.getString("cucina") +": </h1>");
                        
                    for(int i = 0; i < 3; i++){

                        String idris = ristoranti2.getString("id");
                        String nome = ristoranti2.getString("name");
                       
                   
                    out.println("<div class=\"col-md-4 col-xs-4 btn-responsive\" id=\"Altezza\"> ");
                        out.println("<br>");
                        out.println("<center>");
                        String sql10 = "SELECT path FROM Mainagioia.Photos WHERE id_restaurant = ? AND description='Principale'";
                        ResultSet foto = manager.getData(sql10,idris);
                        foto.next();
                        
                        out.println("<a href=ristorante.jsp?id="+idris+"\"><img src=\""+foto.getString("path")+"\" width=\"90%\" style=\"border-radius: 30px\"></a>");
                    out.println("<br>");
                    out.println("<a href=\"ristorante.jsp?id="+idris+"\" style=\"color: #5bc0de\"><h5> "+nome+" </h5></a>");
                    
                    String sql4 = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                    ResultSet recensioni = manager.getData(sql4,idris);
                    int c = 0;
                    int voto = 0;
                    while(recensioni.next()){
                        c++;
                        voto += recensioni.getInt("global_value");
                    }
                    if(c > 0){
                        out.print("Voto: ");
                        for(int k = voto / c; k > 0; k--)
                            out.print("♥");
                        out.print(" su "+c+" Recensioni");
                    }
                    else
                        out.print("0 Recensioni");
                    out.println("<br>");
                    out.println("Cucina: ");
                    String sql5 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                    ResultSet cuisine = manager.getData(sql5,idris);
                    cuisine.next();
                    out.print(cuisine.getString("name"));
                    while(cuisine.next())
                            out.print(", " + cuisine.getString("name"));

                        out.println("</center>");
                        out.println("<br>");
                    out.println("</div>");
                    if(!ristoranti2.next())
                        i = 3;
                    }
                     out.println("</center>");
                 out.println("</div>");
                        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GeoSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GeoSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
