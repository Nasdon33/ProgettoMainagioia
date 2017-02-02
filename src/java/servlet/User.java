/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import db.DBManager;
import db.Utente;
import java.io.IOException;
import java.io.PrintWriter;
import java.awt.Point;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Francesco
 */
public class User extends HttpServlet {
    DBManager manager;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
       try {
            manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        String email = request.getParameter("email");
        String sql1 = "SELECT * FROM Mainagioia.Users WHERE email = ?";
        ResultSet rs;
        HttpSession sess = request.getSession();
        Utente user;
        if(email != null){
            user = new Utente();
            rs = manager.getData(sql1, email);
            rs.next();
            user.setId(rs.getString("ID"));
            user.setNome(rs.getString("name"));
            user.setNickname(rs.getString("nickname"));
            user.setCognome(rs.getString("surname"));
            user.setEmail(email);
            user.setPassword(rs.getString("password"));
            user.setRuolo(rs.getString("ruolo"));
        } else {
            user = null;
            
        }
        sess.setAttribute("utente", user);
        
        response.sendRedirect(request.getHeader("Referer"));
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request,response);
            
            
            
            
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
                HttpSession sess = request.getSession();
                Utente utente = (Utente) sess.getAttribute("utente");;
                String id = utente.getId();
                String password = request.getParameter("password");
                String mail = request.getParameter("email");
                String nick = request.getParameter("nickname");
                String sql= "UPDATE Users SET nickname = ? email = ? password = ? where id = ?";
                manager.setData(sql, nick, mail, password,  id);
                
            response.sendRedirect(request.getHeader("Referer"));
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

}