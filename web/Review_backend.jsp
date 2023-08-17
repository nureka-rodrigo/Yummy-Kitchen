<%-- 
    Document   : Review_backend.jsp
    Created on : Aug 8, 2023, 10:01:12 PM
    Author     : Smart Touch PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<%@page import="app.classes.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="app.classes.MD5"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Backend </title>
    </head>
    <body>
         <%
//            String Uname = request.getParameter("Uname");
//            String Email = request.getParameter("Email");
//            String comment = request.getParameter("comment");
//            
//
//            if (Uname.isEmpty() || Email.isEmpty() || comment.isEmpty() ) {
//                response.sendRedirect("Review.jsp");
//               
//
//                } else {
//                
//                Connection con = DBConnector.getConnection();
//                String query = "INSERT INTO review(id,Uname,Email,comment) VALUES(LAST_INSERT_ID(),?,?,?,?) ";
//                PreparedStatement pstmt1 = con.prepareStatement(query);
//                pstmt1.setString(1, Uname);
//                pstmt1.setString(2, Email);
//                pstmt1.setString(3, comment);
//                
      %>        

<%
String Uname = request.getParameter("Uname");
String Email = request.getParameter("Email");
String comment = request.getParameter("comment");
try {
 Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_recipe", "root", "root");
 Statement st = conn.createStatement();
 int i = st.executeUpdate("insert into review(id,Uname,Email,comment)values('" + Uname + "','" + Email
 + "','" + comment + "')");
 
 out.println("Thank you for register ! to continue.");
} catch (Exception e) {
 System.out.print(e);
 e.printStackTrace();
}
            }
        %>
    </body>
</html>
