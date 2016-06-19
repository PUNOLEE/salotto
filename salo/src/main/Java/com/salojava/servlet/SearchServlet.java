package com.salojava.servlet;

import com.salojava.dao.TagsDao;
import com.salojava.salo.Tags;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by PunoLee on 16/6/15.
 */
@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String query=request.getParameter("query");
        TagsDao tagsDao=new TagsDao();
        List<Tags> tagses=new ArrayList();
        tagses=tagsDao.query(query);
        int[] ids=new int[tagses.size()];
        String tid="";
        for(int i=0;i<tagses.size();i++){
            ids[i]=tagses.get(i).getTID();
            tid+=ids[i]+";";

        }
        System.out.println(tid);
        request.setAttribute("type",tid);
        request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
