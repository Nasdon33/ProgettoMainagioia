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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            throws ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
        String function = request.getParameter("function");
        
        switch(function){
            case "segnalazione":
            {
                ResultSet segnalazioni;
                String sql ="SELECT id, path FROM PHOTOS WHERE id=?";
                String idseg = request.getParameter("id");
                segnalazioni = manager.getData(sql,idseg);
                out.println("<table>");
                out.println("<tr> <td> Foto </td> </tr>");
                while(segnalazioni.next()){
                    out.println("<tr><td>"+segnalazioni.getString("path") +"</td></tr>");
                    // Inserire modo per visualizzare la foto
                }
                out.println("</table>");
                break;
            }
            
            case "fotono":
            {
                String sql = "DELETE * FROM PHOTOS WHERE id_photo = ?";
                String id_photo = request.getParameter("id");
                manager.setData(sql, id_photo);
                //invia a utente messaggio che l'admin ha controllato la foto e ha decretato non sia ok
                break;
            }
            
            case "fotook":
            {
                //invia a utente messaggio che l'admin ha controllato la foto e ha decretato sia ok
            }
            
            case "risposta":
            {
                ResultSet risposte;
                String sql="SELECT rv.global_value as gv, rv.name as name, rv.description as desrev, rp.description as desrep FROM rp as Replies, rv as Reviews WHERE ID_VALIDATOR = 0";
                risposte = manager.getData(sql);
                out.println("<table>");
                out.println("<tr> <td> Voto Recensione </td> <td> Titolo Recensione </td> <td> Descrizione </td> <td> Risposta Ristoratore </td> </tr>");
                while(risposte.next()){
                    out.println("<tr><td>"+risposte.getString("gv")+"</td><td>"+risposte.getString("name")+"</td><td>"+risposte.getString("desrev")+"</td><td>"+risposte.getString("desrep")+"</td></tr>");
                }
                out.println("</table>");
                break;
            }
            case "convalidarisposta":
            {
                String sql = "UPDATE ID_VALIDATOR FROM Replies Where ID_OWNER=?";
                String idowner = request.getParameter("id");
                manager.setData(sql, idowner);
                break;
            }
            case "ristoratore":
            {
                String sql = "UPDATE RUOLO=2 from utenti where id = ?";
                String id = request.getParameter("id");
                manager.setData(sql, id);
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
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
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
