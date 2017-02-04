package servlet;

import db.DBManager;
import db.Utente;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author carlo.toniatti-2
 */
@MultipartConfig
public class Ristorante extends HttpServlet {
    DBManager manager;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        
    
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
            manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
            String id = request.getParameter("id");
            String sql = "SELECT R.NAME, R.DESCRIPTION, R.WEB_SITE_URL, C.address, C.CAP, C.city, C.province, C.state, R.ID_price_range FROM mainagioia.Restaurants as R, mainagioia.Restaurant_coordinate as RC, mainagioia.Coordinates as C WHERE R.ID = ? AND R.ID = RC.ID_restaurant AND RC.id_coordinate = C.id";
            ResultSet ristorante = manager.getData(sql, id);
            ristorante.next();
            String nome = request.getParameter("nome");
            int general = 0;
            if(nome == null){
                nome = ristorante.getString("name");
                general++;
            }
            String description = request.getParameter("description");
            if(description == null){
                description = ristorante.getString("description");
                general++;
            }
            String web_site_url = request.getParameter("web_site_url");
            if(web_site_url == null){
                web_site_url = ristorante.getString("web_site_url");
                general++;
            }
            String price = request.getParameter("price");
            if(price == null){
                price = ristorante.getString("id_price_range");
                general++;
            }
            String address = request.getParameter("address");
            int coordinate = 0;
            if(address == null){
                address = ristorante.getString("address");
                coordinate++;
            }
            String cap = request.getParameter("CAP");
            if(cap == null){
                cap = ristorante.getString("CAP");
                coordinate++;
            }
            String city = request.getParameter("city");
            if(city == null){
                city = ristorante.getString("city");
                coordinate++;
            }
            String province = request.getParameter("province");
            if(province == null){
                province = ristorante.getString("province");
                coordinate++;
            }
            String state = request.getParameter("state");
            if(state == null){
                state = ristorante.getString("state");
                coordinate++;
            }
            String cucine [] = request.getParameterValues("cucine[]");
            Boolean cuc = true;
            if(cucine == null){
                cuc = false;
            }
            String giorni [] = request.getParameterValues("giorni[]");
            String orari [] = request.getParameterValues("orari[]");
            Boolean gioora = true;
            if(giorni == null){
                gioora = false;
            }
            
            if(general != 4){
                String sql1 = "UPDATE Restaurants SET name = ?, description = ?, web_site_url = ?, id_price_range = ? WHERE id = ?";
                manager.setData(sql1, nome, description, web_site_url, price, id);
            }
            if(coordinate != 5){
                String sql4id = "SELECT ID FROM mainagioia.Coordinates ORDER BY ID DESC  fetch first 1 rows only";
                ResultSet increment = manager.getData(sql4id);
                increment.next();
                String coo = String.valueOf(1 + Integer.parseInt(increment.getString("id")));
                String[] coord = Coordinate.getLatLongPositions(address+", "+cap+" "+ city+" "+province+" "+state); // <- FUNZIONE che traduce un indirizzo in coordinate
                String sql4 = "INSERT INTO Coordinates(id, latitude, longitude, address, cap, city, province, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
                manager.setData(sql4, coo, coord[0], coord[1], address, cap, city, province, state);
                String sql5 ="UPDATE Restaurant_Coordinate SET id_coordinate = ? WHERE id_restaurant = ?";
                manager.setData(sql5, coo, id);
            }
        
            if (cuc == true){
                String sql3 = "DELETE FROM Restaurant_Cuisine WHERE id_restaurant = ?";
                manager.setData(sql3, id);
                for(int i = 0; i < cucine.length; i++){
                    String sql2 ="SELECT id FROM Cuisines WHERE name = ?";
                    ResultSet cucina = manager.getData(sql2, cucine[i]);
                    cucina.next();
                    String sql6 ="INSERT INTO Restaurant_Cuisine(id_restaurant, id_cousine) VALUES (?, ?)";
                    manager.setData(sql6, id, cucina.getString("id"));
                }
            }
            
