package com.salojava.servlet;

import com.salojava.dao.portfolioCommentsDao;
import com.salojava.salo.portfolioComments;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by PunoLee on 16/6/13.
 */
@WebServlet(name = "CommentServlet")
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int uID=Integer.parseInt(request.getParameter("uID"));
        int pfid=0;
        String Content=request.getParameter("message");
        int authorid=Integer.parseInt(request.getParameter("authorID"));
        portfolioCommentsDao pfcd=new portfolioCommentsDao();
        portfolioComments pfc=new portfolioComments();

        pfc.setUID(uID);
        pfc.setAuthorID(authorid);
        pfc.setPFCommentsContent(Content);
        if(request.getParameter("pfid")!=null){
            pfid = Integer.parseInt(request.getParameter("pfid"));
            pfc.setPFID(pfid);
            pfcd.saveComments(pfc);
        }else{
            pfcd.savamessage(pfc);
        }


        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "success");
        response.setContentType("application/json");
        response.getWriter().write(jsonObject.toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
