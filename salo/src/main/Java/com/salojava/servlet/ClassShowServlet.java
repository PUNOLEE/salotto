package com.salojava.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.salojava.dao.PostClassDao;
import com.salojava.dao.PostDao;
import com.salojava.salo.Post;
import com.salojava.salo.PostClass;
import com.salojava.salo.PostReply;
import com.salojava.salo.User;

/**
 * Created by Ashe on 16/6/7.
 */
@WebServlet("/BMain")
public class ClassShowServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostClassDao postClassDao=new PostClassDao();

        /*
        板块相关信息
         */
        List<PostClass> list=postClassDao.selectAllClass();
        String classname1=list.get(0).getCName();
        String classname2=list.get(1).getCName();
        String classname3=list.get(2).getCName();
        String classname4=list.get(3).getCName();

        int recount1=list.get(0).getCRCount();
        int recount2=list.get(1).getCRCount();
        int recount3=list.get(2).getCRCount();
        int recount4=list.get(3).getCRCount();

        int postcount1=list.get(0).getCPCount();
        int postcount2=list.get(1).getCPCount();
        int postcount3=list.get(2).getCPCount();
        int postcount4=list.get(3).getCPCount();

        String cdescription1=list.get(0).getCDescript();
        String cdescription2=list.get(1).getCDescript();
        String cdescription3=list.get(2).getCDescript();
        String cdescription4=list.get(3).getCDescript();


        /*
        中间推送的帖子相关信息(算法未实现)
         */



        request.setAttribute("classname1",classname1);
        request.setAttribute("classname2",classname2);
        request.setAttribute("classname3",classname3);
        request.setAttribute("classname4",classname4);
        request.setAttribute("recount1",recount1);
        request.setAttribute("recount2",recount2);
        request.setAttribute("recount3",recount3);
        request.setAttribute("recount4",recount4);
        request.setAttribute("postcount1",postcount1);
        request.setAttribute("postcount2",postcount2);
        request.setAttribute("postcount3",postcount3);
        request.setAttribute("postcount4",postcount4);
        request.setAttribute("cdescription1",cdescription1);
        request.setAttribute("cdescription2",cdescription2);
        request.setAttribute("cdescription3",cdescription3);
        request.setAttribute("cdescription4",cdescription4);

        /*

        PostDao postDao=new PostDao();


        String pageNumberStr = request.getParameter("pageNumber");
        int pageNumber = 1;
        if(pageNumberStr!=null && !pageNumberStr.isEmpty())
        {
            pageNumber = Integer.parseInt(pageNumberStr);
        }
        int pageSize = 1; //分页大小
        int totalPosts = postDao.selectAllPostCount(); //总文章数
        int totalPages = totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPosts", totalPosts);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("totalPages", totalPages);
        /*System.out.println("totalPosts"+totalPosts);
        System.out.println("totalPages"+totalPages);*/

        /*
        List<Post> entryList = postDao.selectMainPost(pageNumber, pageSize);
        System.out.println("entryList:"+ entryList.size());
        request.setAttribute("entryList", entryList);
        System.out.println(entryList.get(0).getPContent());*/

        request.getRequestDispatcher("/BBS_Main.jsp").forward(request,response);
    }
    }
