<%-- 
    Document   : admin_dashboard
    Created on : Aug 3, 2023, 10:27:43 PM
    Author     : Nureka Rodrigo
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="app.classes.Admin"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Administrator</title>
        <link rel="icon" href="#" type="image/x-icon">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
        <script src="https://kit.fontawesome.com/79271f9696.js" crossorigin="anonymous"></script>
        <style>
            /* Hide scrollbar for Chrome, Safari and Opera */
            .modal-body::-webkit-scrollbar,
            body::-webkit-scrollbar {
                display: none;
            }

            /* Hide scrollbar for IE, Edge and Firefox */
            .modal-body,
            body {
                -ms-overflow-style: none;
                /* IE and Edge */
                scrollbar-width: none;
                /* Firefox */
            }
        </style>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark bg-dark accordion p-0" style="padding-bottom: 0px;">
                <div class="container-fluid d-flex flex-column p-0">
                    <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                        <div class="sidebar-brand-text mx-3">
                            <span>Admin Panel</span>
                        </div>
                    </a>
                    <hr class="sidebar-divider my-0">
                    <ul class="navbar-nav text-light" id="accordionSidebar">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="fas fa-tachometer-alt"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_users.jsp">
                                <i class="fas fa-user"></i>
                                <span>Users</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_recipes.jsp">
                                <i class="fa-solid fa-note-sticky"></i>
                                <span>Recipes</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_feedbacks.jsp">
                                <i class="fas fa-comment"></i>
                                <span>Feedbacks</span>
                            </a>
                        </li>
                    </ul>
                    <a class="btn btn-primary btn-md" role="button" data-bss-hover-animate="pulse" href="logout">Log Out</a>
                    <hr class="sidebar-divider my-2">
                    <div class="text-center d-none d-md-inline">
                        <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
                    </div>
                </div>
            </nav>
            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">
                    <nav class="navbar navbar-light navbar-expand-md bg-white shadow mb-4 py-3 static-top">
                        <div class="container-fluid">
                            <button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button">
                                <i class="fas fa-bars"></i>
                            </button>
                            <h4>Hello Admin!</h4>
                        </div>
                    </nav>
                    <div class="container-fluid">
                        <div class="d-sm-flex justify-content-between align-items-center mb-4">
                            <h3 class="text-dark mb-0">Dashboard</h3>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-start-primary py-2">
                                    <div class="card-body">
                                        <div class="row align-items-center no-gutters">
                                            <div class="col me-2">
                                                <div class="text-uppercase text-primary fw-bold text-xs mb-1">
                                                    <span>Total Users</span>
                                                </div>
                                                <div class="text-dark fw-bold h5 mb-0">
                                                    <%
                                                        try {
                                                    %>
                                                    <span><%=Admin.getUserCount()%></span>
                                                    <%
                                                        } catch (ClassNotFoundException e) {
                                                            out.print("Error: " + e.getMessage());
                                                        } catch (SQLException e) {
                                                            out.print("Error: " + e.getMessage());
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-users fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-start-primary py-2">
                                    <div class="card-body">
                                        <div class="row align-items-center no-gutters">
                                            <div class="col me-2">
                                                <div class="text-uppercase text-success fw-bold text-xs mb-1">
                                                    <span>Total Feedbacks</span>
                                                </div>
                                                <div class="text-dark fw-bold h5 mb-0">
                                                    <%
                                                        try {
                                                    %>
                                                    <span><%=Admin.getFeedbackCount()%></span>
                                                    <%
                                                        } catch (ClassNotFoundException e) {
                                                            out.print("Error: " + e.getMessage());
                                                        } catch (SQLException e) {
                                                            out.print("Error: " + e.getMessage());
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comment fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-start-primary py-2">
                                    <div class="card-body">
                                        <div class="row align-items-center no-gutters">
                                            <div class="col me-2">
                                                <div class="text-uppercase text-warning fw-bold text-xs mb-1">
                                                    <span>Total Recipes</span>
                                                </div>
                                                <div class="text-dark fw-bold h5 mb-0">
                                                    <%
                                                        try {
                                                    %>
                                                    <span><%=Admin.getRecipeCount()%></span>
                                                    <%
                                                        } catch (ClassNotFoundException e) {
                                                            out.print("Error: " + e.getMessage());
                                                        } catch (SQLException e) {
                                                            out.print("Error: " + e.getMessage());
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comment fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="bg-white sticky-footer">
                    <a class="border rounded d-inline scroll-to-top" href="#page-top">
                        <i class="fas fa-angle-up"></i>
                    </a>
                    <div class="container my-auto">
                        <div class="text-center my-auto copyright">
                            <span>Copyright © Yummy Kitchen 2023</span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <script src="assets/js/theme.js"></script>
            <a class="border rounded d-inline scroll-to-top" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>
    </body>
</html>
