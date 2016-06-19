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
  <title>浏览</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--[if lte IE 8]><script src="assets2/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="assets2/css/main.css" />
  <link rel="stylesheet" href="assets2/css/light.css" />

  <!--[if lte IE 9]><link rel="stylesheet" href="assets2/css/ie9.css" /><![endif]-->
  <!--[if lte IE 8]><link rel="stylesheet" href="assets2/css/ie8.css" /><![endif]-->
  <script src="assets2/js/jquery.min.js"></script>
  <script src="assets2/js/light/jquery.poptrox.min.js"></script>
  <script language="javascript">

    function styleChange(s) {
      switch (s)
      {
        case 1: {
          var cssLink = document.getElementById("ButtonIWant");
          if (cssLink.className == "icon fa-heart") {
            cssLink.className = "icon alt fa-heart";
          }
          else
            cssLink.className = "icon fa-heart";
        }
          break;
        default:
          break;
      }

    }
  </script>
  <style type="text/css">
    .icon.alt.fa-heart{
      color: #2ebaae !important;
    }
  </style>
</head>
<body >

<!-- Wrapper -->
<div id="wrapper" >
  <%@include file="WEB-INF/jsp/header.jsp"%>
  <header id="header2">

    <nav>
      <ul>
        <li><a href="#footer" class="icon fa-info-circle">有关</a></li>
      </ul>
    </nav>
  </header>

  <!-- Main -->
  <div id="main">
    <%
      int pfid=Integer.parseInt(request.getParameter("pfid"));
      User author=new User();
      UserDao authordao=new UserDao();

      PortfolioPhotosDao pfpd=new PortfolioPhotosDao();
      PortfolioDao portfolioDao=new PortfolioDao();
      Portfolio portfolio=portfolioDao.findportfolio(pfid);
      author=authordao.findbyID(portfolio.getUID());
      List<Object[]> pName=new ArrayList();
      pName=pfpd.findPhotos(pfid);
      for(Object b:pName){
        String x=b.toString();
        StringUtils stringUtils=null;
        x=stringUtils.substringBetween(x,"=","}");
    %>
    <article class="thumb">
      <a href="upload/<%=x%>" class="image"><img src="upload/<%=x%>" alt="" /></a>
      <h2><%=portfolio.getPfTitle()%></h2>
      <p><%=portfolio.getPfDescribe()%></p>
    </article>
    <%}%>



  </div>
  <footer id="footer" class="panel">
    <div class="inner split">
      <div>
        <section class="contenti">
          <input type="text" style="display: none" id="pfid" value="<%=pfid%>">
          <input type="text" style="display: none" id="LikesuID" value="<%=user.getUId()%>">
          <input type="text" style="display: none" id="authorID" value="<%=author.getUId()%>">
          <a href="" class="cheader"><h2><%=portfolio.getPfTitle()%></h2></a>
          <span> Photo by <%=author.getUName()%></span>
          <ul >
            <li><a href="#" class="icon fa-camera"><span class="label"></span></a><%=author.getUCamera()%></li>
            <li><a href="#" class="icon fa-circle"><span class="label"></span></a> <%=author.getULens()%></li>
            <li><a href="#" class="icon fa-picture-o"><span class="label"></span></a> <%=author.getUMisc()%></li>
            <li><a href="#" class="icon fa-calendar"><span class="label"></span></a> <%=portfolio.getPfDate()%>
            </li>

          </ul>


        </section>
        <section>
          <ul class="icons">
            <%LikesDao likesDao=new LikesDao();
              if(!likesDao.LikeIsExist(user.getUId(),pfid)){
                out.print("<li><a href=\"javascript:styleChange(1)\" id=\"ButtonIWant\" class=\"icon alt fa-heart\" onclick=\"like()\">");
                out.print("<span class=\"label\">Likes</span></a>");
                out.print("<span id=\"likes\">");
                out.print(portfolio.getPfLikesCount());
                out.print("</span></li>");
              }else{
                out.print("<li><a href=\"javascript:styleChange(1)\" id=\"ButtonIWant\" class=\"icon fa-heart\" onclick=\"like()\">");
                out.print("<span class=\"label\">Likes</span></a>");
                out.print("<span id=\"likes\">");
                out.print(portfolio.getPfLikesCount());
                out.print("</span></li>");
              }
            %>

            <%--<li><a href="javascript:styleChange(1)" id="ButtonIWant" class="icon fa-heart" onclick="like()"><span class="label">Likes</span></a><span id="likes"><%=portfolio.getPfLikesCount()%></span></li>--%>

            <li><a href="#" class="icon fa-share"><span class="label">Share</span></a></li>
            <li><a href="#" class="icon fa-star"><span class="label">Star</span></a></li>
            <li><a href="#" class="icon fa-ellipsis-h"><span class="label">more</span></a></li>

          </ul>
        </section>

      </div>
      <div>
        <section>
          <form >

            <div class="field half first">
              <a href="#" >
                <div class="author" id="account"><img src="uploads/<%=user.getUPhoto()%>" alt="" /></div>
                <h3 class="bar2"><%=user.getUName()%></h3>

              </a>
            </div>
            <div class="field">
              <textarea name="message" id="message" rows="4" placeholder="说点啥"></textarea>
            </div>

            <ul class="actions">
              <li><input type="button" value="评论" class="special" onclick="submitc()" /></li>
              <li><input type="reset" value="清空" id="reset"/></li>
            </ul>
          </form>
        </section>
      </div>
    </div>
  </footer>


</div>

<!-- Scripts -->
<script>
  function submitc(){
    if($("#message").val()==""){
      alert("请说点啥吧！")
    }else {
      var x = {pfid: $("#pfid").val(),message: $("#message").val(), uID: $("#LikesuID").val(),authorID:$("#authorID").val()};
      console.log(x);
      $.ajax(
              {
                url: "Comment",
                type: "POST",
                data: x,
                dataType: "json",
                success: function (data) {
                    if(data.msg=="success"){
                      alert("评论成功！");
                      $("#reset").click();
                    }
                }

              }
      );
    }
  }
</script>
<script>
  function like() {
    var va=document.getElementById("likes").innerText;
    var i=parseInt(va);
    console.log(i)
    var y;
    if (document.getElementById("ButtonIWant").className == "icon fa-heart") {
      var j = {pfid: $("#pfid").val(), uID: $("#LikesuID").val(),Yes:"1"};
      y=1;
    }else{
      var j = {pfid: $("#pfid").val(), uID: $("#LikesuID").val(),Yes:"0"};
      y=0;
    }
    console.log(j);

      $.ajax(
              {
                url: "Like",
                type: "POST",
                data: j,
                dataType: "json",
                success: function (data) {
                  if(data.option=='1'){
                    i=i+1;
                    console.log(i);
                    document.getElementById("likes").innerText=i;
                    console.log(document.getElementById("likes").innerText);
                  }else{
                    i=i-1;
                    console.log(i);
                    document.getElementById("likes").innerText=i;
                    console.log(document.getElementById("likes").innerText);
                  }
                }

              }
      );

  }
</script>
<script src="assets2/js/skel.min.js"></script>
<script src="assets2/js/util.js"></script>
<script src="assets2/js/main.js"></script>
<!--[if lte IE 8]><script src="assets2/js/ie/respond.min.js"></script><![endif]-->
<script src="assets2/js/light/main.js"></script>

</body>
</html>