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
    <%@include file="WEB-INF/jsp/jss.jsp"%>

    <link rel="stylesheet" href="assets2/css/pop.css" />
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
<input type="text" style="display: none;" id="type" value="<%=request.getParameter("type")%>" />
      <div class="postx" >
          <div id="contentx"></div>
          <div class="linetop">
              <div class="alignright x" id="pageCount">
              </div>
          </div>
      </div>


        <%@include file="WEB-INF/jsp/sidebar.jsp"%>



    </div>

    <!-- Pagination -->
    	<%--<ul class="actions pagination">--%>
           <%----%>
        <%--</ul>--%>

  </div>

</div>
<script>
    var curPage = 1;
    var total, pageSize, totalPage;
    $(document).ready(function() {

        getData(1);

    });
    function getPageBar() {
        var pageStr="";

        if (curPage > totalPage)
            curPage = totalPage;
        if (curPage < 1)
            curPage = 1;
        if (curPage == 1) {
            pageStr += "<li class=\"pn\"><a href=\"\" class=\"disabled button big previous\">上一页</a></li>";
        } else {
            pageStr += "<li class=\"pn\"><a href='javascript:getData("+(curPage - 1)+")' class='button big previous'>上一页</a></li>";
        }
        if (curPage >= totalPage) {
            pageStr += "<li class='pn'><a href='#' class='disabled button big next'>Next Page</a></li>";
        } else {
            pageStr += "<li class='pn'><a href='javascript:getData("+((curPage) + 1)+")' class='button big next'>Next Page</a></li>";
        }
        $("#pageCount").html(pageStr);
    }
    function getData(page) {
        console.log(page);
        $.ajax({
            type : 'POST',
            url : 'Location',
            data : {
                'pageno' : page,'type':$("#type").val()
            },
            dataType : 'json',
            success : function(json) {
                console.log("success")
                $("#contentx").empty();
                total = json.total; //总记录数
                pageSize = json.pageSize; //每页显示条数
                curPage = json.page; //当前页
                totalPage =json.totalPage; //总页数

                var list =json.list;//返回内容

                for(var i=0;i<list.length;i++){
                    var body="<article class='post'>";
                    body=body+"<header>";
                    body=body+"<div class='title'>";
                    body=body+"<h2><a href='View.jsp?pfid="+list[i].pfid+"'>"+list[i].title+"</a></h2>";
                    body=body+"<p>"+list[i].describe+"</p>";
                    body=body+"</div><div class='meta'><time class='published' datetime='2015-11-01'>"+list[i].date+"</time>";
                    body=body+"<a href='Account.jsp?uID="+list[i].uid+"' class='author'>";
                    body+="<span class='name'>"+list[i].authorname+"</span><img src='uploads/"+list[i].hp+"' alt='' /></a>";
                    body+="</div></header>";
                    if(list[i].photoname.length<3&&list[i].photoname.length>0){
                        body+="<div><a href='View.jsp?pfid="+list[i].pfid+"'><div class='iii' style='background-image: url(upload/"+list[i].photoname[0].pfPName+");'></div></a></div>";
                    }else if(list[i].photoname.length>3){
                        body+="<div><a href='View.jsp?pfid="+list[i].pfid+"'><div class='iii' style='background-image: url(upload/"+list[i].photoname[0].pfPName+");'></div></a>";
                        body+="<a href='View.jsp?pfid="+list[i].pfid+"'><div class='iiii'><div class='x' style='background-image: url(upload/"+list[i].photoname[1].pfPName+");'></div>";
                        body+="<div class='z' style='background-image: url(upload/"+list[i].photoname[2].pfPName+");'></div></div></a></div>"
                    }
                    body+="<footer><ul class='actions'><li><a href='View.jsp?pfid="+list[i].pfid+"' class='button big'>Continue Reading</a></li></ul>";
                    body+="<ul class='stats'><li><a href='#'>General</a></li><li><a href='#' class='icon fa-heart'>"+list[i].likecount+"</a></li><li><a href='#' class='icon fa-comment'>"+list[i].commentcount+"</a></li>";
                    body+="</ul></footer></article>";
                    $("#contentx").append(body);
                }


            },
            complete : function() { //生成分页条
                getPageBar();
            },
            error : function() {
                alert("数据加载失败");
            }
        });
    }
</script>
</body>
</html>