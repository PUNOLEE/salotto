package com.salojava.dao;

import com.salojava.salo.portfolioComments;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by PunoLee on 16/6/13.
 */
public class portfolioCommentsDao {
//            public static void main(String args[]) {
//                List<portfolioComments> Comments=new ArrayList();
//                Comments=findComments(1);
//                for(portfolioComments b:Comments){
//                    System.out.println(b.getPFCommentsDate());
//                }
//        }
    public void savamessage(portfolioComments pc){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into portfolioComments(uID,pfCommentsContent,authorID) values(?,?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pc.getUID());
            ps.setString(2, pc.getPFCommentsContent());
            ps.setInt(3,pc.getAuthorID());
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
    public void saveComments(portfolioComments pc){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into portfolioComments(uID,pfCommentsContent,pfID,authorID) values(?,?,?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pc.getUID());
            ps.setString(2, pc.getPFCommentsContent());
            ps.setInt(3, pc.getPFID());
            ps.setInt(4,pc.getAuthorID());
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
     * 查看用户所有的评论
     * @param authorID 用户ID
     * @return 用户对象
     */
    public static   List<portfolioComments> findComments(int authorID){
        List<portfolioComments> userList=new ArrayList();
        portfolioComments pc = null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select * from portfolioComments where authorID = ? ";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, authorID);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            userList=convertList(rs);
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
        return userList;
    }
    private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        ResultSetMetaData md = rs.getMetaData();
        int columnCount = md.getColumnCount();
        Date date;
        while (rs.next()) {
            portfolioComments rowData = new portfolioComments();
            rowData.setPFCommentsID(rs.getInt("pfCommentsID"));
            rowData.setAuthorID(rs.getInt("authorID"));
            rowData.setPFID(rs.getInt("pfID"));
            rowData.setPFCommentsContent(rs.getString("pfCommentsContent"));
            Timestamp timestamp = rs.getTimestamp("pfCommentsDate");
            date = new Date(timestamp.getTime());
            rowData.setPFCommentsDate(dataToString(date));
            rowData.setUID(rs.getInt("uID"));
            list.add(rowData);
        }
        return list;
    }

    private static String dataToString(Date date) {
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String ctime = formatter.format(date);

        return ctime;
    }


}
