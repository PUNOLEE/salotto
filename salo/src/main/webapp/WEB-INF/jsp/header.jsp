<%@ page import="com.salojava.dao.UserDao" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/3
  Time: 下午2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<style type="text/css">
  #header #search.visible {
    padding: 0.5em 0.5em 0 0;
  }
</style>
<!-- Header -->

<header id="header">
  <img src="images2/logo.png" class="logo">
  <h1><a href="index.jsp">SALOTTO 沙龙</a></h1>
  <nav class="links">
    <ul>
      <li><a href="index.jsp">首页</a></li>
      <li><a href="Pictures.jsp?type=0">图</a></li>
      <li><a href="#">活动</a></li>
      <li><a href="News.jsp">资讯</a></li>
      <li><a href="#">论坛</a></li>
      <li><a href="#">红娘</a></li>
    </ul>
  </nav>

  <nav class="main">
    <ul>
      <%

        User user = (User)session.getAttribute("user");

        if(user!=null){
      %>
      <li class="search">
        <a class="fa-search" href="#search">Search</a>
        <form id="search" method="post" action="Search">
          <input type="text" name="query" placeholder="Search" />
        </form>
      </li>
      <li class="Postw">
        <a class="fa-upload" href="Upload.jsp">发布</a>
      </li>
      <li class="menu">
        <a class="fa-bars" href="#menu">菜单</a>
      </li>
      <%
      }
      else{
      %>
      <li></li>
      <%
        }
      %>
    </ul>
  </nav>
</header>
<!-- Menu -->
<section id="menu">



  <!-- Links -->
  <section>
    <ul class="links">

<%
  if(user!=null){
  UserDao userDao=new UserDao();
  user=userDao.finduser(user.getUMail());
%>
      <li>
        <a href="Set.jsp" >
          <div class="author" id="account"><img src="uploads/<%=user.getUPhoto()%>" alt="" /></div>
          <h3 class="bar"><%=user.getUName()%></h3>

        </a>
        <a href="Exit" class="button" id="signout">登出</a>
      </li>
<%
  }%>


    </ul>
  </section>
  <%if(user!=null){%>
  <section>
    <ul class="links">
      <li>
        <a href="Account.jsp?uID=<%=user.getUId()%>">
          <h3 >我的主页</h3>

        </a>
      </li>
      <li>
        <a href="#">
          <h3>我的收藏</h3>

        </a>
      </li>
      <li>
        <a href="#">
          <h3>我的好友</h3>

        </a>
      </li>

    </ul>
  </section>
  <%}%>
  <section>
    <ul class="links">
      <li>
        <a href="#">
          <h3 >与我相关</h3>

        </a>
      </li>
      <li>
        <a href="Comment.jsp">
          <h3>我的评论</h3>

        </a>
      </li>
      <li>
        <a href="Set.jsp">
          <h3>设置</h3>

        </a>
      </li>

    </ul>
  </section>


</section>
