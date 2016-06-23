package com.salojava.dao;

import com.salojava.salo.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ashe on 16/6/22.
 */
public class CollectDao {
    public static void main(String args[]) {
      /*  List<Post> list=selectCoListByPage(10000002,1,1);
        for (Post b: list
             ) {System.out.println(b.getUID());

        }*/
       System.out.println(CollectIsExist(10000001,10000001));
    }

    public  static boolean CollectIsExist(int pID, int uID) {
        Boolean state=false;
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 根据指定用户名查询用户信息
        String sql = "select * from postCollect where pID = ? and uID = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,pID);
            ps.setInt(2, uID);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if (rs.next()) {
                // 实例化一个用户对象
                state= true;
            }
            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            rs.close();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return state;
    }

    /*get post by pID*/
    public  static int selectCoPost(int pid) {
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectCoCount(?)}";
        int count = -1;
        try {
            // 获取PreparedStatement对象
            CallableStatement ps = conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if (rs.next()) {
                count = rs.getInt("cunt");
            }
            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            rs.close();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return count;
    }

    public  static List selectCoListByPage(int uID,int pageNumber,int pageSize){
        Post post;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectCoListByPage(?,?,?)}";
        List<Post> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,uID);
            ps.setInt(2,pageNumber-1);
            ps.setInt(3,pageSize);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            while(rs.next()){
                // 实例化一个用户对象
                post = new Post();
                // 对用户对象属性赋值
                post.setPID(rs.getInt("pID"));
                post.setPTitle(rs.getString("pTitle"));
                post.setPDate(rs.getTimestamp("pDate"));
                post.setBRCount(rs.getInt("brCount"));
                post.setRECount(rs.getInt("reCount"));
                post.setCollectCount(rs.getInt("collectCount"));
                post.setUName(rs.getString("uName"));
                post.setUID(rs.getInt("uID"));
                list.add(post);
            }
            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            rs.close();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return list;

    }
}
