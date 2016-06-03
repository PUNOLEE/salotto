package com.salojava.dao;

import com.salojava.salo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by PunoLee on 16/6/2.
 */
public class UserDao {
    public void saveUser(User user){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into users(uMail,uPwd) values(?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, user.getUMail());
            ps.setString(2, user.getUPassword());
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
    /**
     * 用户登录
     * @param uMail 用户名
     * @param uPwd 密码
     * @return 用户对象
     */
    public User login(String uMail, String uPwd){
        User user = null;
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "select * from users where uMail = ? and uPwd = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, uMail);
            ps.setString(2, uPwd);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(rs.next()){
                // 实例化一个用户对象
                user = new User();
                // 对用户对象属性赋值


                user.setUPassword(rs.getString("uPwd"));

                user.setUMail(rs.getString("uMail"));
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
        return user;
    }
    /**
     * 判断用户名在数据库中是否存在
     * @param uMail 用户名
     * @return 布尔值
     */
    public boolean userIsExist(String uMail){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 根据指定用户名查询用户信息
        String sql = "select * from users where uMail = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对用户对象属性赋值
            ps.setString(1, uMail);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(!rs.next()){
                // 如果无效则证明此用户名可用
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
}
