package com.salojava.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.salojava.dao.PostDao;
import com.salojava.dao.UserDao;
import com.salojava.salo.Post;
import com.salojava.salo.PostReply;
import com.salojava.salo.User;
import javax.servlet.http.*;
import java.io.*;

/**
 * Created by Ashe on 16/6/12.
 */

@WebServlet("/BPost")
public class BBSPostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDao postDao=new PostDao();
        int pid=Integer.valueOf(request.getParameter("postID"));
        int authorid=Integer.valueOf(request.getParameter("authorID"));

        Post post=postDao.selectPost(pid);
        User author=postDao.finduser(authorid);
        request.setAttribute("postTitle",post.getPTitle());
        request.setAttribute("postContent",post.getPContent());
        request.setAttribute("postDate",post.getPDate());
        request.setAttribute("authorName",post.getUName());
        request.setAttribute("collectCount",post.getCollectCount());
        request.setAttribute("authorPic",post.getUPhoto());
        request.setAttribute("postID",post.getPID());
        request.setAttribute("authorID",post.getUID());

        System.out.println("collectCount"+post.getCollectCount());

        String pageNumberStr = request.getParameter("pageNumber");
        int pageNumber = 1;
        if(pageNumberStr!=null && !pageNumberStr.isEmpty())
        {
            pageNumber = Integer.parseInt(pageNumberStr);
        }
        if(pageNumberStr==null|| pageNumberStr.isEmpty()){
            postDao.browsePost(pid);
        }
        int pageSize = 10; //分页大小
        int totalPosts = 0;
        totalPosts=  postDao.selectReCount(pid); //总文章数
        int totalPages = totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPosts", totalPosts);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("totalPages", totalPages);

        System.out.println("totalPosts"+totalPosts);
        System.out.println("totalPages"+totalPages);


        List<PostReply> entryList = postDao.selectReplyByPage(pid,pageNumber, pageSize);
        System.out.println("entryList:"+ entryList.size());
        request.setAttribute("entryList", entryList);
        request.getRequestDispatcher("/BBS_Post.jsp").forward(request, response);
    }
}
