package com.example.mycart.Servlet;

import com.example.mycart.DAO.CategoryDAO;
import com.example.mycart.DAO.ProductDAO;
import com.example.mycart.Entities.Category;
import com.example.mycart.Entities.Product;
import com.example.mycart.Helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "OperationServlet", value = "/OperationServlet")
public class OperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operation = request.getParameter("operation");

        if (operation.trim().equals("addCategory")) {

            String title = request.getParameter("catTitle");
            String description = request.getParameter("catDescription");

            Category category = new Category();
            category.setCategoryTitle(title);
            category.setCategoryDescription(description);

            CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getSessionFactory());
            categoryDAO.saveCategory(category);

            HttpSession session = request.getSession();
            session.setAttribute("message", "Category Added Successfully");
            response.sendRedirect("admin.jsp");

        } else if (operation.trim().equals("addProduct")) {

            String pTitle = request.getParameter("proTitle");
            String pDescription = request.getParameter("proDescription");
            int pPrice = Integer.parseInt(request.getParameter("proPrice"));
            int pDiscount = Integer.parseInt(request.getParameter("proDiscount"));
            int pQuantity = Integer.parseInt(request.getParameter("proQuantity"));
            int cId = Integer.parseInt(request.getParameter("catId"));
            Part part = request.getPart("proPic");

            Product product = new Product();
            product.setpName(pTitle);
            product.setpDesc(pDescription);
            product.setpPrice(pPrice);
            product.setpDiscount(pDiscount);
            product.setpQuantity(pQuantity);
            product.setpPhoto(part.getSubmittedFileName());

            CategoryDAO categoryDAO = new CategoryDAO(FactoryProvider.getSessionFactory());
            Category category = categoryDAO.getCategoryById(cId);

            product.setCategory(category);

            ProductDAO productDAO = new ProductDAO(FactoryProvider.getSessionFactory());
            productDAO.saveProduct(product);

            try {
                
                String path = request.getServletContext().getRealPath("Images") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                //System.out.println(path);
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();

                byte []data = new byte[is.available()];
                is.read(data,0,data.length);

                fos.write(data);
                fos.close();

            } catch (Exception e) {
                e.printStackTrace();
            }

            HttpSession session = request.getSession();
            session.setAttribute("message", "Product Added Successfully");
            response.sendRedirect("admin.jsp");

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

    }
}
