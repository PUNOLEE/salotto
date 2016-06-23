package com.salojava.servlet;

import com.salojava.dao.PostDao;
import com.salojava.salo.Post;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Ashe on 16/6/23.
 */
@WebServlet("/BDePost")

public class PostDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postID=Integer.valueOf(request.getParameter("postid"));
        System.out.println("POSTID"+postID);

        PostDao postDao=new PostDao();
        int i=postDao.deletePost(postID);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg","success");
        System.out.println(jsonObject);
        response.setContentType("application/json");
        response.getWriter().write(jsonObject.toString());
        System.out.println(i);
    }
}
