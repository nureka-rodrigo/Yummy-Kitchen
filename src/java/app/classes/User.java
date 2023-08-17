/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.sql.*;

/**
 *
 * @author TUF
 */
public class User {

    public ResultSet getFirstFiveRecipes() throws ClassNotFoundException, SQLException {
        Connection con = DBConnector.getConnection();
        String sql = "SELECT * FROM recipe LIMIT 5";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }

    public ResultSet getAllRecipes() throws ClassNotFoundException, SQLException {
        Connection con = DBConnector.getConnection();
        String sql = "SELECT * FROM recipe";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }

    public ResultSet searchRecipes(String recipe_name) throws ClassNotFoundException, SQLException {
        Connection con = DBConnector.getConnection();
        String sql = "SELECT * FROM recipe WHERE Title LIKE CONCAT('%',?,'%')";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, recipe_name);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }

    public ResultSet viewRecipes(String r_name) throws ClassNotFoundException, SQLException {
        Connection con = DBConnector.getConnection();
        String sql = "SELECT * FROM recipe WHERE Title=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, r_name);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }
    
    public static ResultSet getCategory() throws ClassNotFoundException, SQLException {
        Connection con = DBConnector.getConnection();
        String sql = "SELECT * FROM Category";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        return rs;
    }

    public static boolean addRecipe(String title, String categoryId, String description, String servingSize, String prepTime, String ingredients, String instructions, String imageFileName) throws ClassNotFoundException, SQLException {
        Connection con = DBConnector.getConnection();
        String query = "INSERT INTO Recipe(Title, Category_Id, Description, Serving_Size, Prep_Time, Ingredients, Instructions, Image) VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, title);
        pstmt.setString(2, categoryId);
        pstmt.setString(3, description);
        pstmt.setString(4, servingSize);
        pstmt.setString(5, prepTime);
        pstmt.setString(6, ingredients);
        pstmt.setString(7, instructions);
        pstmt.setString(8, imageFileName);
        int a = pstmt.executeUpdate();

        return (a > 0);
    }
}
