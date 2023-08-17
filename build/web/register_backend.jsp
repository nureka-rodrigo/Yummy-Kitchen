<%-- 
    Document   : register_backend
    Created on : Aug 3, 2023, 11:34:11 PM
    Author     : Sithija
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"  %> 
<%@page import="app.classes.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="app.classes.MD5"  %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Backend</title>
    </head>
    <body>
        <%
            String Fname = request.getParameter("Fname");
            String Lname = request.getParameter("Lname");
            String Username = request.getParameter("Username");
            String Email = request.getParameter("Email");
            int Tel = Integer.parseInt(request.getParameter("Tel"));
            String Password = MD5.getMd5(request.getParameter("Password"));
            String VPassword = MD5.getMd5(request.getParameter("VPassword"));
            String Role = "Guest";

            if (Password != null && Password.equals(VPassword)) {
                String query = "INSERT INTO user(Username,Password,Role) VALUES(?,?,?) ";
                Connection con = DBConnector.getConnection();
                PreparedStatement pstmt = con.prepareStatement(query);

                pstmt.setString(1, Username);
                pstmt.setString(2, Password);
                pstmt.setString(3, Role);

                int a = pstmt.executeUpdate();

                String query1 = "INSERT INTO user_details(User_ID,Fname,Lname,Email,Tel) VALUES(LAST_INSERT_ID(),?,?,?,?) ";
                PreparedStatement pstmt1 = con.prepareStatement(query1);
                pstmt1.setString(1, Fname);
                pstmt1.setString(2, Lname);
                pstmt1.setString(3, Email);
                pstmt1.setInt(4, Tel);

                int b = pstmt1.executeUpdate();

                if (a > 0 && b > 0) {
                    response.sendRedirect("signin.jsp");
                }
            } else {
                response.sendRedirect("register.jsp");
            }
        %>
    </body>
</html>
