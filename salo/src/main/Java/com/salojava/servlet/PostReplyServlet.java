package com.salojava.servlet;
        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;
        import com.salojava.dao.PostDao;
        import com.salojava.salo.PostReply;
        import com.salojava.salo.User;
        import org.json.JSONObject;
        import javax.servlet.http.*;
        import java.io.*;

/**
 * Created by Ashe on 16/6/8.
 */

@WebServlet("/BNewReply")
public class PostReplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        //此处不新建session，只是去取已经创建的session
        HttpSession session = request.getSession(false);
        //如果session能够取到，说明用户已经登录
        if(session!=null)
        {
            System.out.println(request.getParameter("replyContent"));
            PostReply postReply=new PostReply();
            postReply.setPRContent(request.getParameter("replyContent"));
            postReply.setPID(Integer.valueOf(request.getParameter("postid")));
            postReply.setUID(Integer.valueOf(request.getParameter("userID")));
            PostDao postDao=new PostDao();
            int count=postDao.insertReply(postReply);
               JSONObject jsonObject = new JSONObject();
                jsonObject.put("msg","success");
                System.out.println(jsonObject);
                response.setContentType("application/json");
                response.getWriter().write(jsonObject.toString());
        }
        //否则，说明用户没有登录，跳转到登录页面让用户登录
        else
        {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}