            if(gioora == true){
                String sql4 = "DELETE FROM mainagioia.opening_hours_range_restaurant WHERE id_restaurant = ?";
                manager.setData(sql4, id);
                for(int i = 0; i < giorni.length; i++){
                    String day;
                    String eora;
                    String sora;
                    switch(giorni[i]){
                    case "lun0":
                    {
                        day = "1";
                        sora = orari[0];
                        eora = orari[1];
                        break;
                    }
                    case "lun1":
                    {
                        day = "1";
                        sora = orari[1];
                        eora = orari[2];
                        break;
                    }
                    case "mar0":
                    {
                        day = "2";
                        sora = orari[3];
                        eora = orari[4];
                        break;
                    }
                    case "mar1":
                    {
                        day = "2";
                        sora = orari[5];
                        eora = orari[6];
                        break;
                    }
                    case "mer0":
                    {
                        day = "3";
                        sora = orari[7];
                        eora = orari[8];
                        break;
                    }
                    case "mer1":
                    {
                        day = "3";
                        sora = orari[9];
                        eora = orari[10];
                        break;
                    }
                    case "gio0":
                    {
                        day = "4";
                        sora = orari[11];
                        eora = orari[12];
                        break;
                    }
                    case "gio1":
                    {
                        day = "4";
                        sora = orari[13];
                        eora = orari[14];
                        break;
                    }
                    case "ven0":
                    {
                        day = "5";
                        sora = orari[15];
                        eora = orari[16];
                        break;
                    }
                    case "ven1":
                    {
                        day = "5";
                        sora = orari[17];
                        eora = orari[18];
                        break;
                    }
                    case "sab0":
                    {
                        day = "6";
                        sora = orari[19];
                        eora = orari[20];
                        break;
                    }
                    case "sab1":
                    {
                        day = "6";
                        sora = orari[21];
                        eora = orari[22];
                        break;
                    }
                    case "dom0":
                    {
                        day = "7";
                        sora = orari[23];
                        eora = orari[24];
                        break;
                    }
                    case "dom1":
                    {
                        day = "7";
                        sora = orari[25];
                        eora = orari[26];
                        break;
                    }
                    default:
                    {
                        day = "0";
                        sora = null;
                        eora = null;
                    }
                    }
                    System.out.println(day+" "+sora+" "+eora);
                    String sql7 = "SELECT id FROM Opening_hours_ranges WHERE day_of_the_week = ? AND start_hour = ? AND end_hour = ?";
                    ResultSet idor = manager.getData(sql7, day, sora, eora);
                    idor.next();
                    String sql8 = "INSERT INTO Opening_hours_range_Restaurant(id_restaurant, id_opening_hours_range) VALUES(?,?)";
                    manager.setData(sql8, id, idor.getString("id"));
                }
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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
            manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        String sqlget = "SELECT ID FROM mainagioia.Restaurants ORDER BY ID DESC  fetch first 1 rows only";
        
        ResultSet increment = manager.getData(sqlget);
        increment.next();
        String ris = String.valueOf(1 + Integer.parseInt(increment.getString("id")));
            String nam = (String) request.getParameter("nome");
            String des = request.getParameter("description");
            String web;
            if(request.getParameter("web_site_url") == null)
                web = null;
            else
                web = request.getParameter("web_site_url");
            HttpSession s = request.getSession();
            Utente u = (Utente) s.getAttribute("utente");
            String id = u.getId();

            String owner = request.getParameter("owner");
            if("0".equals(owner))
                owner = null;
            else{
                owner = id;
                String sql = "UPDATE Users SET Ruolo='owner' WHERE id = ?";
                manager.setData(sql,id);
            }

            String price = request.getParameter("prezzo");   
            String sql3 = "INSERT INTO Restaurants(id, name, description, web_site_url,"
                    + "id_owner, id_creator, id_price_range) VALUES (?,?,?,?,?,?,?)";

            manager.setData(sql3, ris, nam, des, web, owner, id, price);
        String sql4id = "SELECT ID FROM mainagioia.Coordinates ORDER BY ID DESC  fetch first 1 rows only";
        
        ResultSet increment2 = manager.getData(sql4id);
        increment2.next();
            String coo = String.valueOf(1 + Integer.parseInt(increment2.getString("id")));
            String address = request.getParameter("address1");
            String cap = request.getParameter("address2");
            String city = request.getParameter("address3");
            String province = request.getParameter("address4");
            String state = request.getParameter("address5");
            String[] coord = Coordinate.getLatLongPositions(address+", "+cap+" "+ city+" "+province+" "+state); // <- FUNZIONE che traduce un indirizzo in coordinate?

            String sql4 = "INSERT INTO Coordinates(id, latitude, longitude, address, cap, city, province, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
            manager.setData(sql4, coo, coord[0], coord[1], address, cap, city, province, state);
         
            String sql5 ="INSERT INTO Restaurant_Coordinate(id_restaurant, id_coordinate) VALUES (?, ?)";
            manager.setData(sql5, ris, coo);
            
            String sql2 ="SELECT * FROM Cuisines";
            ResultSet cucina = manager.getData(sql2);
            while(cucina.next()){
                if(request.getParameter(cucina.getString("name")) != null){
                    String sql6 ="INSERT INTO Restaurant_Cuisine(id_restaurant, id_cousine) VALUES (?, ?)";
                    manager.setData(sql6, ris, cucina.getString("id"));
                }
                
            }
            
            for(int i=1; i<=7;i++){
                String giorno;
                switch(i){
                    case 1:
                    {
                        giorno = "lun";
                        break;
                    }
                    case 2:
                    {
                        giorno = "mar";
                        break;
                    }
                    case 3:
                    {
                        giorno = "mer";
                        break;
                    }
                    case 4:
                    {
                        giorno = "gio";
                        break;
                    }
                    case 5:
                    {
                        giorno = "ven";
                        break;
                    }
                    case 6:
                    {
                        giorno = "sab";
                        break;
                    }
                    case 7:
                    {
                        giorno = "dom";
                        break;
                    }
                    default:
                    {
                        giorno = null;
                    }
                }
                String gio;
                gio = String.valueOf(i);
                String sqlapid = "SELECT ID FROM mainagioia.opening_hours_ranges ORDER BY ID DESC  fetch first 1 rows only";
                ResultSet increment3 = manager.getData(sqlapid);
                increment3.next();
                int c = 0;
                if(request.getParameter(giorno+"0") != null){
                    c++;
                    String orap = request.getParameter("orap"+giorno+"0");
                    String orch = request.getParameter("orch"+giorno+"0");
                    String ido = String.valueOf(1 + Integer.parseInt(increment3.getString("id")));
                    String sql7 = "INSERT INTO Opening_hours_ranges(id, day_of_the_week, start_hour, end_hour) VALUES(?,?,?,?)";
                    System.out.println(orap);
                    manager.setData(sql7, ido, gio, orap+":00", orch+":00");
                    String sql8 = "INSERT INTO Opening_hours_range_Restaurant(id_restaurant, id_opening_hours_range) VALUES(?,?)";
                    manager.setData(sql8, ris, ido);
                }
                if(request.getParameter(giorno+"1") != null){
                    String orap = request.getParameter("orap"+giorno+"1");
                    String orch = request.getParameter("orch"+giorno+"1");
                    String ido = String.valueOf(1 + c + Integer.parseInt(increment3.getString("id")));
                    String sql7 = "INSERT INTO Opening_hours_ranges(id, day_of_the_week, start_hour, end_hour) VALUES(?,?,?,?)";
                    manager.setData(sql7, ido, gio, orap+":00", orch+":00");
                    String sql8 = "INSERT INTO Opening_hours_range_Restaurant(id_restaurant, id_opening_hours_range) VALUES(?,?)";
                    manager.setData(sql8, ris, ido);
                }
                
            }
            
            Part foto = request.getPart("file");
            request.setAttribute("idris", ris);
            request.setAttribute("descrizione", "Principale");
            request.setAttribute("file", foto);
            RequestDispatcher rd = request.getRequestDispatcher("Photos");
            rd.forward(request,response);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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

    private String[] Array(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}