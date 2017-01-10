package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor
 */

/**
 *
 * @author carlo.toniatti-2
 */


import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Admin", urlPatterns = {"/Admin"})
public class Admin extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
        String function = request.getParameter("function");
        
        switch(function){
            case "segnalazione":
            {
                //string sql ="SELECT id, path FROM PHOTOS WHERE id=?";
                //string idseg = request.getParameter("id");
                //manager.getData(sql,idseg);
            };
            case "risposta":
            {
                //string sql="SELECT rp.description, rv.ALL FROM rp as Replies, rv as Reviews WHERE ID_VALIDATOR= 0";
                //manager.getData(sql);
            };
            case "convalidarisposta":
            {
                //string sql = "UPDATE ID_VALIDATOR FROM Replies Where ID_OWNER=?";
                //string idowner = request.getParameter("id");
                //manager.setData(sql,id);
            };
            case "ristoratore":
            {
                //string sql = "UPDATE RUOLO=2 from utenti";
                //manager.setData(sql);
            };
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
