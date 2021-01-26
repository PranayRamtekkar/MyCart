package com.example.mycart.Servlet;

import com.example.mycart.DAO.UserDAO;
import com.example.mycart.Entities.User;
import com.example.mycart.Helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO(FactoryProvider.getSessionFactory());
        User user = userDAO.getUser(email,password);

        HttpSession httpSession = request.getSession();

        if (user == null) {
            httpSession.setAttribute("message", "Invalid User Details !!! ");
            response.sendRedirect("login.jsp");
        } else {
            //httpSession.setAttribute("message", "Welcome " +user.getUserName()+ " !!! ");
            httpSession.setAttribute("currentUser",user);

            if(user.getUserType().equals("admin")) {
                response.sendRedirect("admin.jsp");
            } else if(user.getUserType().equals("normal")) {
                response.sendRedirect("normal.jsp");
            } else {
                out.println("We have not identified user type");
            }
        }

    }

}
