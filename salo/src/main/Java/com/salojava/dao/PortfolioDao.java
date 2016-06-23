package com.salojava.dao;

import com.salojava.salo.Portfolio;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by PunoLee on 16/6/10.
 */
public class PortfolioDao {
//        public static void main(String args[]) {
//            List<Portfolio> p=postPortfolio(1);
//
//           for(Portfolio a:p){
//               System.out.println(a.getPfID());
//           }
//
//        }
private static Connection conn;
    private static ResultSet resultset;
    private static Statement statement;
    private static int pagesize = 11;
    static {
        conn = (Connection) ConnectDB.getConnection();
    }
    public static ResultSet ExecuteQuery(String sql) {
        try {
            statement = conn.createStatement();
            resultset = statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultset;
    }
    public int savePortfolioUID(Portfolio pf){
        // 获取数据库连接Connection对象
        Connection conn = (Connection) ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "{call insertre(?,?,?,?,?)}";
        try {
            // 获取PreparedStatement对象
            CallableStatement ps = conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pf.getUID());
            ps.setString(2,pf.getPfTitle());
            ps.setString(3,pf.getPfDescribe());
            ps.setString(4,pf.getPfTags());
            ps.registerOutParameter(5, java.sql.Types.INTEGER);
            // 执行更新操作
            ps.execute();
            int pfid=ps.getInt(5);
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
            return pfid;
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return 0;
    }
    /**
     * 查找用户在数据库的数据
     * @param uID 用户名
     * @return 用户对象
     */
    public Portfolio findpfid(int uID){
        Portfolio pf = null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select max(pfID) from portfolio where uID = ? ";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, uID);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(rs.next()){
                // 实例化一个用户对象
                pf = new Portfolio();
                // 对用户对象属性赋值
                pf.setPfID(rs.getInt("pfID"));

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
        return pf;
    }
    /**
     * 查找图片数据
     * @param pfid portfolioID
     * @return 返回图片对象
     */
    public  Portfolio findportfolio(int pfid){
        Portfolio portfolio=null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select * from portfolio where pfID = ? ";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pfid);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(rs.next()){
                portfolio=new Portfolio();
                portfolio.setPfID(rs.getInt("pfID"));
                portfolio.setPfCommentCount(rs.getInt("pfCommentCount"));
                portfolio.setPfTags(rs.getString("pfTags"));
                portfolio.setPfDescribe(rs.getString("pfDescribe"));
                portfolio.setPfDate(rs.getDate("pfdate"));
                portfolio.setPfTitle(rs.getString("pfTitle"));
                portfolio.setPfLikesCount(rs.getInt("pfLikesCount"));
                portfolio.setUID(rs.getInt("uID"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return portfolio;
    }
    public    List<Portfolio> postPortfolio(int pageNum){
        List<Portfolio> pf=new ArrayList();
        Portfolio p=null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql="{call time_sort(?,?)}";
        try{
            CallableStatement ps = conn.prepareCall(sql);
            ps.setInt(1,(pageNum-1)*pagesize);
            ps.setInt(2,pagesize);
            ResultSet rs=ps.executeQuery();
            pf=convertList(rs);
            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return pf;

    }
    public  List<Portfolio> postPortfolio(String tags,int pageNum){
        List<Portfolio> pf=new ArrayList();
        Portfolio p=null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql="{call Likes_sort(?,?,?)}";
        try{
            CallableStatement ps = conn.prepareCall(sql);
            ps.setString(1,tags);
            ps.setInt(2, (pageNum-1)*pagesize);
            ps.setInt(3,pagesize);
            ResultSet rs=ps.executeQuery();
            pf=convertList(rs);
            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return pf;

    }
    public static int getPageCount() {
        int total = 0; // 总记录数
        int PageCount = 0; // 页码总数
        resultset = ExecuteQuery("select count(*) from portfolio");
        try {
            if (resultset.next()) {
                total = resultset.getInt(1);
                PageCount = (total - 1) / pagesize + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return PageCount;
    }
    public static int getTotalPage() {
        int total = 0; // 总记录数
        resultset = ExecuteQuery("select count(*) from portfolio");
        try {
            if (resultset.next()) {
                total = resultset.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
    public  List<Object[]> findUserPhotos(int uID){
        List<Object[]> photoList=new ArrayList();

        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "{call findUserPhotos(?)}";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();
            photoList=convertList2(rs);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return photoList;

    }
    public  List<Portfolio> query(String tags){
        List<Portfolio> pf=new ArrayList();
        Portfolio p=null;
        String pfid="";
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql="{call search_query(?,?)}";
        try{
            CallableStatement ps = conn.prepareCall(sql);
            ps.setString(1, tags);
            ps.registerOutParameter(2, Types.VARCHAR);
            ps.execute();
            pfid=ps.getString(2);
            String[] aa=pfid.split(",");

            for (int i = 0 ; i <aa.length ; i++ ) {
                PortfolioDao portfolioDao=new PortfolioDao();
                p=portfolioDao.findportfolio(Integer.parseInt(aa[i]));
                pf.add(p);
            }
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return pf;

    }
    private static List convertList(ResultSet rs) throws SQLException {
        List list = new ArrayList();
        while (rs.next()) {
            Portfolio rowData = new Portfolio();
            rowData.setPfID(rs.getInt("pfID"));
            rowData.setPfTitle(rs.getString("pfTitle"));
            rowData.setPfDescribe(rs.getString("pfDescribe"));
            rowData.setPfTags(rs.getString("pfTags"));
            rowData.setPfLikesCount(rs.getInt("pfLikesCount"));
            rowData.setPfCommentCount(rs.getInt("pfCommentCount"));
            rowData.setPfDate(rs.getDate("pfdate"));
            rowData.setUID(rs.getInt("uID"));
            list.add(rowData);
        }
        return list;
    }

    private static List convertList2(ResultSet rs) throws SQLException {
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
