package com.salojava.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by PunoLee on 16/5/31.
 */
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       DateFormat dateformat =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String currenttime=dateformat.format(new Date());
       request.setAttribute("currenttime",currenttime);
       request.getRequestDispatcher("/WEB-INF/jsp/hello.jsp").forward(request,response);
    }
}
