package com.salojava.servlet;

import com.salojava.dao.UserDao;
import com.salojava.salo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by PunoLee on 16/6/2.
 */
@WebServlet("/Register")
public class RegServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 5280356329609002908L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取用户名
        String email = request.getParameter("email");
        // 获取密码
        String password = request.getParameter("password");
        // 实例化UserDao对象
        UserDao userDao = new UserDao();
        if (email != null && !email.isEmpty()) {
            if (userDao.userIsExist(email)) {
                // 实例化一个User对象
                User user = new User();
                // 对用户对象中的属性赋值

                user.setUPassword(password);
                user.setUMail(email);
                // 保存用户注册信息
                userDao.saveUser(user);
                request.setAttribute("info", "sign up successfully！<br>");
            } else {
                request.setAttribute("info", "This user already exists！");
            }
        }
        // 转发到message.jsp页面
        request.getRequestDispatcher("WEB-INF/jsp/message.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}