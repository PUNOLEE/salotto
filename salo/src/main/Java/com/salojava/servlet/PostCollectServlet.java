package com.salojava.servlet;

import com.salojava.dao.ConnectDB;
import com.salojava.dao.PostDao;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by Ashe on 16/6/19.
 */
@WebServlet("/PCollect")

public class PostCollectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        int pid = Integer.parseInt(request.getParameter("postid"));
        int uid = Integer.parseInt(request.getParameter("userID"));
        int yes = Integer.parseInt(request.getParameter("Yes"));
        PostDao postDao = new PostDao();
        if (yes == 1) {
            postDao.collectPost(pid, uid);
        } else {
            postDao.deCollectPost(pid, uid);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("option", yes);
        response.setContentType("application/json");
        response.getWriter().write(jsonObject.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
