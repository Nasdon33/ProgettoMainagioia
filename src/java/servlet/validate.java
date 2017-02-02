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

public class validate extends HttpServlet {

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
            DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");

        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email +" "+ password);
        String sql;
        ResultSet rs = null;
        sql = "SELECT * FROM Mainagioia.Users WHERE email = ? AND password = ?";
        rs = manager.getData(sql, email, password);
        if (rs.next() && rs.getString("email").equals(email) && rs.getString("password").equals(password)) {
            HttpSession sess = request.getSession();
            if (sess.getAttribute("utente") == null) {
                System.out.println("uei");
                Utente user = new Utente();
                user.setId(rs.getString("ID"));
                user.setNome(rs.getString("name"));
                user.setNickname(rs.getString("nickname"));
                user.setCognome(rs.getString("surname"));
                user.setEmail(email);
                user.setPassword(rs.getString("password"));
                user.setRuolo(rs.getString("ruolo"));
                sess.setAttribute("utente", user);
                String risposta = "OK";
                System.out.println(risposta);
                out.write(risposta);

            }
            System.out.println("cos?");
        } else {
            String risposta = "NOTFOUND";
            System.out.println(email);
            System.out.println(password);
            System.out.println(risposta);
            out.write(risposta);
        }
        } catch (SQLException ex) {
            Logger.getLogger(validate.class.getName()).log(Level.SEVERE, null, ex);
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
            DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");

        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email +" "+ password);
        String sql;
        ResultSet rs = null;
        sql = "SELECT * FROM Mainagioia.Users WHERE email = ? AND password = ?";
        rs = manager.getData(sql, email, password);
        if (rs.next() && rs.getString("email").equals(email) && rs.getString("password").equals(password)) {
            
                String risposta = "OK";
                System.out.println(risposta);
                out.write(risposta);
        } else {
            String risposta = "NOTFOUND";
            System.out.println(email);
            System.out.println(password);
            System.out.println(risposta);
            out.write(risposta);
        }
        } catch (SQLException ex) {
            Logger.getLogger(validate.class.getName()).log(Level.SEVERE, null, ex);
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