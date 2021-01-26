package com.example.mycart.Servlet;

import com.example.mycart.Entities.User;
import com.example.mycart.Helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset-UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");

                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");

                Session session = FactoryProvider.getSessionFactory().openSession();
                Transaction transaction = session.beginTransaction();

                int userId = (int) session.save(user);

                transaction.commit();
                session.close();

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registration Successful !!! ");
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
