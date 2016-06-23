package com.salojava.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.salojava.dao.PostDao;
import com.salojava.salo.Post;
/**
 * Created by Ashe on 16/6/9.
 */
@WebServlet("/BList")
public class BBSListServlet  extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            int cID=Integer.valueOf(request.getParameter("classID"));
            String pageNumberStr = request.getParameter("pageNumber");
            int pageNumber = 1;
            if (pageNumberStr != null && !pageNumberStr.isEmpty()) {
                pageNumber = Integer.parseInt(pageNumberStr);
            }

            PostDao postDao = new PostDao();
            int pageSize = 10; //分页大小
            int totalPosts = postDao.selectClassList(cID).size(); //总文章数
            int totalPages = totalPosts / pageSize + ((totalPosts % pageSize) > 0 ? 1 : 0); //计算得出的总页数

            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPosts", totalPosts);
            request.setAttribute("pageNumber", pageNumber);
            request.setAttribute("totalPages", totalPages);

            List<Post> entryList = postDao.selectClassListByPage(cID, pageNumber, pageSize);

            request.setAttribute("entryList", entryList);
            System.out.println(entryList.get(0).getUID());
            request.getRequestDispatcher("/BBS_List.jsp").forward(request, response);
    }
}
