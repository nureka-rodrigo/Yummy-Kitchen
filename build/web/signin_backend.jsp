<%-- 
    Document   : signin_backend.jsp
    Created on : Aug 4, 2023, 1:39:22 AM
    Author     : Sithija
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
        <title>Signin</title>
    </head>
    <body>
        <%
            String Username = request.getParameter("Username");
            String Password = MD5.getMd5(request.getParameter("Password"));

            String query = "SELECT * FROM user WHERE Username=? and Password=?";
            Connection con = DBConnector.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, Username);
            pstmt.setString(2, Password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String valueToCheck = "Admin";

                PreparedStatement preparedStatement = con.prepareStatement("SELECT Role FROM user WHERE Role = ?");
                preparedStatement.setString(1, valueToCheck);

                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    response.sendRedirect("admin_dashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                session.setAttribute("status", "Login failed!! Please check your username or password..");
                response.sendRedirect("signin.jsp");
            }
        %>
    </body>
</html>
