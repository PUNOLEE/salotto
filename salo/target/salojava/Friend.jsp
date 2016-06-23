<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.dao.portfolioCommentsDao" %>
<%@ page import="com.salojava.salo.portfolioComments" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.salojava.dao.FollowDao" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/13
  Time: 下午6:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <title>我的好友</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <%@include file="WEB-INF/jsp/jss.jsp"%>

  <link rel="stylesheet" href="assets2/css/pop.css" />

</head>
<body>
<div id="wrapper">
  <%@include file="WEB-INF/jsp/header.jsp"%>

  <center>
    <div class="navbar-secondary">
      <ul class="navbar-subnav">
        <li ><a href="Set.jsp">设置</a></li>
        <li class="active"><a href="Friend.jsp">我的好友</a></li>
        <li><a href="Gallery.jsp">相册</a></li>
      </ul>
    </div></center>
  <div id="main">
    <div class="container-default1">
      <%
        UserDao authorDao=new UserDao();
        User author=new User();
        author=authorDao.findbyID(user.getUId());
        FollowDao followDao=new FollowDao();
        List<User> followers=followDao.findfollowers(author.getUId());
        List<User> following=followDao.findfollowing(author.getUId());

      %>
      <div class="col d6x5 clearafter friend">
        <div class="controlgroup d12x5 g1 margin">
          <h3>
            My Following
          </h3>
          <div class="controls" style="min-height: 630px; overflow: hidden;">
            <%
              for (User a :followers){
            %>
            <div class="checkinfo friend">
              <a href="" class="deletef">x</a>


              <div class="settings-avatar-container">

                <a href="Account.jsp?uID=<%=a.getUId()%>" class="settings-avatar-image" style="background-image:url(uploads/<%=a.getUPhoto()%>);"></a>
              </div>
              <div class="settings-avatar-upload">
                <div><%=a.getUName()%></div>
                <div class="fx">
                  <div class="xxfriend">
                    <%=a.getUDescribe()%>
                    <br>
                  </div>
                </div>

              </div>

            </div>
            <%}%>
          </div>
        </div>
        <div class="controlgroup d12x5 g1">
          <h3>
            My Followers
          </h3>
          <div class="controls" style="min-height: 630px; overflow: hidden;">
            <%
              for (User a :following){
            %>
            <div class="checkinfo friend">
              <a href="" class="deletef">x</a>

              <div class="settings-avatar-container">

                <a href="Account.jsp?uID=<%=a.getUId()%>" class="settings-avatar-image" style="background-image:url(uploads/<%=a.getUPhoto()%>);"></a>
              </div>
              <div class="settings-avatar-upload">
                <div><%=a.getUName()%></div>
                <div class="fx">
                  <div class="xxfriend">
                    <%=a.getUDescribe()%>
                    <br>
                  </div>
                </div>

              </div>



            </div>
            <%}%>
          </div>



      </div>
    </div>
  </div>


</body>
</html>
