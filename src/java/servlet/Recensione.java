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
public class Recensione extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        PrintWriter out = response.getWriter();
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
        out.println("</table>");
        

    }    
}
