/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin_Controller;

import DAO.*;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig

/**
 *
 * @author DELL
 */
@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            response.setContentType("text/html;charset=UTF-8");
            request.setAttribute("title", request.getParameter("title"));
            request.setAttribute("action", request.getParameter("action"));

            String productID = (String) request.getParameter("productID");
            ProductDao pd = new ProductDao();
            Product product = pd.findProduct(productID);

            if (product == null) {
                System.out.println("Error find Product. Log in UpdateProductServlet.");
            } else {
                request.setAttribute("product", product);
                request.getRequestDispatcher("admin/admin_handle_product.jsp").forward(request, response);

            }
        } catch (Error ex) {
            System.out.println("err" + ex.getMessage());
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        try {
            processRequest(request, response);

            int idProduct = Integer.parseInt(request.getParameter("idProduct"));
            String nameProduct = (String) request.getParameter("nameProduct");
            double priceProduct = Double.parseDouble(request.getParameter("priceProduct"));
            int category = Integer.parseInt(request.getParameter("category"));
            Part part = request.getPart("imageProduct");

            String realPath = request.getServletContext().getRealPath("/product-image");
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

            part.write(realPath + "/" + fileName);

            ProductDao pd = new ProductDao();
            Product product = new Product(idProduct, nameProduct, priceProduct, fileName, category);
            if (pd.updateProduct(product)) {
                System.out.println("Update successfully!");
                response.sendRedirect("admin/admin.jsp");
            } else {
                System.out.println("Update unsucessfully!");
            }
        } catch (Error ex) {
            System.out.println("Err ++" + ex.getMessage());
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
