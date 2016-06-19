<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.salo.Portfolio" %>
<%@ page import="com.salojava.dao.PortfolioDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.salojava.dao.PortfolioPhotosDao" %>
<%@ page import="com.salojava.salo.PortfolioPhotos" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/13
  Time: 上午9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <title>好图分享</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--[if lte IE 8]><script src="assets2/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="assets2/css/main.css" />
  <link rel="stylesheet" href="assets2/css/pop.css" />
  <!--[if lte IE 9]><link rel="stylesheet" href="assets2/css/ie9.css" /><![endif]-->
  <!--[if lte IE 8]><link rel="stylesheet" href="assets2/css/ie8.css" /><![endif]-->
</head>

<body >

<!-- Wrapper -->
<div id="wrapper">

  <%@include file="WEB-INF/jsp/header.jsp"%>
  <div class="navbar-secondary">
    <nav class="navbar container">
      <div class="navbar-title nav-global-trigger">
        <a href="index.jsp">首页<span class="icon fa-angle-down"></span></a>

      </div>
    </nav>
    <ul class="navbar-subnav">
        <%
            if(request.getParameter("type").equals("0")){
                out.print("<li class=\"active\">");
            }else{
                out.print("<li>");
            }
        %>
      <a href="Pictures.jsp?type=0">动态</a></li>

        <%
            if(request.getParameter("type").equals("10000000")){
                out.print("<li class=\"active\">");
            }else{
                out.print("<li>");
            }
        %>
      <a href="Pictures.jsp?type=10000000">人像</a></li>
        <%
            if(request.getParameter("type").equals("10000001")){
                out.print("<li class=\"active\">");
            }else{
                out.print("<li>");
            }
        %>
      <a href="Pictures.jsp?type=10000001">风光</a></li>
        <%
            if(request.getParameter("type").equals("10000005")){
                out.print("<li class=\"active\">");
            }else{
                out.print("<li>");
            }
        %>
        <a href="Pictures.jsp?type=10000005">人文</a></li>
        <%
            if(request.getParameter("type").equals("10000002")){
                out.print("<li class=\"active\">");
            }else{
                out.print("<li>");
            }
        %>
      <a href="Pictures.jsp?type=10000002">纪实</a></li>
        <%
            if(request.getParameter("type").equals("10000111")){
                out.print("<li class=\"active\">");
            }else{
                out.print("<li>");
            }
        %>
      <a href="Pictures.jsp?type=10000111">尼康</a></li>
    </ul>
  </div>

  <!-- Main -->
  <div id="main">
    <div class="container-default">
      <!-- Post -->

      <div class="postx">
          <%
              String type=request.getParameter("type");
              PortfolioDao pfd=new PortfolioDao();
              List<Portfolio> p=new ArrayList();
              if(type.equals("0")){
              p=pfd.postPortfolio();}
              else p=pfd.postPortfolio(type);
              for (Portfolio a:p){
                  User author=new User();
                  UserDao authordao=new UserDao();
                  author=authordao.findbyID(a.getUID());
                  PortfolioPhotosDao photos=new PortfolioPhotosDao();
                  List<Object[]> photoName=new ArrayList();
                  System.out.println(a.getPfID());
                  photoName=photos.findPhotos(a.getPfID());
                  String[] pn=new String[photoName.size()];

                  System.out.println(photoName.size());
                  for(int i=0;i<photoName.size();i++) {
                      pn[i] = String.valueOf(photoName.get(i));
                      StringUtils stringUtils = null;
                      pn[i] = stringUtils.substringBetween(pn[i], "=", "}");
                      System.out.println(pn[i]);
                  }

          %>
        <article class="post">
          <header>
            <div class="title">
              <h2><a href="View.jsp?pfid=<%=a.getPfID()%>"> <%=a.getPfTitle()%></a></h2>
              <p><%=a.getPfDescribe()%></p>
            </div>
            <div class="meta">
              <time class="published" datetime="2015-11-01"><%=a.getPfDate()%></time>
              <a href="Account.jsp?uID=<%=author.getUId()%>" class="author"><span class="name"><%=author.getUName()%></span><img src="uploads/<%=author.getUPhoto()%>" alt="" /></a>
            </div>
          </header>
            <%if(photoName.size()>0){%>
          <div class="">

            <a href="View.jsp?pfid=<%=a.getPfID()%>"  >
              <div class="iii" style="background-image: url('upload/<%=pn[0]%>');
">          </div>
            </a>
              <%
                  if(photoName.size()>=3){
              %>
            <a href="View.jsp?pfid=<%=a.getPfID()%>" >
              <div class="iiii">

                <div class="x" style="background-image: url('upload/<%=pn[1]%>');">

                </div>

                <div class="z" style="background-image: url('upload/<%=pn[2]%>');">
                </div></div></a><%}%>
          </div><%}%>
          <footer>
            <ul class="actions">
              <li><a href="View.jsp?pfid=<%=a.getPfID()%>" class="button big">Continue Reading</a></li>
            </ul>
            <ul class="stats">
              <li><a href="#">General</a></li>
              <li><a href="#" class="icon fa-heart"><%=a.getPfLikesCount()%></a></li>
              <li><a href="#" class="icon fa-comment"><%=a.getPfCommentCount()%></a></li>
            </ul>
          </footer>
        </article>
          <%}
          %>
          <div class="linetop">
              <div class="alignright x">
          <li class="pn"><a href="" class="disabled button big previous">Previous Page</a></li>
          <li class="pn"><a href="#" class="button big next">Next Page</a></li>
                  <div class="clear"></div>
              </div>
              </div>
      </div>
      <section id="sidebar">


        <!-- Mini Posts -->
        <section class="ps">
          <div class="mini-posts">

            <!-- Mini Post -->
            <article class="mini-post">
              <header>
                <h3><a href="#">绿腰</a></h3>
                <time class="published" datetime="2016-4-29">April 29, 2016</time>
                <a href="#" class="author"><img src="images2/avatar.jpg" alt="" /></a>
              </header>
              <a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
            </article>

            <!-- Mini Post -->
            <!-- 	<article class="mini-post">
                    <header>
                        <h3><a href="#">一半</a></h3>
                        <time class="published" datetime="2016-5-02">May 02, 2016</time>
                        <a href="#" class="author"><img src="images/avatar.jpg" alt="" /></a>
                    </header>
                    <a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
                </article> -->

            <!-- Mini Post -->
            <!-- 	<article class="mini-post">
                    <header>
                        <h3><a href="#">韶华易逝，人易老</a></h3>
                        <time class="published" datetime="2016-04-06">April 18, 2016</time>
                        <a href="#" class="author"><img src="images/avatar.jpg" alt="" /></a>
                    </header>
                    <a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
                </article>
