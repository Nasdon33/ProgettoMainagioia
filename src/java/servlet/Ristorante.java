package servlet;

import db.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class Ristorante extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        ResultSet ristoranti;
        PrintWriter out = response.getWriter();
        
        //Bisogna gestire tutti i possibili filtri richiesti dall'utente
        
    
    }
}
