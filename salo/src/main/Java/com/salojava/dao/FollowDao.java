package com.salojava.dao;

import com.salojava.salo.Portfolio;
import com.salojava.salo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by PunoLee on 16/6/19.
 */
public class FollowDao {
            public static void main(String args[]) {
            List<User> p=findfollowing(1);
            for(User u:p){
                System.out.print(u.getUName());
            }

        }

    public boolean FollowIsExist(int uID,int foID){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 根据指定用户名查询用户信息
        String sql = "select * from follow where uID = ? and foID = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对用户对象属性赋值
            ps.setInt(1, uID);
            ps.setInt(2,foID);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(!rs.next()){
                return true;
            }
            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            rs.close();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return false;
    }
    public  List<User> findfollowers(int uID){
        List<User> fo=new ArrayList();
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql="select uID from follow where foID=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs=ps.executeQuery();
            fo=convertList(rs);
            ps.close();
            rs.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return fo;

    }
    public static List<User> findfollowing(int uID){
        List<User> fo=new ArrayList();
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql="select foID from follow where uID=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs=ps.executeQuery();
            fo=convertList2(rs);
            ps.close();
            rs.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return fo;

    }
    private static List convertList2(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        while (rs.next()) {
            User rowData = new User();
            UserDao userDao=new UserDao();
            rowData=userDao.findbyID(rs.getInt("foID"));
            list.add(rowData);
        }
        return list;
    }
    private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        while (rs.next()) {
            User rowData = new User();
            UserDao userDao=new UserDao();
            rowData=userDao.findbyID(rs.getInt("uID"));
            list.add(rowData);
        }
        return list;
    }
}
