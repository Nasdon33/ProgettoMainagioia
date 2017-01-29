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
import java.text.SimpleDateFormat;
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
public class Risposte extends HttpServlet {
    DBManager manager;
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
        processRequest(request, response);
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
            String sqlget = "SELECT ID FROM mainagioia.Replies ORDER BY ID DESC  fetch first 1 rows only";

            ResultSet increment = manager.getData(sqlget);
            increment.next();
            String id = String.valueOf(1 + Integer.parseInt(increment.getString("id")));
            String dat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
            String des = request.getParameter("description");
            String idr = request.getParameter("id_review");
            String ido = request.getParameter("id_owner");
            String sql= "INSERT INTO mainagioia.Replies(ID,description,date_creation,date_validation,id_review,id_validator,id_owner) VALUES(?,?,?,null,?,null,?)";
            manager.setData(sql, id, des, dat, idr, ido);

            response.sendRedirect("index_nuovo.jsp");
        } catch (SQLException ex) {
                response.sendRedirect(request.getHeader("referer"));
                Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                response.sendRedirect(request.getHeader("referer"));
                Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
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
