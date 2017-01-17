/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

public class DBManager implements Serializable {
    
    // transient == non viene serializzato
    private transient Connection con;
    public DBManager() {
 
        try {
            // load, and link the jdbc driver class
            Class.forName("org.apache.derby.jdbc.ClientDriver", true, getClass().getClassLoader());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private Connection getCon() throws Exception {
 
        con = DriverManager.getConnection("jdbc:derby://localhost:1527/Mainagioia","Mainagioia","Mainagioia");
        // urlForManipulatingDb,DbUsername, DbPassword);
        return con;
    }
    
    public DBManager(String dburl) throws SQLException {

        try {

            System.out.println("Ho creato la connessione\n");
            Class.forName("org.apache.derby.jdbc.ClientDriver", true, getClass().getClassLoader());

        } catch(Exception e) {
            throw new RuntimeException(e.toString(), e);
        }
        
        Connection con = DriverManager.getConnection(dburl);
        this.con = con;        
    }


    public static void shutdown() {
        try {
            DriverManager.getConnection("jdbc:derby://localhost:1527/Mainagioia;shutdown=true");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).info(ex.getMessage());
        }
    }
    
    /**
     * Ottiene la lista dei dati richiesti dal DB
     * 
     * @param param
     * @return
     * @throws SQLException 
     */
    
    public ResultSet getData(String... param) throws SQLException {
        PreparedStatement stm = con.prepareStatement(param[0]);
        for(int i=1; i<param.length; i++){
            stm.setString(i, param[i]);
            
        }
        ResultSet rs = stm.executeQuery();
        return rs;
    }
    
    /**
     *
     * @param param
     * @throws SQLException
     */
    public void setData(String... param) throws SQLException, Exception {
        PreparedStatement stm = getCon().prepareStatement(param[0]);
        for(int i=1; i<param.length;i++){
            stm.setString(i, param[i]);
            
        }
        stm.executeUpdate();
    }
}




