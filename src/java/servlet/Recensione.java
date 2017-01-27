package servlet;

import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        /*PrintWriter out = response.getWriter();
        String function = request.getParameter("function");
        ResultSet recensioni;
        
        String sql = ("SELECT * FROM Reviews WHERE ID_RESTAURANT  = ?");
        String id_rest = request.getParameter("id");
        recensioni = manager.getData(sql, id_rest);
        
        out.println("<table>");
        out.println("<tr> <td> Titolo </td> <td> Descrizione Recensione </td> <td> Voto Generale </td> <td> Voto Cibo </td> <td> Voto Servizio </td> <td> Voto Qualità/Prezzo </td> <td> Voto Atmosfera </td> </tr>");
        while(recensioni.next()){
            out.println("<tr><td>"+recensioni.getString("Name")+"</td><td>"+recensioni.getString("Description")+"</td><td>"+recensioni.getInt("GLOBAL VALUE") +"</td><td>"+recensioni.getInt("FOOD")+"</td><td>"+recensioni.getInt("SERVICE")+"</td><td>"+recensioni.getInt("VALUE_FOR_MONEY")+"</td><td>"+recensioni.getInt("ATMOSPHERE")+"</td></tr>");
            }
        out.println("</table>");*/
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
            Logger.getLogger(Registrazione.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
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
            processRequest(request, response);
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



    
}
