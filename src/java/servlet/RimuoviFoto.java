package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.DBManager;
import db.Utente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlo
 */
public class RimuoviFoto extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RimuoviFoto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RimuoviFoto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        HttpSession ses = request.getSession();
        Utente utente;
        utente = (Utente)ses.getAttribute("utente");
        if("accetta".equals(request.getParameter("choice")) ){
            String idr = request.getParameter("idr");
            String acc = "true";
            String dv = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
            String idv = utente.getId();
            String sql = "UPDATE Replies SET date_validation = ?, id_validator = ?, accepted = ? WHERE id = ?";
            manager.setData(sql,dv,idv, acc,idr);
        }
        else{
            String idr = request.getParameter("idr");
            String acc = "false";
            String dv = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
            String idv = utente.getId();
            String sql = "UPDATE Replies SET date_validation = ?, id_validator = ?, accepted = ? WHERE id = ?";
            manager.setData(sql,dv,idv, acc,idr);
        }
        response.sendRedirect(request.getHeader("referer"));
        } catch (SQLException ex) {
            response.sendRedirect("argh_page.jsp");
            Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            response.sendRedirect("argh_page.jsp");
            Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
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
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        if("elimina".equals(request.getParameter("choice")) ){
            String idp = request.getParameter("idp");
            String res = "true";
            String dat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
            String sql = "UPDATE Warning SET result = ?, date_validation = ?, id_photo = ? WHERE id_photo = ?";
            manager.setData(sql,res,dat, "null",idp);
            String sql2 = "DELETE FROM Photos WHERE id = ?";
            manager.setData(sql2,idp);
        }
        else{
            String idp = request.getParameter("idp");
            String res = "false";
            String dat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
            String sql = "UPDATE Warning SET result = ?, date_validation = ? WHERE id_photo = ?";
            manager.setData(sql,res,dat,idp);
        }
        response.sendRedirect(request.getHeader("referer"));
        } catch (SQLException ex) {
            response.sendRedirect("argh_page.jsp");
            Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            response.sendRedirect("argh_page.jsp");
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
