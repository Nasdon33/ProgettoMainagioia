package servlet;

import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author carlo.toniatti-2
 */
public class Ristorante extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        String sqlget = "SELECT ID FROM mainagioia.Restaurants ORDER BY ID DESC  fetch first 1 rows only";
        
        ResultSet increment = manager.getData(sqlget);
        increment.next();
        String ris = String.valueOf(1 + Integer.parseInt(increment.getString("id")));
            String nam = request.getParameter("name");
            String des = request.getParameter("description");
            String web;
            if(request.getParameter("web_site_url") == null)
                web = null;
            else
                web = request.getParameter("web_site_url");

            String id = request.getParameter("id");

            String owner = request.getParameter("owner");
            if("0".equals(owner))
                owner = null;
            else{
                owner = id;
                String sql = "UPDATE Users SET Ruolo='owner' WHERE id = ?";
                manager.setData(sql,id);
            }

            String price = request.getParameter("price");   
            String sql3 = "INSERT INTO Restaurants(id, name, description, web_site_url"
                    + "id_owner, id_creator, id_price_range) VALUES (?,?,?,?,?,?,?)";

            manager.setData(sql3, ris, nam, des, web, owner, id, price);
        String sql4id = "SELECT ID FROM mainagioia.Coordinates ORDER BY ID DESC  fetch first 1 rows only";
        
        ResultSet increment2 = manager.getData(sql4id);
        increment2.next();
            String coo = String.valueOf(1 + Integer.parseInt(increment2.getString("id")));
            String address = request.getParameter("address");
            String cap = request.getParameter("cap");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            String state = request.getParameter("state");
            String[] coord = Coordinate.getLatLongPositions(address+", "+cap+" "+ city+" "+province+" "+state); // <- FUNZIONE che traduce un indirizzo in coordinate?

            String sql4 = "INSERT INTO Coordinates(id, latitude, longitude, address, cap, city, province, state VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
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
                String sqlapid = "SELECT ID FROM mainagioia.Coordinates ORDER BY ID DESC  fetch first 1 rows only";
                ResultSet increment3 = manager.getData(sqlapid);
                increment3.next();
                int c = 0;
                if(request.getParameter(giorno+"0") != null){
                    c++;
                    String orap = request.getParameter("orap"+giorno+"0");
                    String orch = request.getParameter("orch"+giorno+"0");
                    String ido = String.valueOf(1 + Integer.parseInt(increment3.getString("id")));
                    String sql7 = "INSERT INTO Opening_hours_ranges(id, day_of_the_week, start_hour, end_hour) VALUES(?,?,?,?)";
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
        
            Photos foto=new Photos();
    
    }
}
