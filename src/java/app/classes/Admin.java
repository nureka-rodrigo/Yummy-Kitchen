package app.classes;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nureka Rodrigo
 */
public class Admin {

    static Connection con;

    public static int getUserCount() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT COUNT(User_Id) FROM User;";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        int userCount = 0;

        if (rs.next()) {
            userCount = Integer.parseInt(rs.getString(1));
        }

        return userCount;
    }

    public static int getRecipeCount() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT COUNT(Recipe_Id) FROM Recipe;";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        int recipeCount = 0;

        if (rs.next()) {
            recipeCount = Integer.parseInt(rs.getString(1));
        }

        return recipeCount;
    }

    public static int getFeedbackCount() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT COUNT(Feedback_Id) FROM Feedback;";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        int feedbackCount = 0;

        if (rs.next()) {
            feedbackCount = Integer.parseInt(rs.getString(1));
        }

        return feedbackCount;
    }

    public static ResultSet getGuestDetails() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT * FROM User, User_Details WHERE User.User_Id = User_Details.User_Id AND Role = ?;";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, "Guest");
        ResultSet rs = pstmt.executeQuery();

        return rs;
    }

    public static ResultSet getAdminDetails() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT * FROM User WHERE Role = ?;";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, "Admin");
        ResultSet rs = pstmt.executeQuery();

        return rs;
    }

    public static boolean addUser(String username, String password, String role) throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "INSERT INTO User(Username, Password, Role) VALUES(?, ?, ?);";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, role);
        int a = pstmt.executeUpdate();

        return (a > 0);
    }

    public static boolean deleteUser(String id) throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query1 = "DELETE FROM User_Details WHERE User_Id = ?;";
        PreparedStatement pstmt1 = con.prepareStatement(query1);
        pstmt1.setString(1, id);
        int a1 = pstmt1.executeUpdate();

        String query2 = "DELETE FROM User WHERE User_Id = ?;";
        PreparedStatement pstmt2 = con.prepareStatement(query2);
        pstmt2.setString(1, id);
        int a2 = pstmt2.executeUpdate();

        return (a1 > 0 || a2 > 0);
    }

    public static ResultSet getRecipeDetails() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT * FROM Recipe, category WHERE Recipe.Category_Id = Category.Category_Id;";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();

        return rs;
    }

    public static boolean deleteRecipe(String id) throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query1 = "SELECT Image FROM Recipe WHERE Recipe_Id = ?;";
        String query2 = "DELETE FROM Recipe WHERE Recipe_Id = ?;";
        int a = 0;
        PreparedStatement pstmt1 = con.prepareStatement(query1);
        pstmt1.setString(1, id);
        ResultSet rs = pstmt1.executeQuery();
        rs.next();
        String imageFileName = rs.getString("Image");
        String filePath = "C:\\Users\\Asus\\Documents\\NetBeansProjects\\Recipe Site\\web\\assets\\img\\" + imageFileName;

        File file = new File(filePath);

        if (file.exists()) {
            if (file.delete()) {
                PreparedStatement pstmt2 = con.prepareStatement(query2);
                pstmt2.setString(1, id);
                a = pstmt2.executeUpdate();
            }
        }
        return (a > 0);
    }

    public static ResultSet getFeedbackDetails() throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "SELECT * FROM Feedback;";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();

        return rs;
    }

    public static boolean deleteFeedback(String id) throws ClassNotFoundException, SQLException {
        con = DBConnector.getConnection();
        String query = "DELETE FROM Feedback WHERE Feedback_Id = ?;";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, id);
        int a = pstmt.executeUpdate();

        return (a > 0);
    }
}
