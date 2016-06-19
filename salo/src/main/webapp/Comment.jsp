<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.dao.portfolioCommentsDao" %>
<%@ page import="com.salojava.salo.portfolioComments" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
  <title>我的评论</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--[if lte IE 8]><script src="assets2/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="assets2/css/main.css" />
  <link rel="stylesheet" href="assets2/css/pop.css" />
  <link rel="stylesheet" href="assets2/css/sl.css" />

  <!--[if lte IE 9]><link rel="stylesheet" href="assets2/css/ie9.css" /><![endif]-->
  <!--[if lte IE 8]><link rel="stylesheet" href="assets2/css/ie8.css" /><![endif]-->
</head>
<body>
<div id="wrapper">
  <%@include file="WEB-INF/jsp/header.jsp"%>
  <%
      portfolioCommentsDao pfcd=new portfolioCommentsDao();
      List<portfolioComments> Comments=new ArrayList();
      Comments=pfcd.findComments(user.getUId());

      %>
  <center>
    <div class="navbar-secondary">
      <ul class="navbar-subnav">
        <li class="active"><a href="#">设置</a></li>
        <li><a href="#">我的好友</a></li>
        <li><a href="#">相册</a></li>
      </ul>
    </div></center>
    <div id="main">
      <div class="container-default1">
        <div class="col d6" id="security_settings_menu">
          <ul class="rollover boxed tabs">
            <li >
              <a href="Set.jsp" class="setstyle">个人资料</a>
            </li>
            <li><a href="" class="setstyle set2">通知</a></li>
            <li><a href="" class="setstyle set2">我的收藏</a></li>
            <li class="active"><a href="Comment.jsp" class="setstyle set2">我的评论</a></li>
          </ul>
        </div>
        <div class="col d6x5 clearafter">

          <div class="controlgroup d12x5 g1 margin comment">
            <h3>
              Comments
            </h3>
            <div class="controls" style="min-height: 630px; overflow: hidden;">
              <%  for(portfolioComments b:Comments){
                UserDao otheruserdao=new UserDao();
                User otheruser=new User();
                otheruser=otheruserdao.findbyID(b.getUID());
              %>
              <div class="checkinfo comment">

                <div class="settings-avatar-container">

                  <a href="" class="settings-avatar-image" style="background-image:url(uploads/<%=otheruser.getUPhoto()%>);"></a>
                </div>
                <div class="settings-avatar-upload">
                  <div> <%=otheruser.getUName()%>.</div>
                  <div id="avatar-upload">
                    <div class="xxcomment">
                      <%=b.getPFCommentsContent()%>
                      <br>
                      <%=b.getPFCommentsDate()%>
                    </div>
                  </div>

                </div>
                <div class="xxaction">
                  <a type="button" id="reply" class="button comment" href="#mycomment" onclick="cdisplay()">回复</a>
                  <a type="button"  class="button comment" href="Delete?pfCID=<%=b.getPFCommentsID()%>">删除</a>

                </div>
                <div class="mycomment" style="display: none;" id="mycomment">
                  <input type="text" style="display: none" id="LikesuID" value="<%=user.getUId()%>">
                  <input type="text" style="display: none" id="authorID" value="<%=otheruser.getUId()%>">

                  <textarea  class="full" id="message2" name="message2"></textarea>
                  <input type="button" id="" class="button comment" value="确认回复" onclick="submitx()"/>
                  <input type="reset" value="清空" id="reset" class="button comment"/>
                </div>

              </div>
              <% }%>
            </div>
          </div>


        </div>
      </div>
  </div>
<script>
  function cdisplay(){
    if(document.getElementById("mycomment").style.display=="none"){
    document.getElementById("mycomment").style.display="block";}
    else{
      document.getElementById("mycomment").style.display="none";
    }
  }
  function submitx(){
    if($("#message2").val()==""){
      alert("请说点啥吧！")
    }else {
      var x = {message: $("#message2").val(), uID: $("#LikesuID").val(),authorID:$("#authorID").val()};
      console.log(x);
      $.ajax(
              {
                url: "Comment",
                type: "POST",
                data: x,
                dataType: "json",
                success: function (data) {
                  if(data.msg=="success"){
                    alert("回复成功！");
                   window.location.reload();
                  }
                }

              }
      );
    }
  }
</script>
    <!-- Scripts -->
    <script src="assets2/js/jquery.min.js"></script>
    <script src="assets2/js/skel.min.js"></script>
    <script src="assets2/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets2/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets2/js/main.js"></script>

</body>
</html>
