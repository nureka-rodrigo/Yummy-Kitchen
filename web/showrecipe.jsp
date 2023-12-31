<%-- 
    Document   : showrecipe
    Created on : Aug 2, 2023, 3:48:31 PM
    Author     : TUF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.DBConnector" %>
<%@page import="app.classes.User" %>
<%@page import="java.sql.*" %>
<%
    String r_name = request.getParameter("r-name");

    User user = new User();
    ResultSet rs = user.viewRecipes(r_name);
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>viewrecipe</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/viewrecipe.css">
    </head>

    <body>
        <div id="nab-bar"><!-- Start: Navbar Right Links (Dark) -->
            <nav class="navbar navbar-expand-md bg-dark py-3" data-bs-theme="dark"
                 style="background: linear-gradient(88deg, rgb(11, 36, 71), rgb(165, 215, 232));">
                <div class="container"><a class="navbar-brand d-flex align-items-center" href="#"><span><img
                                src="assets/img/logo-no-background.png" style="width: 5rem;height: 3rem;"></span></a><button
                        data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-5"
                        style="background: rgb(11, 36, 71);"><span class="visually-hidden">Toggle navigation</span><span
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navcol-5">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="recipe.jsp">Recipes</a></li>
                            <li class="nav-item"><a class="nav-link" href="upload_recipe.jsp">Upload Recipe</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Contact Us</a></li>
                        </ul><a class="btn btn-primary ms-md-2 btn1" role="button" href="signin.jsp" style="border-style: none;">Login</a>
                    </div>
                </div>
            </nav><!-- End: Navbar Right Links (Dark) -->
        </div>
        <div id="recipe-area" style="text-align: center;"><!-- Start: Masonry gallery cards responsive -->
            <div style="padding: 25px;text-align: center;"><!-- Start: cards -->
                <div class="row" data-masonry="{&quot;percentPosition&quot;: true }" style="text-align: center;">
                    <!-- Start: card-1 -->
                    <%
                        while (rs.next()) {
                    %>
                    <div class="col-sm-6 col-lg-4 mb-4" style="text-align: center;"><!-- Start: card -->
                        <div class="card">
                            <picture type="" srcset=""><img class="card-img-top p-3" src="assets/img/<% out.print(rs.getString("Image"));  %>" alt=""
                                                            style="border-radius: 24px;object-fit: cover;width: 50%;"></picture><!-- Start: texto -->
                            <div class="card-body" style="text-align: center;">
                                <h1 class="card-title" style="padding-bottom: 30px"><% out.print(rs.getString("Title"));  %></h1>
                                <p style="text-align: center;"><strong>Description :</strong><br> <% out.print(rs.getString("Description"));  %></p>
                                <p style="text-align: center;"><strong>Serving Size :</strong><br> <% out.print(rs.getString("Serving_Size"));  %></p>
                                <p style="text-align: center;"><strong>Preparing Time :</strong><br> <% out.print(rs.getString("Prep_Time"));  %> min</p>
                                <p style="text-align: center;"><strong>Ingredients :</strong><br> <% out.print(rs.getString("Ingredients"));  %></p>
                                <p style="text-align: center;"><strong>Instructions :</strong><br> <% out.print(rs.getString("Instructions"));  %></p>
                                <a class="btn btn-primary ms-md-2 btn1" role="button"
                                   href="index.jsp" style="border-style: none;">Back to Home</a>
                            </div><!-- End: texto -->
                        </div><!-- End: card -->
                    </div><!-- End: card-1 -->
                    <%
                        }
                    %>
                </div><!-- End: cards -->
                <script async="" src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"
                        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D"
                crossorigin="anonymous"></script>
            </div><!-- End: Masonry gallery cards responsive -->
        </div>
        <div id="footer"><!-- Start: Footer Dark -->
            <footer class="text-center bg-dark"
                    style="background: linear-gradient(90deg, rgb(11, 36, 71), rgb(165, 215, 232));">
                <div class="container text-white py-4 py-lg-5">
                    <ul class="list-inline">
                        <li class="list-inline-item me-4"><a class="link-light footer-link" href="#"
                                                             style="color: rgb(217,245,255);">Yummy Kitchen</a></li>
                        <li class="list-inline-item me-4"><a class="link-light footer-link" href="#"
                                                             style="color: rgb(217,245,255);">yammykitchen@gmail.com</a></li>
                        <li class="list-inline-item"><a class="link-light footer-link" href="#"
                                                        style="color: rgb(217,245,255);">+94912254666</a></li>
                    </ul>
                    <ul class="list-inline">
                        <li class="list-inline-item me-4"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                               fill="currentColor" viewBox="0 0 16 16" class="bi bi-facebook text-light">
                            <path
                                d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z">
                            </path>
                            </svg></li>
                        <li class="list-inline-item me-4"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                               fill="currentColor" viewBox="0 0 16 16" class="bi bi-twitter text-light">
                            <path
                                d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z">
                            </path>
                            </svg></li>
                        <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                                          fill="currentColor" viewBox="0 0 16 16" class="bi bi-instagram text-light">
                            <path
                                d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z">
                            </path>
                            </svg></li>
                    </ul>
                    <p class="text-muted mb-0" style="color: var(--bs-body-bg);">Copyright © 2023</p>
                </div>
            </footer><!-- End: Footer Dark -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
