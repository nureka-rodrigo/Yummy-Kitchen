<%-- 
    Document   : contact-us_backend
    Created on : Aug 9, 2023, 8:07:00 PM
    Author     : Navaneethan
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");

            String query = "INSERT INTO feedback(name, email, subject, message) VALUES(?, ?, ?, ?)";
            Connection con = DBConnector.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, subject);
            pstmt.setString(4, message);
            int a = pstmt.executeUpdate();

            if (a > 0) {
                response.sendRedirect("contact-us.jsp");
            } else {
        %>
        <h3>Error Occurred</h3>
        <%
            }
        %>
    </body>
</html>
