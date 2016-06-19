package com.salojava.servlet;

import com.salojava.dao.ConnectDB;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by PunoLee on 16/6/13.
 */
@WebServlet(name = "LikesServlet")
public class LikesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pfid=Integer.parseInt(request.getParameter("pfid"));
        int uID=Integer.parseInt(request.getParameter("uID"));
        int yes=Integer.parseInt(request.getParameter("Yes"));
        Connection conn = (Connection) ConnectDB.getConnection();
        try{
            if(yes==1) {
                PreparedStatement ps = conn.prepareStatement("insert into Likes(pfID, LikesuID) values(?,?)");
                ps.setInt(1, pfid);
                ps.setInt(2, uID);
                ps.executeUpdate();
                ps.close();
            }
            else{
                PreparedStatement ps = conn.prepareStatement("delete from Likes where pfid=? and LikesuID=?");
                ps.setInt(1, pfid);
                ps.setInt(2, uID);
                ps.executeUpdate();
                ps.close();
            }
            CallableStatement cs = conn.prepareCall("{call updateLikes(?,?)}");
            cs.setInt(1, pfid);
            cs.setInt(2,yes);
            cs.execute();
            cs.close();

        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("option",yes);
        response.setContentType("application/json");
        response.getWriter().write(jsonObject.toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
