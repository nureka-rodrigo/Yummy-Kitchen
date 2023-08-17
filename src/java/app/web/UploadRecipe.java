/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.web;

import app.classes.User;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Asus
 */
@MultipartConfig
public class UploadRecipe extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String categoryId = request.getParameter("category");
        String description = request.getParameter("description");
        String servingSize = request.getParameter("serving_size");
        String prepTime = request.getParameter("prep_time");
        String ingredients = request.getParameter("ingredients");
        String instructions = request.getParameter("instructions");
        Part file = request.getPart("image");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = "C:\\Users\\Asus\\Documents\\NetBeansProjects\\Recipe Site\\web\\assets\\img\\" + imageFileName;
        String fileExtension = "";

        if (imageFileName.lastIndexOf(".") != -1 && imageFileName.lastIndexOf(".") != 0) {
            fileExtension = imageFileName.substring(imageFileName.lastIndexOf(".") + 1);
        }

        if (fileExtension.equalsIgnoreCase("jpg") || fileExtension.equalsIgnoreCase("jpeg") || fileExtension.equalsIgnoreCase("png") || fileExtension.equalsIgnoreCase("webp")) {
            try {
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();

            } catch (IOException e) {
                e.getMessage();
            }

            try {
                if (User.addRecipe(title, categoryId, description, servingSize, prepTime, ingredients, instructions, imageFileName)) {
                    response.sendRedirect("upload_recipe.jsp?status=1");
                } else {
                    response.sendRedirect("upload_recipe.jsp?status=2");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.getMessage();
            }
        } else {
            response.sendRedirect("upload_recipe.jsp?status=3");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
