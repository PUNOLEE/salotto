package com.salojava.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.salojava.dao.PostDao;
import com.salojava.salo.Post;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ashe on 16/6/23.
 */
@WebServlet("/BSearch")
public class postSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String searchCont=request.getParameter("searchContent");
        List<Post> list=new ArrayList();
        String pageNumberStr = request.getParameter("pageNumber");
        int pageNumber = 1;
        if (pageNumberStr != null && !pageNumberStr.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberStr);
        }
        PostDao postDao = new PostDao();
        int pageSize = 10; //分页大小
        int totalPosts =postDao.searchPostCont(searchCont); //总文章数
        int totalPages = totalPosts / pageSize + ((totalPosts % pageSize) > 0 ? 1 : 0); //计算得出的总页数
        System.out.println("totalPosts:"+totalPosts);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPosts", totalPosts);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("totalPages", totalPages);
        List<Post> entryList = postDao.searchPost(searchCont, pageNumber, pageSize);
        request.setAttribute("entryList", entryList);

        request.setAttribute("sContent",searchCont);
        request.getRequestDispatcher("/SearchPost.jsp").forward(request, response);


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
