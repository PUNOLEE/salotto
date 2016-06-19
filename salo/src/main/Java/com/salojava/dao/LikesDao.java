package com.salojava.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by PunoLee on 16/6/13.
 */
public class LikesDao {
/*
 * 查找喜欢数据
 * @param uID uID
 * @param pfID pfID
 * @return boolean
 */
    public boolean LikeIsExist(int uID,int pfID){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 根据指定用户名查询用户信息
        String sql = "select * from Likes where LikesuID = ? and pfID = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对用户对象属性赋值
            ps.setInt(1, uID);
            ps.setInt(2,pfID);
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
}
