package com.salojava.servlet;

import com.salojava.dao.CollectDao;
import com.salojava.dao.PostDao;
import com.salojava.salo.Post;

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
@WebServlet("/BCollectList")
public class BBSCollectListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int userID=Integer.valueOf(request.getParameter("userID"));
    String pageNumberStr = request.getParameter("pageNumber");
    int pageNumber = 1;
    if (pageNumberStr != null && !pageNumberStr.isEmpty()) {
        pageNumber = Integer.parseInt(pageNumberStr);
    }
        CollectDao collectDao=new CollectDao();
    int pageSize = 10; //分页大小
    int totalPosts =collectDao.selectCoPost(userID); //总文章数
    int totalPages = totalPosts / pageSize + ((totalPosts % pageSize) > 0 ? 1 : 0); //计算得出的总页数
        System.out.println("totalPosts:"+totalPosts);

    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totalPosts", totalPosts);
    request.setAttribute("pageNumber", pageNumber);
    request.setAttribute("totalPages", totalPages);

    List<Post> entryList = collectDao.selectCoListByPage(userID, pageNumber, pageSize);
    request.setAttribute("entryList", entryList);
    request.getRequestDispatcher("/BBSCollect.jsp").forward(request, response);
}
}
