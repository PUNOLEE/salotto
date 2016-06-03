package com.salojava.servlet;

import com.salojava.dao.UserDao;
import com.salojava.salo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by PunoLee on 16/6/3.
 */
@WebServlet( "/Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        String password = request.getParameter("password");

        UserDao userDao = new UserDao();

        User user = userDao.login(email, password);

        if(user != null){

            request.getSession().setAttribute("user", user);
            request.setAttribute("info", "Log in successfully!");
            request.getRequestDispatcher("WEB-INF/jsp/message2.jsp").forward(request, response);
        }else{

            request.setAttribute("info", "Incorrect username or password");
            request.getRequestDispatcher("WEB-INF/jsp/message2.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
