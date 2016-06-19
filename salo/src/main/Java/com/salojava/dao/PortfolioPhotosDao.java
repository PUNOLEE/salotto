package com.salojava.dao;

import com.salojava.salo.PortfolioPhotos;
import com.salojava.salo.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

/**
 * Created by PunoLee on 16/6/10.
 */
public class PortfolioPhotosDao {
//    public static void main(String args[]) {
//        List<Object[]> a=findPhotos(118);
//
//        String[] pn=new String[a.size()];
//        for(int i=0;i<a.size();i++){
//            pn[i]=String.valueOf(a.get(i));
//            System.out.println(a.get(i));
//        }
//        }
    public void savePortPhotos(PortfolioPhotos pp){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into portfolioPhotos(pfID,pfPName) values(?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pp.getPfID());
            ps.setString(2, pp.getPfPName());
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
     * 查找用户在数据库的数据
     * @param pfid portfolioID
     * @return 用户对象
     */
    public   List<Object[]>  findPhotos(int pfid){
        List<Object[]> userList=new ArrayList();

        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select pfPName from portfolioPhotos where pfid = ? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pfid);
            ResultSet rs = ps.executeQuery();
            userList=convertList(rs);

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
        while (rs.next()) {
            Map rowData = new HashMap();
            for (int i = 1; i <= columnCount; i++) {
                rowData.put(md.getColumnName(i), rs.getObject(i));
            }
            list.add(rowData);
        }
        return list;
    }

}
