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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brando
 *
 */
public class Ricerca extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");

        PrintWriter out = response.getWriter();

        String radiob = request.getParameter("radiob");
        String tipo = request.getParameter("tipo");
        String search = request.getParameter("cerca");
        System.out.println(radiob);
        System.out.println(tipo);
        System.out.println(search);
        ResultSet ristoranti;
        switch (radiob) {
            case "gridRadios1": {//ORDINA PER CLASSIFICA
                if (tipo.contains("zona")) { //da fare per bene
                    String sql = "SELECT RV.id_restaurant  as idr, AVG(CAST (RV.global_value as float)) as med\n" +
                    "    FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C, mainagioia.Reviews as RV\n" +
                    "    WHERE R.id = RV.ID_RESTAURANT AND R.id = RC.id_restaurant AND RC.id_coordinate = C.id\n" +
                    "            AND (C.city = ? OR C.province = ? OR C.state = ?)\n" +
                    "    GROUP BY RV.id_restaurant\n" +
                    " UNION\n" +
                    " SELECT R.id as idr, 0 as med\n" +
                    "    FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C\n" +
                    "    WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id\n" +
                    "            AND (C.city = ? OR C.province = ? OR C.state = ?)\n" +
                    "            AND R.id NOT IN(SELECT id_restaurant FROM Reviews)\n" +
                    "ORDER BY med DESC";
                    ristoranti = manager.getData(sql, search, search, search,search, search, search);
                    /*String idris = ristoranti.getString("RV.id_restaurant");
                    String sqlname = "SELECT name FROM Restaurants WHERE id = ?";
                    ResultSet nome = manager.getData(sqlname, idris);*/

                } else if (tipo.contains("cucina")) {
                    String sql = "SELECT  RV.id_restaurant as idr, AVG(CAST (RV.global_value as float)) as med\n"
                            + " FROM mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C, mainagioia.Reviews as RV \n"
                            + "WHERE R.id = RC.id_restaurant AND RC.id_cousine = C.id AND R.id = RV.ID_RESTAURANT AND C.name=?\n "
                            + "GROUP BY RV.id_restaurant \n"
                            + "UNION \n"
                            + "SELECT  R.id as idr, 0 as med \n"
                            + "FROM mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C\n "
                            + "WHERE R.id = RC.id_restaurant AND RC.id_cousine = C.id AND C.name=? \n"
                            + "AND R.id NOT IN(SELECT id_restaurant FROM Reviews)\n"
                            + "ORDER BY med DESC";
                    ristoranti = manager.getData(sql, search, search);
                } else if (tipo.contains("nome")) {
                    String sql = "SELECT  RV.id_restaurant as idr, AVG(CAST (global_value as float)) as med \n" +
                        "FROM mainagioia.Restaurants as R,mainagioia.Reviews as RV\n" +
                        "WHERE R.name like ? AND RV.id_restaurant=R.id\n" +
                        "GROUP BY RV.id_restaurant\n" +
                        "UNION\n" +
                        "SELECT  R.id as idr, 0 as med \n" +
                        "FROM mainagioia.Restaurants as R\n" +
                        "WHERE R.name like ? AND R.id NOT IN(SELECT id_restaurant FROM Reviews)\n" +
                        "ORDER BY med DESC";
                    ristoranti = manager.getData(sql, "%" + search + "%", "%" + search + "%");
                } else {
                    String sql = ("SELECT RV.id_restaurant  as idr, AVG(CAST (RV.global_value as float)) as med\n" +
                        "FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C, mainagioia.Reviews as RV\n" +
                        "WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND R.id = RV.ID_RESTAURANT AND C.address like ? \n" +
                        "GROUP BY RV.id_restaurant\n" +
                        "UNION\n" +
                        "SELECT R.id  as idr, 0 as med\n" +
                        "FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C\n" +
                        "WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND C.address like ? AND R.id NOT IN(SELECT id_restaurant FROM Reviews)\n" +
                        "ORDER BY med DESC");
                    ristoranti = manager.getData(sql, "%" + search + "%", "%" + search + "%");
                }
                if (!ristoranti.next()) {
                    out.println("<div class=\"col-md-12 col-xs-12\" style = \"background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.3px solid;\">");
                    out.println("<center> <p style =\"color:red\">**NESSUN RISTORANTE TROVATO**</p> </center> </div>");

                } else {
                    int i = 0;
                    out.println("<div class=\"row\">");
                    do {
                        if(i%3 == 0)
                            out.println("</div><div class=\"row\">");
                        i++;
                        String sql11 = "SELECT name FROM Restaurants WHERE id = ?";
                        String idris = ristoranti.getString("idr");
                        ResultSet nome = manager.getData(sql11, idris);
                        nome.next();
                        out.println("<div class=\"col-md-4 col-xs-4 btn-responsive\" id=\"Altezza\" style=\"background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.5px solid;\">");
                        out.println("<br>");
                        out.println("<center>");
                        String sql10 = "SELECT path FROM Mainagioia.Photos WHERE id_restaurant = ?";
                        ResultSet foto = manager.getData(sql10, idris);
                        foto.next();
                        out.println("<img src='"+foto.getString("path")+"' width=\"90%\" style=\"border-radius: 30px\">");
         
                        out.println("<br>");
                        String url = "ristorante.jsp?id=" + idris;
                        out.println("<a href=\""+ url +"\" style=color: #5bc0de > <h5>");
                        out.println(nome.getString("name"));
                        out.println("</h5></a>");
                        
                        String sql = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                        ResultSet recensioni = manager.getData(sql, idris);
                        int c = 0;
                        int voto = 0;
                        while (recensioni.next()) {
                            c++;
                            voto += recensioni.getInt("global_value");
                        }
                        if (c > 0) {
                            out.print("Voto: ");
                            for (int k = voto / c; k > 0; k--) {
                                out.print("♥");
                            }
                            out.print(" su " + c + " Recensioni");
                        } else {
                            out.print("0 Recensioni");
                        }
                        out.println("<br>");
                        out.println("Cucina:");
                        String sql1 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                        ResultSet cuisine = manager.getData(sql1, idris);
                        cuisine.next();
                        out.print(cuisine.getString("name"));
                        while (cuisine.next()) {
                            out.print(", " + cuisine.getString("name"));
                        }
                        out.print("</center>");
                        out.print("<br>");
                        out.print("</div>");
                    } while (ristoranti.next());
                    out.println("</div>");
                }
                break;
            }
            case "gridRadios2": {//ORDINA PER NOME
                if (tipo.contains("zona")) { //da fare per bene
                    String sql = ("SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND (C.city = ? OR C.province = ? OR C.state = ?) ORDER BY R.name");
                    ristoranti = manager.getData(sql, search, search, search);

                } else if (tipo.contains("cucina")) {
                    String sql = "SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C WHERE R.id = RC.id_restaurant AND RC.id_cousine = C.id AND C.name  = ? ORDER BY R.name";
                    ristoranti = manager.getData(sql, search);
                } else if (tipo.contains("nome")) {
                    String sql = "SELECT id, name FROM mainagioia.Restaurants WHERE name like ? ORDER BY name";
                    ristoranti = manager.getData(sql, "%" + search + "%");
                } else {
                    String sql = ("SELECT R.id, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND C.address like ? ORDER BY R.name");
                    ristoranti = manager.getData(sql, "%" + search + "%");
                }
                if (!ristoranti.next()) {
                    out.println("<div class=\"col-md-12 col-xs-12\" style = \"background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.3px solid;\">");
                    out.println("<center> <p style =\"color:red\">**NESSUN RISTORANTE TROVATO**</p> </center> </div>");

                } else {
                    int i = 0;
                    out.println("<div class=\"row\" >");
                    do {
                        if(i%3 == 0)
                            out.println("</div><div class=\"row\">");
                        i++;
                        String sql11 = "SELECT name FROM Restaurants WHERE id = ?";
                        String idris = ristoranti.getString("id");
                        ResultSet nome = manager.getData(sql11, idris);
                        nome.next();
                        out.println("<div class=\"col-md-4 col-xs-4 btn-responsive\" id=\"Altezza\" style=\"background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.5px solid;\">");
                        out.println("<br>");
                        out.println("<center>");
                        String sql10 = "SELECT path FROM Mainagioia.Photos WHERE id_restaurant = ? AND description='Principale' ";
                        ResultSet foto = manager.getData(sql10, idris);
                        foto.next();
                        out.println("<img src='"+foto.getString("path")+"' width=\"90%\" style=\"border-radius: 30px\">");
         
                        out.println("<br>");
                        String url = "ristorante.jsp?id="+idris;
                        out.println("<a href="+ url + " style=\"font-size:18px; color: #5bc0de >");
                        out.println(nome.getString("name"));
                        out.println("</a>");
                        out.println("<br>");
                        String sql = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                        ResultSet recensioni = manager.getData(sql, idris);
                        int c = 0;
                        int voto = 0;
                        while (recensioni.next()) {
                            c++;
                            voto += recensioni.getInt("global_value");
                        }
                        if (c > 0) {
                            out.print("Voto: ");
                            for (int k = voto / c; k > 0; k--) {
                                out.print("♥");
                            }
                            out.print(" su " + c + " Recensioni");
                        } else {
                            out.print("0 Recensioni");
                        }
                        out.println("<br>");
                        out.println("Cucina:");
                        String sql1 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                        ResultSet cuisine = manager.getData(sql1, idris);
                        cuisine.next();
                        out.print(cuisine.getString("name"));
                        while (cuisine.next()) {
                            out.print(", " + cuisine.getString("name"));
                        }
                        out.print("</center>");
                        out.print("<br>");
                        out.print("</div>");
                    } while (ristoranti.next());
                    out.println("</div>");
                }
                break;
            }
            case "gridRadios3": {//ORDINA PER PREZZO
                if (tipo.contains("zona")) { //da fare per bene
                    String sql = "SELECT R.id, PR.min_value, R.name FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC,mainagioia.Price_ranges as PR, mainagioia.Coordinates as C WHERE R.id_price_range=PR.id AND R.id = RC.id_restaurant AND RC.id_coordinate = C.id AND (C.city = ? OR C.province = ? OR C.state = ?) ORDER BY PR.min_value";
                    ristoranti = manager.getData(sql, search, search, search);

                } else if (tipo.contains("cucina")) {
                    String sql = "SELECT R.id, R.name, PR.min_value FROM mainagioia.Price_ranges as PR,mainagioia.Restaurants as R, mainagioia.Restaurant_cuisine as RC, mainagioia.Cuisines as C WHERE R.id = RC.id_restaurant AND R.id_price_range=PR.id AND RC.id_cousine = C.id AND C.name  = ? ORDER BY PR.min_value";
                    ristoranti = manager.getData(sql, search);
                } else if (tipo.contains("nome")) {
                    String sql = "SELECT R.id, R.name, PR.min_value FROM mainagioia.Restaurants as R,mainagioia.Price_ranges as PR WHERE R.name like ? AND R.id_price_range=PR.id ORDER BY PR.min_value";
                    ristoranti = manager.getData(sql, "%" + search + "%");
                } else {
                    String sql = ("SELECT R.id, R.name, PR.min_value FROM mainagioia.Restaurants as R, mainagioia.Price_ranges as PR, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.id = RC.id_restaurant AND R.id_price_range=PR.id AND RC.id_coordinate = C.id AND C.address like ? ORDER BY PR.min_value ");
                    ristoranti = manager.getData(sql, "%" + search + "%");
                }
                if (!ristoranti.next()) {
                    out.println("<div class=\"col-md-12 col-xs-12\" style = \"background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.3px solid;\">");
                    out.println("<center> <p style =\"color:red\">**NESSUN RISTORANTE TROVATO**</p> </center> </div>");

                } else {
                    int i = 0;
                    out.println("<div class=\"row\">");
                    do {
                        if(i%3 == 0)
                            out.println("</div><div class=\"row\">");
                        i++;
                        String sql11 = "SELECT name FROM Restaurants WHERE id = ?";
                        String idris = ristoranti.getString("id");
                        ResultSet nome = manager.getData(sql11, idris);
                        nome.next();
                        out.println("<div class=\"col-md-4 col-xs-4 btn-responsive\" id=\"Altezza\" style=\"background-color: white; opacity:0.9; border-radius: 30px; border: grey 0.5px solid;\">");
                        out.println("<br>");
                        out.println("<center>");
                        String sql10 = "SELECT path FROM Mainagioia.Photos WHERE id_restaurant = ?";
                        ResultSet foto = manager.getData(sql10, idris);
                        foto.next();
                        out.println("<img src='"+foto.getString("path")+"' width=\"90%\" style=\"border-radius: 30px\">");
         
                        out.println("<br>");
                        String url = "ristorante.jsp?id="+idris;
                        out.println("<a href="+ url + " style=\"font-size:18px; color: #5bc0de >");
                        out.println(nome.getString("name"));
                        out.println("</a>");
                        out.println("<br>");
                        String sql = "SELECT * FROM mainagioia.Reviews WHERE id_restaurant = ?";
                        ResultSet recensioni = manager.getData(sql, idris);
                        int c = 0;
                        int voto = 0;
                        while (recensioni.next()) {
                            c++;
                            voto += recensioni.getInt("global_value");
                        }
                        if (c > 0) {
                            out.print("Voto: ");
                            for (int k = voto / c; k > 0; k--) {
                                out.print("♥");
                            }
                            out.print(" su " + c + " Recensioni");
                        } else {
                            out.print("0 Recensioni");
                        }
                        out.println("<br>");
                        out.println("Cucina:");
                        String sql1 = "SELECT C.name FROM mainagioia.cuisines as C, (SELECT RC.id_cousine FROM restaurants as R, restaurant_cuisine as RC WHERE RC.id_restaurant = R.id AND R.id = ?)  as R WHERE C.id = R.id_cousine";
                        ResultSet cuisine = manager.getData(sql1, idris);
                        cuisine.next();
                        out.print(cuisine.getString("name"));
                        while (cuisine.next()) {
                            out.print(", " + cuisine.getString("name"));
                        }
                        out.print("</center>");
                        out.print("<br>");
                        out.print("</div>");
                    } while (ristoranti.next());
                    out.println("</div>");
                }
                break;
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
            Logger.getLogger(Ricerca.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Ricerca.class.getName()).log(Level.SEVERE, null, ex);
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
