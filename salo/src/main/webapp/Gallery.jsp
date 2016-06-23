<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.salo.Likes" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.dao.LikesDao" %>
<%@ page import="com.salojava.salo.Portfolio" %>
<%@ page import="com.salojava.dao.PortfolioPhotosDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.salojava.dao.PortfolioDao" %>

<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/13
  Time: 上午10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <title>相册</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <%@include file="WEB-INF/jsp/jss.jsp"%>
  <link rel="stylesheet" href="assets2/css/pop.css" />

  <link rel="stylesheet" href="assets2/css/light.css" />

  <script src="assets2/js/light/jquery.poptrox.min.js"></script>

</head>
<style>
  .button.more{
    line-height: 2em;
    height: 2em;
    color: #fff !important;
    padding: 0 5px;
    font-weight: inherit;
    background-color: rgba(0,0,0,0.5);
    right: 0;
    margin-right: -10em;
    margin-left: 2em;
    font-size: 0.5em;
    letter-spacing: 2;
  }
</style>
<body >

<!-- Wrapper -->
<div id="wrapper" style="height: 0px">
  <%@include file="WEB-INF/jsp/header.jsp"%>
  <center>
    <div class="navbar-secondary" style="margin-top: -10px;">
      <ul class="navbar-subnav">
        <li ><a href="Set.jsp">设置</a></li>
        <li><a href="Friend.jsp">我的好友</a></li>
        <li class="active"><a href="Gallery.jsp">相册</a></li>
      </ul>
    </div></center>

  <!-- Main -->
  <div id="main" style="margin-top: 3px !important;">
    <%

      PortfolioDao portfolioDao=new PortfolioDao();
      List<Object[]> p=portfolioDao.findUserPhotos(user.getUId());
      String[] pn=new String[p.size()];
      for(int i=0;i<p.size();i++){
        pn[i] = String.valueOf(p.get(i));
        StringUtils stringUtils = null;
        pn[i] = stringUtils.substringBetween(pn[i], "=", "}");
      }
      for(int j=0;j<pn.length;j++){
        PortfolioPhotosDao photos=new PortfolioPhotosDao();
        List<Object[]> photoName=photos.findPhotos(Integer.parseInt(pn[j]));
        String pm=String.valueOf(photoName.get(0));
        StringUtils stringUtils = null;
        pm = stringUtils.substringBetween(pm, "=", "}");
        Portfolio portfolio=new Portfolio();
        portfolio=portfolioDao.findportfolio(Integer.parseInt(pn[j]));
    %>
    <article class="thumb">
      <a href="upload/<%=pm%>" class="image"><img src="upload/<%=pm%>" alt="" /></a>
      <h2><%=portfolio.getPfTitle()%></h2>
      <p><%=portfolio.getPfDescribe()%><a href="View.jsp?pfid=<%=portfolio.getPfID()%>" class="button more">  more</a></p>

    </article>
    <%}%>



  </div>


</div>

<script src="assets2/js/light/main.js"></script>

</body>
</html>