package com.salojava.salo;
import com.salojava.dao.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
/**
 * Created by Ashe on 16/6/7.
 */
public class Post {
    private int PID;
    private int UID;
    private String PTitle;
    private String PContent;
    private Timestamp PDate;
    private int BRCount;
    private int RECount;
    private  int CID;
    private String PTags;
    private int CollectCount;
    private String UName;
    private String UPhoto;

    public Timestamp getNTime() {
        return NTime;
    }

    public void setNTime(Timestamp NTime) {
        this.NTime = NTime;
    }

    private Timestamp NTime;

    public String getUPhoto() {
        return UPhoto;
    }

    public void setUPhoto(String UPhoto) {
        this.UPhoto = UPhoto;
    }

    public String getUName() {
        return UName;
    }

    public void setUName(String UName) {
        this.UName = UName;
    }

    public int getCollectCount() {
        return CollectCount;
    }

    public void setCollectCount(int collectCount) {
        CollectCount = collectCount;
    }

    public String getPTags() {
        return PTags;
    }

    public void setPTags(String PTags) {
        this.PTags = PTags;
    }
    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getPTitle() {
        return PTitle;
    }

    public void setPTitle(String PTitle) {
        this.PTitle = PTitle;
    }

    public String getPContent() {
        return PContent;
    }

    public void setPContent(String PContent) {
        this.PContent = PContent;
    }

    public Timestamp getPDate() {
        return PDate;
    }

    public void setPDate(Timestamp PDate) {
        this.PDate = PDate;
    }

    public int getBRCount() {
        return BRCount;
    }

    public void setBRCount(int BRCount) {
        this.BRCount = BRCount;
    }

    public int getRECount() {
        return RECount;
    }

    public void setRECount(int RECount) {
        this.RECount = RECount;
    }

    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    public User finduser(int uID){
        User user = null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select * from users where uID = ? ";
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
                user = new User();
                // 对用户对象属性赋值
                user.setUId(rs.getInt("uID"));
                user.setUName(rs.getString("uName"));
                user.setUPhoto(rs.getString("uPhoto"));
                user.setUPassword(rs.getString("uPwd"));
                user.setUMail(rs.getString("uMail"));
                user.setUDescribe(rs.getString("uDescribe"));
                user.setUGender(rs.getInt("uGender"));
                user.setUAddArea(rs.getString("uAddArea"));
                user.setUAddCity(rs.getString("uAddCity"));
                user.setUAddCountry(rs.getString("uAddCountry"));
                user.setUCamera(rs.getString("uCamera"));
                user.setULens(rs.getString("uLens"));
                user.setUMisc(rs.getString("uMisc"));
                user.setUFirstname(rs.getString("uFirstname"));
                user.setULastname(rs.getString("uLastname"));
                user.setUBirthday(rs.getString("uBirthday"));

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

    public String findNewRUser(int pID){
        String userName="";
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select uName from postReplys natural JOIN users where pID = ? order by prDate DESC ";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pID);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(rs.next()){
                // 实例化一个用户对象
                 userName=rs.getString("uName");
                // 对用户对象属性赋值
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
        return userName;
    }

    public Timestamp findNewRTime(int pID){
        Timestamp time=null;
        Connection conn = (Connection) ConnectDB.getConnection();
        String sql = "select prDate from postReplys natural JOIN users where pID = ? order by prDate DESC ";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, pID);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(rs.next()){
                // 实例化一个用户对象
                time=rs.getTimestamp("prDate");
                // 对用户对象属性赋值
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
        setNTime(time);
        return time;
    }
}
