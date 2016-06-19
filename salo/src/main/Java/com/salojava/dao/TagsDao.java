package com.salojava.dao;

import com.salojava.salo.Tags;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by PunoLee on 16/6/11.
 */
public class TagsDao {
//            public static void main(String args[]) {
//            List<Tags> p=new ArrayList();
//            p=query("人");
//            for(Tags b : p){
//                System.out.println(b.getTID());
//            }
//
//        }
    /**
     * 查找用户在数据库的数据
     * @param tName 标签名
     * @return 用户对象
     */
    public int findTags(String tName){
        Tags tags = null;
        int tid=0;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "{call tagsfind(?,?)}";
        try {
            // 获取PreparedStatement对象
            CallableStatement ps = conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1, tName);
            ps.registerOutParameter(2, java.sql.Types.INTEGER);
            // 执行查询获取结果集
            ps.execute();
            tid=ps.getInt(2);

            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return tid;
    }
    public  List<Tags> query(String q){
        List<Tags> tagses=new ArrayList();
        Tags tags=null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql="{call find_tags(?)}";
        try{
            CallableStatement ps = conn.prepareCall(sql);
            ps.setString(1, q);
            ResultSet rs=ps.executeQuery();
            tagses=convertList(rs);
            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return tagses;
    }
    private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        while (rs.next()) {
           Tags rowData =new Tags();
            rowData.setTID(rs.getInt("tID"));
            rowData.setTName(rs.getString("tName"));
            rowData.setTCata(rs.getString("tCata"));
            rowData.setTPCount(rs.getInt("tPCount"));
            rowData.setTSCount(rs.getInt("tSCount"));
            list.add(rowData);
        }
        return list;
    }
}
