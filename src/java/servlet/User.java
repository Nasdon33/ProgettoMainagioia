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
import java.awt.Point;
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
            throws ServletException, IOException, SQLException, Exception {
        DBManager manager = (DBManager)super.getServletContext().getAttribute("dbmanager");
        String email = request.getParameter("email");
        String sql1 = "SELECT * FROM Mainagioia.Users WHERE email = ?";
        ResultSet rs;
        HttpSession sess = request.getSession();
        Utente user;
        if(email != null){
            user = new Utente();
            rs = manager.getData(sql1, email);
            rs.next();
            user.setId(rs.getString("ID"));
            user.setNome(rs.getString("name"));
            user.setNickname(rs.getString("nickname"));
            user.setCognome(rs.getString("surname"));
            user.setEmail(email);
            if(user.getPassword() == request.getParameter("password"))
                System.out.println("Password Corretta");
            else
                System.out.println("Non funzia");
        } else {
            user = null;
            
        }
        sess.setAttribute("utente", user);
        response.sendRedirect(request.getHeader("Referer"));
    
        String function = request.getParameter("function");
        
        switch(function){
            case "recensione":
            {
                String val = request.getParameter("global_value");
                String foo = request.getParameter("food");
                String ser = request.getParameter("service");
                String vfm = request.getParameter("value_for_money");
                String atm = request.getParameter("atmosphere");
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                String dat = df.format(date);
                String nam = request.getParameter("name");
                String des = request.getParameter("description");
                String idr = request.getParameter("id_restaurant");
                String idc = request.getParameter("id_creator");
                String idp = null;
                if (request.getParameter("photo")!=null){
                    //Salva la foto da qualche parte e manda URL in idp
                }
                String sql2= "INSERT global_value = ? food = ? service = ? "
                        + "value_for_money = ? atmosphere = ? name = ? description = ?"
                        + "date_creation = ? id_restaurant = ? id_creator = ? id_photo = ?"
                        + "from REVIEWS where id_restaurant = ?";
                manager.getData(sql2, val, foo, ser, vfm, atm, dat, nam, des, idr, idc, idp, idr);
                
                break;
            }
            case "nuovo_ristorante":
            {
                String ris = null; //Nuovo id per database
                String nam = request.getParameter("name");
                String des = request.getParameter("description");
                String web;
                if(request.getParameter("web_site_url") == null)
                    web = null;
                else
                    web = request.getParameter("web_site_url");
                
                String id = null; //id = utente che inserisce ristorante
                
                String owner;
                if(request.getParameter("owner") == null)
                    owner = null;
                else{
                    owner = id;
                    //avvia servlet per upgradare utente a ristoratore
                }
                
                String price = request.getParameter("price");   
                String sql3 = "INSERT INTO Restaurants(id, name, description, web_site_url"
                        + "id_owner, id_creator, id_price_range) VALUES (?,?,?,?,?,?,?)";
                
                manager.setData(sql3, ris, nam, des, web, owner, id, price);
                
                String address = request.getParameter("address");
                String[] coord = Coordinate.getLatLongPositions(address); // <- FUNZIONE che traduce un indirizzo in coordinate?
                
                String sql4 = "INSERT INTO Restaurant_Coordinate VALUES (?,(?,?))"; 
                manager.setData(sql4, ris, coord[0], coord[1]); //bisognerebbe passarla come coppia di valori ma non so bene come fare
                break;
            }
            case "segnala":
            {
                // Invia notifica ad admin per controllo foto con id = getParameter("idphoto");
                break;
            }
            case "modificaprofilo":
            {
                String n = null;
                String s = null;
                String nick = null;
                String mail = null;
                String id, sql5;
                boolean p1, p2, p3, p4;
                id = request.getParameter("id");
                
                if(request.getParameter("name") != null){
                    n = request.getParameter("name");
                    p1 = true;
                }
                else
                    p1 = false;
                
                if(request.getParameter("surname") != null){
                    s = request.getParameter("surname");
                    p2 = true;
                }
                else
                    p2 = false;
                
                if(request.getParameter("nickname") != null){
                    n = request.getParameter("nickname");
                    p3 = true;
                }
                else
                    p3 = false;
                
                if(request.getParameter("email") != null){
                    mail = request.getParameter("email");
                    p4 = true;
                }
                else
                    p4 = false;
                
                if(p1 == true){
                    if(p2 == true){
                        if(p3 == true){
                            if(p4 == true){
                                sql5= "UPDATE Users SET name = ? surname = ? nickname = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET name = ? surname = ? nickname = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                        }
                        else{
                            if(p4 == true){
                                sql5= "UPDATE Users SET name = ? surname = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET name = ? surname = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }   
                        }
                    }
                    else{
                        if(p3 == true){
                            if(p4 == true){
                                sql5= "UPDATE Users SET name = ? nickname = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET name = ? nickname = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                        }
                        else{
                            if(p4 == true){
                                sql5= "UPDATE Users SET name = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET name = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }   
                        }
                    }
                }
                else{
                    if(p2 == true){
                        if(p3 == true){
                            if(p4 == true){
                                sql5= "UPDATE Users SET surname = ? nickname = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET surname = ? nickname = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                        }
                        else{
                            if(p4 == true){
                                sql5= "UPDATE Users SET surname = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET surname = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }   
                        }
                    }
                    else{
                        if(p3 == true){
                            if(p4 == true){
                                sql5= "UPDATE Users SET nickname = ? email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                            else{
                                sql5= "UPDATE Users SET nickname = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            }
                        }
                        else{
                            if(p4 == true){
                                sql5= "UPDATE Users SET email = ? where id = ?";
                                manager.setData(sql5, n, s, nick, mail, id);
                            } 
                        }
                    }
                }
                      
                break;
            }
            case "modificapassword":
            {
                String nuovamail = request.getParameter(email);
                String id = request.getParameter("id");
                String sql6 = "UPDATE Users SET password = ? where id = ?";
                manager.setData(sql6, nuovamail, id);
                //notifica via mail
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
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
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
        } catch (Exception ex) {
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