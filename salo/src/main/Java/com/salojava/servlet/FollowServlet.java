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
 * Created by PunoLee on 16/6/19.
 */
@WebServlet(name = "FollowServlet")
public class FollowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int foID=Integer.parseInt(request.getParameter("foID"));
        int uID=Integer.parseInt(request.getParameter("uID"));
        int yes=Integer.parseInt(request.getParameter("Yes"));
        Connection conn = (Connection) ConnectDB.getConnection();
        try{
            if(yes==1) {
                PreparedStatement ps = conn.prepareStatement("insert into follow(uID, foID) values(?,?)");
                ps.setInt(1, uID);
                ps.setInt(2, foID);
                ps.executeUpdate();
                ps.close();
            }
            else{
                PreparedStatement ps = conn.prepareStatement("delete from follow where uID=? and foID=?");
                ps.setInt(1, uID);
                ps.setInt(2, foID);
                ps.executeUpdate();
                ps.close();
            }
            CallableStatement cs = conn.prepareCall("{call updateFollow(?,?,?)}");
            cs.setInt(1, foID);
            cs.setInt(2,uID);
            cs.setInt(3,yes);
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
