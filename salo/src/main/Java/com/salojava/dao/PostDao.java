package com.salojava.dao;

import com.salojava.salo.Post;
import com.salojava.salo.PostReply;
import com.salojava.salo.User;
import com.sun.corba.se.spi.orbutil.fsm.Guard;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ashe on 16/6/8.
 */
public class PostDao {
    public static void main(String argv[]){

       /* List<Post> searchPost=searchPost("我",0,10);
        for(Post b:searchPost){
            System.out.println(b.getPID());
        }
        int i=searchPostCont("我");
        System.out.println(i);
*/
       int i= deletePost(10000003);
        System.out.println(i);
    }
    /*
    发帖 pass
     */
    public  int  insertPost(Post post){
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 插入用户注册信息的SQL语句
        String sql = "insert into posts(uID,pTitle,pContent,cID) values(?,?,?,?)";
        String postContent=post.getPTitle();
        String postTitle=post.getPTitle();
        postContent.replace("[","[[]");
        postContent.replace("_","[_]");
        postContent.replace("%","[%]");
        postContent.replace(" ","&nbsp;&nbsp;");
        postContent.replace("\r","<br/>");
        postTitle.replace("[","[[]");
        postTitle.replace("_","[_]");
        postTitle.replace("%","[%]");
        postTitle.replace(" ","&nbsp;&nbsp;");
        postTitle.replace("\r","<br/>");
        int i=-1;
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, post.getUID());
            ps.setString(2, postTitle);
            ps.setString(3,postContent);
            ps.setInt(4,post.getCID());
            // 执行更新操作
            i=ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return i;
    }

    /*get post by pID*/
    public  static Post selectPost(int pid){
        Post post=null;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectPost(?)}";
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,pid);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(rs.next()){
                // 实例化一个用户对象
                post = new Post();
                // 对用户对象属性赋值
                post.setPID(pid);
                post.setPTitle(rs.getString("pTitle"));
                post.setPDate(rs.getTimestamp("pDate"));
                post.setCollectCount(rs.getInt("collectCount"));
                post.setPContent(rs.getString("pContent"));
                post.setUName(rs.getString("uName"));
                post.setUPhoto(rs.getString("uPhoto"));
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
        return post;
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


    public  static List selectClassListByPage(int cID,int pageNumber,int pageSize){
        Post post;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectClassListByPage(?,?,?)}";
        List<Post> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,cID);
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
    public List selectClassList(int cID){
        Post post;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectClassList(?)}";
        List<Post> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,cID);
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



    /*
    */
    public   List selectReplyByPage(int pID,int pageNumber,int pageSize){
        PostReply postReply;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectReplyByPage(?,?,?)}";
        List<PostReply> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,pID);
            ps.setInt(2,pageNumber-1);
            ps.setInt(3,pageSize);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            while(rs.next()){
                // 实例化一个用户对象
                postReply = new PostReply();
                // 对用户对象属性赋值
                postReply.setPID(pID);
                postReply.setPRContent(rs.getString("prContent"));
                postReply.setPRDate(rs.getTimestamp("prDate"));
                postReply.setUPhoto(rs.getString("uPhoto"));
                postReply.setUName(rs.getString("uName"));
                list.add(postReply);
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

    public static int selectReCount(int PID){
        int count=-1;        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectReplyCount(?)}";
        List<Post> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,PID);

            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if (rs.next()){
                // 实例化一个用户对象
                // 对用户对象属性赋值
              count=rs.getInt("reCount");
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
        return count;
    }


    /*
    插入某回复 pass
     */
    public int insertReply(PostReply reply){
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        int count=-1;
        String replyContent=reply.getPRContent();
        replyContent.replace("[","[[]");
        replyContent.replace("_","[_]");
        replyContent.replace("%","[%]");
        replyContent.replace(" ","&nbsp;&nbsp;");
        replyContent.replace("\r","<br/>");

        // 插入用户注册信息的SQL语句
        String sql = "insert into postReplys(pID,uID,prContent) values(?,?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, reply.getPID());
            ps.setInt(2, reply.getUID());
            ps.setString(3,reply.getPRContent());
            // 执行更新操作
            count=ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return count;
    }

    public  int browsePost(int postID){
        PostReply postReply;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call browsePost(?)}";
        int rs=-1;
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,postID);
            // 执行查询获取结果集
            rs = ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return rs;
    }

    public static int collectPost(int postID,int userID){
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        int count=-1;
        // 插入用户注册信息的SQL语句
        String sql = "insert into postCollect(pID,uID) values(?,?)";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, postID);
            ps.setInt(2, userID);
            // 执行更新操作
            count=ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return count;
    }

    public static int deCollectPost(int postID,int userID){
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        int count=-1;
        // 插入用户注册信息的SQL语句
        String sql = "delete from postCollect where pID=? and uID=?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, postID);
            ps.setInt(2, userID);
            // 执行更新操作
            count=ps.executeUpdate();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return count;
    }

    /*get post by uID*/
    public  static int selectMyPCount(int uid) {
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectMyPost(?)}";
        int count = -1;
        try {
            // 获取PreparedStatement对象
            CallableStatement ps = conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1, uid);
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

    public  static List selectMyPListByPage(int uID,int pageNumber,int pageSize){
        Post post;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectMyPListByPage(?,?,?)}";
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
    public  static List selectMainPost(int pageNumber,int pageSize){
        Post post;
        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call mainPost(?,?)}";
        List<Post> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,pageNumber-1);
            ps.setInt(2,pageSize);
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
                post.setUPhoto(rs.getString("uPhoto"));
                post.setRECount(rs.getInt("reCount"));
                post.setCollectCount(rs.getInt("collectCount"));
                post.setUName(rs.getString("uName"));
                post.setUID(rs.getInt("uID"));
                post.setPContent(rs.getString("pContent"));
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

    public static int selectAllPostCount(){
        int count=-1;        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        String sql = "{call selectAllPostCount()}";
        try {
            // 获取PreparedStatement对象
            CallableStatement ps=conn.prepareCall(sql);
            // 对SQL语句的占位符参数进行动态赋值

            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if (rs.next()){
                // 实例化一个用户对象
                // 对用户对象属性赋值
                count=rs.getInt("cunt");
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
        return count;
    }

    public  static List searchPost(String searchContent,int pageNumber,int pageSize){
        Post post;
        // 获取数据库连接Connection对象
        String sql = "select `pID`,`pTitle`,`brCount`,`reCount`,`collectCount`,`uName`,`pDate`,`uID` from `posts` natural join `users` where `posts`.`pTitle` like ? limit "+pageNumber+","+pageSize;
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        searchContent.replace("[","[[]");
        searchContent.replace("_","[_]");
        searchContent.replace("%","[%]");
        searchContent.replace(" ","&nbsp;&nbsp;");
        searchContent.replace("\r","<br/>");
        List<Post> list=new ArrayList();
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1,"%"+searchContent+"%");
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
                post.setRECount(rs.getInt("reCount"));
                post.setBRCount(rs.getInt("brCount"));
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

    public  static int searchPostCont(String searchContent){
        // 获取数据库连接Connection对象
        String sql = "select count(`pID`) as cunt from `posts` where `posts`.`pTitle` like ?";
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        searchContent.replace("[","[[]");
        searchContent.replace("_","[_]");
        searchContent.replace("%","[%]");
        searchContent.replace(" ","&nbsp;&nbsp;");
        searchContent.replace("\r","<br/>");
        int count=0;
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setString(1,"%"+searchContent+"%");
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if (rs.next()){
                count=rs.getInt("cunt");
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
        return count;
    }

    public  static int deletePost(int postid){
        // 获取数据库连接Connection对象
        String sql = "Delete from `posts` where `posts`.`pID`=? ";
        Connection conn = ConnectDB.getConnection();
        // 根据用户名及密码查询用户信息
        int count=0;
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对SQL语句的占位符参数进行动态赋值
            ps.setInt(1,postid);
            // 执行查询获取结果集
            count = ps.executeUpdate();
            // 判断结果集是否有效

            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return count;
    }
}
