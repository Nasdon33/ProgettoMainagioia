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
import java.sql.ResultSet;
import java.sql.SQLException;
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
            throws ServletException, IOException, SQLException {
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        String email = request.getParameter("email");
        String sql = "SELECT * FROM Mainagioia.Users WHERE email = ?";
        ResultSet rs;
        HttpSession sess = request.getSession();
        Utente user;
        if(email != null){
            user = new Utente();
            rs = manager.getData(sql, email);
            rs.next();
            user.setId(rs.getString("ID"));
            user.setNome(rs.getString("name"));
            user.setCognome(rs.getString("surname"));
            user.setEmail(email);
        } else {
            user = null;
        }
        sess.setAttribute("utente", user);
        response.sendRedirect(request.getHeader("Referer"));
    
        String function = request.getParameter("function");
        
        switch(function){
            case "recensione":
            {
                //val=getParameter("global_value")
                //foo=getParameter("food")
                //ser=getParameter("service")
                //vfm=getParameter("value_for_money")
                //atm=getParameter("atmosphere")
                //dat=getDate()
                //nam=getParameter("name")
                //des=getParameter("description")
                //idr=getParameter("id_restaurant")
                //idc=getParameter("id_creator")
                //if (getParameter("photo")!=null)
                //  idp=addphototoserver("photo");
                //string sql= "INSERT global_value=? food=? service=?
                //  value_for_money=? atmosphere=? name=? description=?
                //  date_creation=? id_restaurant=? id_creator=? id_photo=? 
                //  from REVIEWS where id_restaurant=?"
                //getData(sql, val, foo, ser, vfm, atm, dat, nam, des, idr, idc, idp, idr);
            };
            case "nuovo_ristorante":
            {
                //nam=getParameter("name")
                //des=getParameter("description")
                //web=getParameter("web_site_url")
                //DA AGGIORNARE
                //if (getParameter("photo")!=null)
                //  idp=addphototoserver("photo");
                //string sql= "INSERT global_value=? food=? service=?
                //  value_for_money=? atmosphere=? name=? description=?
                //  date_creation=? id_restaurant=? id_creator=? id_photo=? 
                //  from REVIEWS where id_restaurant=?"
                //getData(sql, val, foo, ser, vfm, atm, dat, nam, des, idr, idc, idp, idr);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
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
            processRequest(request, response);
        } catch (SQLException ex) {
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