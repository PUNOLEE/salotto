<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.salo.Portfolio" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.salojava.dao.*" %>
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
  <title>查询结果</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <%@include file="WEB-INF/jsp/jss.jsp"%>

  <link rel="stylesheet" href="assets2/css/pop.css" />
  <link rel="stylesheet" href="assets2/css/search.css" />

</head>

<body >

<!-- Wrapper -->
<div id="wrapper">

  <%@include file="WEB-INF/jsp/header.jsp"%>
  <div class="navbar-secondary">
    <nav class="navbar container">
      <div class="navbar-title nav-global-trigger">
        <a href="index.jsp">搜索结果</a>

      </div>
    </nav>

  </div>

  <!-- Main -->
  <div id="main">
    <div class="container-default">
      <!-- Post -->
      <div class="postx">
<%
    String type=(String)request.getAttribute("type");
    System.out.println("type:"+type);
    PortfolioDao pfd=new PortfolioDao();
    List<Portfolio> p=new ArrayList();
  p=pfd.query(type);
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
//    if(type.equals("0")){
//      p=pfd.postPortfolio();}
//    else {
//      p=pfd.postPortfolio(type);
    %>
      <article class="post">
        <header>
          <div class="title">
            <h2><a href="View.jsp?pfid=<%=a.getPfID()%>"> <%=a.getPfTitle()%></a></h2>
            <p><%=a.getPfDescribe()%></p>
          </div>
          <div class="meta">
            <time class="published" datetime="2015-11-01"><%=a.getPfDate()%></time>
            <a href="#" class="author"><span class="name"><%=author.getUName()%></span><img src="uploads/<%=author.getUPhoto()%>" alt="" /></a>
          </div>
        </header>
        <%if(photoName.size()>0){%>
        <div class="">

          <a href="View.jsp?pfid=<%=a.getPfID()%>"  >
            <div class="iii" style="background-image: url('upload/<%=pn[0]%>');
                    ">          </div>
          </a>
          <%
            if(photoName.size()>3){
          %>
          <a href="View.jsp?pfid=<%=a.getPfID()%>" >
            <div class="iiii">

              <div class="x" style="background-image: url('upload/<%=pn[1]%>');width:600px;" >

              </div>

              <div class="z" style="background-image: url('upload/<%=pn[2]%>');width:300px;">
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
      </div>



    </div>

    <!-- Pagination -->
     	<ul class="actions pagination">
            <li><a href="" class="disabled button big previous">Previous Page</a></li>
            <li><a href="#" class="button big next">Next Page</a></li>
        </ul>

  </div>










</div>



</body>
</html>