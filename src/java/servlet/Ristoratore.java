package servlet;

import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
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
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
        String function = request.getParameter("function");
        
        switch(function){
            case "risposta":
            {
                //string sql ="INSERT id, description, date_creation,, ?,,? FROM REPLIES"
                //idrev = getParameter("id");
                //idown = getParameter("ido");
                //getData(sql,idseg, idrev, idown);
            };
            case "segnala":
            {
                // Invia notifica ad admin per controllo foto con id = getParameter("idphoto");
            };
            case "modifica":
            {
                //nam=getParameter("name")
                //des=getParameter("description")
                //web=getParameter("web_site_url")
                //string sql= "UPDATE name=? description=? web_site_url=?  from utenti where id=?"
                //id =getParameter("id");
                //getData(sql,nam, des, web, id);
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
