/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;
import java.sql.*;

/**
 *
 * @author CST20052
 */
public class DBConnector {
    public static final String URL = "jdbc:mysql://localhost:3306/db_recipe";
    public static final String Driver = "com.mysql.jdbc.Driver";
    public static final String Username = "testuser";
    public static final String Password = "testuser";
    static Connection con;
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName(Driver);
        con = DriverManager.getConnection(URL, Username, Password);
        return con;
    }
}
