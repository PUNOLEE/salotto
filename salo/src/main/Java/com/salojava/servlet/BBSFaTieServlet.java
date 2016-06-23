package com.salojava.servlet;
        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;
        import com.salojava.dao.PostDao;
        import com.salojava.salo.Post;
        import com.salojava.salo.User;
        import javax.servlet.http.*;
        import java.io.*;
        import org.json.JSONObject;



/**
 * Created by Ashe on 16/6/10.
 */

@WebServlet("/BNewPost")
public class BBSFaTieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        //此处不新建session，只是去取已经创建的session
        HttpSession session = request.getSession(false);
        //如果session能够取到，说明用户已经登录
        if(session!=null)
        {
            System.out.println("postContent"+request.getParameter("postContent"));
            System.out.println("postClass"+Integer.valueOf(request.getParameter("postClass")));
            System.out.println("userID"+Integer.valueOf(request.getParameter("userID")));
            System.out.println("postTitle"+request.getParameter("postTitle"));

            Post post=new Post();
            post.setPTitle(request.getParameter("postTitle"));
            post.setPContent(request.getParameter("postContent"));
            post.setCID(Integer.valueOf(request.getParameter("postClass")));
            post.setUID(Integer.valueOf(request.getParameter("userID")));
            PostDao postDao=new PostDao();
            int count=postDao.insertPost(post);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("msg","success");
            System.out.println(jsonObject);
            response.setContentType("application/json");
            response.getWriter().write(jsonObject.toString());
            System.out.println(count);

        }
        //否则，说明用户没有登录，跳转到登录页面让用户登录
        else
        {
            response.sendRedirect("/Login.jsp");
        }

    }
}
