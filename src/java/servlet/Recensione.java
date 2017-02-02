package servlet;

import db.DBManager;
import db.Utente;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author carlo.toniatti-2
 */
public class Recensione extends HttpServlet {
    DBManager manager;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        
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
        manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        HttpSession ses = request.getSession();
        Utente utente;
        utente = (Utente)ses.getAttribute("utente");
        String id_user = utente.getId();
        String id_review = request.getParameter("idr");
        String id_creator = request.getParameter("id");
        String like = request.getParameter("val");
        String dat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
        String sql = "INSERT INTO mainagioia.user_review_likes(id_user, id_review, id_creator, like_type, date_creation) VALUES(?,?,?,?,?) ";
        manager.setData(sql,id_user, id_review, id_creator, like, dat);
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
            manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        String sqlget = "SELECT ID FROM mainagioia.Reviews ORDER BY ID DESC  fetch first 1 rows only";
        
        ResultSet increment = manager.getData(sqlget);
        increment.next();
                
                String id = String.valueOf(1 + Integer.parseInt(increment.getString("id")));
                String val = request.getParameter("total");
                String foo = request.getParameter("food");
                String ser = request.getParameter("service");
                String vfm = request.getParameter("value_for_money");
                String atm = request.getParameter("atmosphere");
                String dat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
                String nam = request.getParameter("name");
                String des = request.getParameter("description");
                String idr = request.getParameter("id_restaurant");
                String idc = request.getParameter("id_creator");
                System.out.print(id+ val+ foo+ ser+ vfm+ atm+ nam+ des+ dat+ idr+ idc);
                String sql2= "INSERT INTO mainagioia.Reviews(ID,global_value, food, service, value_for_money, atmosphere, name,description,date_creation,id_restaurant,id_creator,id_photo) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, null)";
                manager.setData(sql2, id, val, foo, ser, vfm, atm, nam, des, dat, idr, idc);
        
                response.sendRedirect("index_nuovo.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
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

    private void alert(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



    
}
