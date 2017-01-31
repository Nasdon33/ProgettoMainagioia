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
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brando
 */
public class sendPass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws javax.mail.MessagingException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String esito = "true";
        String email = request.getParameter("email");
        DBManager manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
        String sql = "SELECT * FROM mainagioia.Users WHERE email = ?";
        ResultSet utente = null;
        try {
            utente = manager.getData(sql, email);
        } catch (SQLException ex) {
            System.out.println("PROBLEMI QUERY UTENTE");
        }

        try {
            if (utente.next()) {

                String smtpHost = "smtp.gmail.com";
                
                String sender = "localhost";
                String recipient = email;
                String content = "Ecco la sua password: '" + utente.getString("password") + "'";
                String subject = "Password dimenticata";

                Properties props = System.getProperties();
                // -- Attaching to default Session, or we could start a new one --
                props.put("mail.transport.protocol", "smtp");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", smtpHost);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
                Authenticator auth = new SMTPAuthenticator();
                Session session = Session.getInstance(props, auth);
                // -- Create a new message --
                Message msg = new MimeMessage(session);
                // -- Set the FROM and TO fields --
                msg.setFrom(new InternetAddress(sender));
                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
                msg.setSubject(subject);
                msg.setText(content);
                // -- Set some other header information --
                msg.setHeader("MyMail", "Mr. XYZ");
                msg.setSentDate(new Date());
                // -- Send the message --
                Transport.send(msg);
                System.out.println("Message sent to " + email + " OK.");
                

                
            } else {
               esito="false";
            }
        } catch (SQLException ex) {
            esito="errore";
        }
        out.print(esito);
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
        } catch (MessagingException ex) {
            Logger.getLogger(sendPass.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(sendPass.class.getName()).log(Level.SEVERE, null, ex);
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
    }

    private class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            String username = "birrabi93@gmail.com";           // specify your email id here (sender's email id)
            String password = "maverick93";                                      // specify your password here
            return new PasswordAuthentication(username, password);
        }
    }

}
