package com.salojava.dao;
import com.salojava.salo.Post;
import com.salojava.salo.PostClass;
import javafx.geometry.Pos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;



/**
 * Created by Ashe on 16/6/7.
 */
public class PostClassDao {
    public static void main(String argv[]){
        List<PostClass> postReply=selectAllClass();
    }

    public void saveClass(PostClass postclass){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into postClass(cName,cDescript) values(?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, postclass.getCName());
            ps.setString(2, postclass.getCDescript());
            // 执行更新操作
            ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
    }

    /*
    *获取板块信息
     */
    public   static List selectAllClass(){
        PostClass postClass;
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "select * from postClass";
        List list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值

            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            while(rs.next()){
                // 实例化一个用户对象
                postClass = new PostClass();
                // 对用户对象属性赋值
                postClass.setCID(rs.getInt("cID"));
                postClass.setCName(rs.getString("cName"));
                postClass.setCDescript(rs.getString("cDescript"));
                postClass.setCPCount(rs.getInt("cpCount"));
                postClass.setCRCount(rs.getInt("crCount"));
                list.add(postClass);
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
