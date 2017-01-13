package servlet;

import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
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
public class Ristoratore extends User{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
        String function = request.getParameter("function");
        
        switch(function){
            case "risposta":
            {
                String sql = "INSERT id, description, date_creation,, ?,,? FROM REPLIES";
                String idrev = request.getParameter("id");
                String idown = request.getParameter("ido");
                manager.setData(sql, idrev, idown);
                break;
            }
            case "segnala":
            {
                // Invia notifica ad admin per controllo foto con id = getParameter("idphoto");
                break;
            }
            case "modifica":
            {
                String nam = null, des = null, web = null, sql, id;
                boolean p1, p2, p3;
                id = request.getParameter("id");
                
                if(request.getParameter("name") != null){
                    nam = request.getParameter("name");
                    p1 = true;
                }
                else
                    p1 = false;
                
                if(request.getParameter("description") != null){
                    des = request.getParameter("description");
                    p2 = true;
                }
                else
                    p2 = false;
                
                if(request.getParameter("web_site_url") != null){
                    web = request.getParameter("web_site_url");
                    p3 = true;
                }
                else
                    p3 = false;
                
                if(p1 == true){
                    if(p2 == true){
                        if(p3 == true){
                            sql= "UPDATE Restaurants SET name=? description=? web_site_url=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                        else{
                            sql= "UPDATE Restaurants SET name=? description=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                    }
                    else{
                        if(p3 == true){
                            sql= "UPDATE Restaurants SET name=? web_site_url=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                        else{
                            sql= "UPDATE Restaurants SET name=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                    }
                }
                else{
                    if(p2 == true){
                        if(p3 == true){
                            sql= "UPDATE Restaurants SET description=? web_site_url=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                        else{
                            sql= "UPDATE Restaurants SET description=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                    }
                    else{
                        if(p3 == true){
                            sql= "UPDATE Restaurants SET web_site_url=? where id=?";
                            manager.setData(sql, nam, des, web, id);
                        }
                    }
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
            Logger.getLogger(Ristoratore.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Ristoratore.class.getName()).log(Level.SEVERE, null, ex);
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
