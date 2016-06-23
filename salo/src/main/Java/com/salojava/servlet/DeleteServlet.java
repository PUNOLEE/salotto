package com.salojava.servlet;

import com.salojava.dao.ConnectDB;
import com.salojava.salo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by PunoLee on 16/6/13.
 */
@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = (Connection) ConnectDB.getConnection();
       int pfcid=Integer.parseInt(request.getParameter("pfCID"));
        try {
            PreparedStatement ps = conn.prepareStatement("delete from portfolioComments where pfCommentsID=?");
            ps.setInt(1, pfcid);
            ps.executeUpdate();
            ps.close();
            request.setAttribute("info", "已删除");
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        request.getRequestDispatcher("Comment.jsp").forward(request, response);



    }
}
