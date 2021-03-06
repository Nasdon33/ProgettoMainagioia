/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import db.DBManager;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brando
 */
public class Controller extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");

        response.setContentType("application/json");
        ArrayList<String> list = new ArrayList();
        String term = request.getParameter("term");
        String ric = request.getParameter("rad");
        String sql;
        if("zona".equals(ric)){
            sql = "SELECT DISTINCT city, province, state FROM mainagioia.coordinates WHERE UPPER(city) LIKE UPPER('"+term+"%"+"') OR UPPER(province) LIKE UPPER('"+term+"%"+"') OR UPPER(state) LIKE UPPER('"+term+"%"+"')";
            ResultSet rs;
            try{
                rs=manager.getData(sql);
                while (rs.next()) {
                String data1 = rs.getString("city");
                String data2 = rs.getString("province");
                String data3 = rs.getString("state");
                list.add(data1);
                list.add(data2);
                list.add(data3);
            }
            } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if("cucina".equals(ric)){
            sql = "SELECT name FROM mainagioia.cuisines WHERE UPPER(name) LIKE UPPER('"+term+"%"+"')";
            ResultSet rs;
            try{
                rs=manager.getData(sql);
                while (rs.next()) {
                String data = rs.getString("name");
                list.add(data);
            }
            } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if("nome".equals(ric)){
            sql = "SELECT * FROM mainagioia.restaurants WHERE UPPER(name)  LIKE UPPER('"+term+"%"+"')";
            ResultSet rs;
            try{
                rs=manager.getData(sql);
                while (rs.next()) {
                String data = rs.getString("name");
                list.add(data);
            }
            } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if("indirizzo".equals(ric)){
            sql = "SELECT address FROM mainagioia.coordinates WHERE UPPER(address) LIKE UPPER('"+term+"%"+"')";
            ResultSet rs;
            try{
                rs=manager.getData(sql);
                while (rs.next()) {
                String data = rs.getString("address");
                list.add(data);
            }
            } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{ 
            sql = "SELECT * FROM mainagioia.restaurants WHERE UPPER(name)  LIKE UPPER('"+term+"%"+"')";
            ResultSet rs;
            try{
                rs=manager.getData(sql);
                while (rs.next()) {
                String data = rs.getString("name");
                list.add(data);
            }
            } catch (SQLException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        ArrayList<String> list2 = new ArrayList<>(new LinkedHashSet<>(list));
        

        String searchList = new Gson().toJson(list2);
        
            System.out.println(searchList);
        
        response.getWriter().write(searchList);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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