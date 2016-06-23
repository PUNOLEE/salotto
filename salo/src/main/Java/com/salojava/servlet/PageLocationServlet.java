package com.salojava.servlet;

import com.salojava.dao.PortfolioDao;
import com.salojava.dao.PortfolioPhotosDao;
import com.salojava.dao.UserDao;
import com.salojava.salo.Portfolio;
import com.salojava.salo.User;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by PunoLee on 16/6/23.
 */
@WebServlet(name = "PageLocationServlet")
public class PageLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer pageNo=Integer.parseInt(request.getParameter("pageno"));
        String type=request.getParameter("type");
        PortfolioDao pfd=new PortfolioDao();
        List<Portfolio> p=new ArrayList<Portfolio>();
        if(type=="0"){
            p= pfd.postPortfolio(pageNo);
        }else {
            p = pfd.postPortfolio(type, pageNo);
        }
        Integer totalpage=pfd.getPageCount();
        Integer total=pfd.getTotalPage();

        StringBuilder builder=new StringBuilder();
        builder.append("[");
        for(int i=0;i<p.size();i++){
            User author=new User();
            UserDao authordao=new UserDao();
            author=authordao.findbyID(p.get(i).getUID());
            PortfolioPhotosDao photos=new PortfolioPhotosDao();
            List<Object[]> photoName=new ArrayList();
            photoName=photos.findPhotos(p.get(i).getPfID());
            String x=photoName.toString();
            x=x.replace("=", "\":\"").replace("{","{\"").replace("}","\"}");
            StringBuilder content=new StringBuilder();
            int pfid=p.get(i).getPfID();
            String hp=author.getUPhoto();
            String title=p.get(i).getPfTitle();
            int likecount=p.get(i).getPfLikesCount();
            int commentcount=p.get(i).getPfCommentCount();
            String describe=p.get(i).getPfDescribe();
            Date date=p.get(i).getPfDate();
            String authorname=author.getUName();
            int uid=p.get(i).getUID();
            content.append("{\"pfid\":\"").append(pfid).append("\"");
            content.append(",\"title\":\"").append(title).append("\"");
            content.append(",\"describe\":\"").append(describe).append("\"");
            content.append(",\"date\":\"").append(date).append("\"");
            content.append(",\"authorname\":\"").append(authorname).append("\"");
            content.append(",\"uid\":\"").append(uid).append("\"");
            content.append(",\"photoname\":").append(x).append("");
            content.append(",\"hp\":\"").append(hp).append("\"");
            content.append(",\"likecount\":\"").append(likecount).append("\"");
            content.append(",\"commentcount\":").append(commentcount).append("}");

            if(i<p.size()-1){
                content.append(",");
            }
            builder.append(content.toString());



        }
        builder.append("]");
        StringBuilder json=new StringBuilder();
        json.append("{\"total\":").append(total).append("");
        json.append(",\"totalPage\":").append(totalpage).append("");
        json.append(",\"page\":").append(pageNo).append("");
        json.append(",\"pageSize\":").append("11").append("");
        json.append(",\"list\":").append(builder.toString()).append("}");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.write(json.toString());
        out.flush();
        out.close();

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
