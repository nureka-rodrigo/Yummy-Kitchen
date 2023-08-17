<%-- 
    Document   : admin_users
    Created on : Aug 3, 2023, 10:31:38 PM
    Author     : Nureka Rodrigo
--%>

<%@page import="app.classes.MD5"%>
<%@page import="java.sql.SQLException"%>
<%@page import="app.classes.Admin"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (request.getParameter("status") != null) {
        if (request.getParameter("status").equals("1")) {
%>
<script>
    window.alert("Password and Repeat Password does not match!");
</script>
<%
} else if (request.getParameter("status").equals("2")) {
%>
<script>
    window.alert("Record added successfully!");
</script>
<%
} else if (request.getParameter("status").equals("3")) {
%>
<script>
    window.alert("An error occurred!");
</script>
<%
} else if (request.getParameter("status").equals("4")) {
%>
<script>
    window.alert("Record deleted successfully!");
</script>
<%
} else if (request.getParameter("status").equals("5")) {
%>
<script>
    window.alert("An error occurred!");
</script>
<%
        }
    }

    if (request.getParameter("adminAddUser") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwordRepeat = request.getParameter("passwordRepeat");
        String role = "Admin";

        try {
            if (password.equals(passwordRepeat)) {
                password = MD5.getMd5(password);
                if (Admin.addUser(username, password, role)) {
                    response.sendRedirect("admin_users.jsp?status=2");
                } else {
                    response.sendRedirect("admin_users.jsp?status=3");
                }
            } else {
                response.sendRedirect("admin_users.jsp?status=1");
            }
        } catch (ClassNotFoundException e) {
            out.print("Error: " + e.getMessage());
        } catch (SQLException e) {
            out.print("Error: " + e.getMessage());
        }
    }

    if ((request.getParameter("target") != null) && (request.getParameter("action") != null) && (request.getParameter("id") != null)) {
        String id = request.getParameter("id");

        if (request.getParameter("target").equals("user")) {
            if (request.getParameter("action").equals("delete")) {
                try {
                    if (Admin.deleteUser(id)) {
                        response.sendRedirect("admin_users.jsp?status=4");
                    } else {
                        response.sendRedirect("admin_users.jsp?status=5");
                    }
                } catch (ClassNotFoundException e) {
                    out.print("Error: " + e.getMessage());
                } catch (SQLException e) {
                    out.print("Error: " + e.getMessage());
                }
            }
        }
    }
%>
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
                    <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="admin_dashboard.jsp">
                        <div class="sidebar-brand-text mx-3">
                            <span>Admin Panel</span>
                        </div>
                    </a>
                    <hr class="sidebar-divider my-0">
                    <ul class="navbar-nav text-light" id="accordionSidebar">
                        <li class="nav-item">
                            <a class="nav-link" href="admin_dashboard.jsp">
                                <i class="fas fa-tachometer-alt"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
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
                    <!-- Modal -->
                    <form action="#" method="POST">
                        <div class="modal fade" id="addNewUser" tabindex="-1" aria-labelledby="addNewUserLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title h3" id="addNewUserLabel">Add User</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div id="modal-body" class="modal-body bg-dark text-light">
                                        <div class="form-outline form-white h5">
                                            <label class="form-label h5" for="username">Username</label>
                                            <br />
                                            <input type="text" class="form-control" id="username" name="username" required />
                                            <br />
                                            <label class="form-label h5" for="password">Password</label>
                                            <br />
                                            <input type="password" class="form-control" id="pass" name="password" required />
                                            <br />
                                            <label class="form-label h5" for="password">Confirm Password</label>
                                            <br />
                                            <input type="password" class="form-control" id="passRepeat" name="passwordRepeat" required />
                                            <br />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn bg-dark text-light" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" name="adminAddUser">Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Guest Account Details</h3>
                        <div class="card shadow">
                            <div class="card-body">
                                <form action="" method="POST">
                                    <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                        <table class="table my-0" id="dataTable">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <b>#</b>
                                                    </th>
                                                    <th>Username</th>
                                                    <th>First Name</th>
                                                    <th>Last Name</th>
                                                    <th>Telephone</th>
                                                    <th>Email</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    try {
                                                        ResultSet rs = Admin.getGuestDetails();
                                                        int i = 0;
                                                        while (rs.next()) {
                                                            i++;
                                                %>
                                                <tr>
                                                    <td><%=i%></td>

                                                    <td><%=rs.getString("Username")%></td>
                                                    <td><%=rs.getString("Fname")%></td>
                                                    <td><%=rs.getString("Lname")%></td>
                                                    <td><%=rs.getString("Tel")%></td>
                                                    <td><%=rs.getString("Email")%></td>
                                                    <td>
                                                        <a type="button" class="btn btn-danger" href="admin_users.jsp?target=user&action=delete&id=<%=rs.getString("User_Id")%>" name="delete">Delete</a>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                    if (i < 1) {
                                                %>
                                                <tr>
                                                    <td colspan="6">No data found</td>
                                                </tr>
                                                <%
                                                        }
                                                    } catch (ClassNotFoundException e) {
                                                        out.print("Error: " + e.getMessage());
                                                    } catch (SQLException e) {
                                                        out.print("Error: " + e.getMessage());
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-md-6 align-self-center">
                                        <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite"> Showing 1 to 10 of 10 </p>
                                    </div>
                                    <div class="col-md-6">
                                        <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link" aria-label="Previous" href="#">
                                                        <span aria-hidden="true">«</span>
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link active" href="#"> 1 </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#"> 2 </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link" aria-label="Next" href="#">
                                                        <span aria-hidden="true">»</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Admin Account Details</h3>
                    <!-- Button trigger modal -->
                    <button class="btn btn-primary btn-md" type="submit" data-bs-toggle="modal" data-bs-target="#addNewUser" style="float: right;">Add New User</button>
                    <br></br>
                    <div class="card shadow">
                        <div class="card-body">
                            <form action="" method="POST">
                                <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                    <table class="table my-0" id="dataTable">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <b>#</b>
                                                </th>
                                                <th>Username</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {
                                                    ResultSet rs = Admin.getAdminDetails();
                                                    int i = 0;
                                                    while (rs.next()) {
                                                        i++;
                                            %>
                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=rs.getString("Username")%></td>
                                                <td>
                                                    <a type="button" class="btn btn-danger" href="admin_users.jsp?target=user&action=delete&id=<%=rs.getString("User_Id")%>" name="delete">Delete</a>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                                if (i < 1) {
                                            %>
                                            <tr>
                                                <td colspan="6">No data found</td>
                                            </tr>
                                            <%
                                                    }
                                                } catch (ClassNotFoundException e) {
                                                    out.print("Error: " + e.getMessage());
                                                } catch (SQLException e) {
                                                    out.print("Error: " + e.getMessage());
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite"> Showing 1 to 10 of 10 </p>
                                </div>
                                <div class="col-md-6">
                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Previous" href="#">
                                                    <span aria-hidden="true">«</span>
                                                </a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link active" href="#"> 1 </a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#"> 2 </a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next" href="cater_staff_foods.php?page=
                                                   <?php echo $page + 1; ?>">
                                                    <span aria-hidden="true">»</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
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
    </body>
</html>