-->
            <!-- Mini Post -->
            <!-- 	<article class="mini-post">
                    <header>
                        <h3><a href="#">ねこさんのばん</a></h3>
                        <time class="published" datetime="2016-03-21">March 21, 2016</time>
                        <a href="#" class="author"><img src="images/avatar.jpg" alt="" /></a>
                    </header>
                    <a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
                </article> -->

          </div>
        </section>

        <!-- Posts List -->
        <section class="ps2">
          <ul class="posts">
            <li>
              <article>
                <header>
                  <h3><a href="#">西湖夜景</a></h3>
                  <time class="published" datetime="2015-10-20">March 10, 2016</time>
                </header>
                <a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
              </article>
            </li>
            <li>
              <article>
                <header>
                  <h3><a href="#">乱花渐欲迷人眼</a></h3>
                  <time class="published" datetime="2015-10-15">March 25, 2016</time>
                </header>
                <a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
              </article>
            </li>
            <li>
              <!-- <article>
                  <header>
                      <h3><a href="#">Bad boy</a></h3>
                      <time class="published" datetime="2015-10-10">March 10, 2016</time>
                  </header>
                  <a href="#" class="image"><img src="images/pic12.jpg" alt="" /></a>
              </article>
          </li>
          <li>
              <article>
                  <header>
                      <h3><a href="#">双生</a></h3>
                      <time class="published" datetime="2015-10-08">May 02, 2016</time>
                  </header>
                  <a href="#" class="image"><img src="images/pic11.jpg" alt="" /></a>
              </article>
          </li>
          <li>
              <article>
                  <header>
                      <h3><a href="#">气球</a></h3>
                      <time class="published" datetime="2015-10-06">May 14, 2016</time>
                  </header>
                  <a href="#" class="image"><img src="images/pic10.jpg" alt="" /></a>
              </article>
          </li> -->
          </ul>
        </section>

        <!-- About -->
        <section class="blurb">
          <h1>About</h1>
          <h3>沙龙（Salotto）—— 一个摄影爱好者的基地</h3>
          <p>"Salotto" ：志趣相投，聚会一堂。</br>
            《沙龙》陈奕迅：一首谈论摄影与人生的关系，形容摄影就是将生活每个细节拍下，留住时间和记忆。</p>
          <ul class="actions">
            <li><a href="#" class="button">Learn More</a></li>
          </ul>
        </section>

        <!-- Footer -->
        <section id="footer">
          <ul class="icons">
            <li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
            <li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
          </ul>
          <p class="copyright">&copy;PunoLee.</p>
        </section>

      </section>


    </div>

    <!-- Pagination -->
    	<%--<ul class="actions pagination">--%>
           <%----%>
        <%--</ul>--%>

  </div>










</div>

<!-- Scripts -->
<script src="assets2/js/jquery.min.js"></script>
<script src="assets2/js/skel.min.js"></script>
<script src="assets2/js/util.js"></script>
<!--[if lte IE 8]><script src="assets2/js/ie/respond.min.js"></script><![endif]-->
<script src="assets2/js/main.js"></script>

</body>
</html>