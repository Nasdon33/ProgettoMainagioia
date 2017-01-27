/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import db.DBManager;
import db.Utente;
import java.io.File;
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
import javax.servlet.http.Part;

/**
 *
 * @author brando
 */
public class Photos extends HttpServlet {

    DBManager manager;
    private static final String SAVE_DIR = "img" + File.separator;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Photos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Photos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
        
        String appPath = request.getServletContext().getRealPath("");
        
        
        String savePath = appPath + SAVE_DIR;
        

        
        File fileSaveDir = new File(savePath);

        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        HttpSession s = request.getSession();
        Utente u = (Utente) s.getAttribute("utente");
        System.out.println("ID LOG_IN "+u.getId());
        System.out.println("NOME "+u.getNome());
        System.out.println("ID RISTORANE "+request.getParameter("idris"));
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            
            
            fileName = new File(fileName).getName();
            part.write(savePath + fileName);

            String sqlget = "SELECT ID FROM mainagioia.photos ORDER BY ID DESC  fetch first 1 rows only";
            String sqlristo = "SELECT name FROM mainagioia.restaurants WHERE id=" + request.getParameter("idris");
            ResultSet ristorante;
            String id_rest_tmp=null;
            
            try {
                ristorante = manager.getData(sqlristo);
                ristorante.next();
                id_rest_tmp=ristorante.getString("name");
            } catch (SQLException ex) {
                Logger.getLogger(Photos.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet increment;
            String id_tmp = null;
            try {
                increment = manager.getData(sqlget);
                increment.next();
                id_tmp = increment.getString("id");
            } catch (SQLException ex) {
                Logger.getLogger(Photos.class.getName()).log(Level.SEVERE, null, ex);
            }

            String id = String.valueOf(1 + Integer.parseInt(id_tmp));
            String name = id_rest_tmp;
            String description = (String) request.getParameter("descrizione");
            String path = savePath + fileName;
            String id_rest = (String) request.getParameter("idris");
            String id_owner = u.getId();

            System.out.println("ID= "+id);
            System.out.println("NOME RISTO= "+name);
            System.out.println("DESCRIZIONE= "+description);
            System.out.println("PERCORSO= "+path);
            System.out.println("ID rISTO= "+id_rest);
            System.out.println("ID USER FOTO= "+id_owner);

            String sql = "INSERT INTO mainagioia.photos VALUES (?,?,?,?,?,?)";
            try {
                manager.setData(sql, id, name, description, path, id_rest, id_owner);
            } catch (Exception ex) {
                System.out.println("FOTO NON CARICATA");
            }
            
        }

        request.setAttribute("message", "Upload has been done successfully!");
        getServletContext().getRequestDispatcher("/index_nuovo.jsp").forward(
                request, response);

        
    }

    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
