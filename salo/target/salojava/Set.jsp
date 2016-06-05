<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/3
  Time: 下午3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <title>设置</title>
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
  <center>
    <div class="navbar-secondary">
      <ul class="navbar-subnav">
        <li class="active"><a href="#">设置</a></li>
        <li><a href="#">我的好友</a></li>
        <li><a href="#">相册</a></li>
      </ul>
    </div></center>
  <!-- Main -->
  <div id="main">
    <div class="container-default1">
      <div class="col d6" id="security_settings_menu">
        <ul class="rollover boxed tabs">
          <li class="active">
            <a href="" class="setstyle">个人资料</a>
          </li>
          <li><a href="" class="setstyle set2">通知</a></li>
          <li><a href="" class="setstyle set2">我的收藏</a></li>
          <li><a href="" class="setstyle set2">我的评论</a></li>
        </ul>
      </div>
      <div class="col d6x5 clearafter">
<<<<<<< HEAD
        <form method="post" action="" onsubmit="return reg(this);" autocomplete="off" name="">
=======
        <%
          UserDao userDao=new UserDao();
          user=userDao.finduser(user.getUMail());
        %>
        <form method="post" enctype="multipart/form-data" action="EditServlet" onsubmit="return reg(this);" autocomplete="off" name="" >
>>>>>>> master

        <div class="controlgroup d12x5 g1 margin">

          <h3>
            Information
          </h3>

          <div class="controls" style="min-height: 630px; overflow: visible;">
            <div class="arrow"></div>


            <!-- Username -->

            <div class="checkinfo">
<<<<<<< HEAD
              <label for="username" class="smalllabel">�û���</label>
              <div class="showbox"><input type="text" name="username" id="username" value="" class="full" placeholder="Your username"></div>
=======
              <label for="username" class="smalllabel">用户名</label>
              <div class="showbox"><input type="text" name="username" id="username" value="<%=user.getUName() %> " class="full" placeholder="Your username"></div>
>>>>>>> master
            </div>
            <div class="clear"></div>

            <!-- User email -->
            <div class="check mail"></div>
            <div class="checkinfo shadow_email">
<<<<<<< HEAD
              <label for="email" class="smalllabel">����</label>
              <input type="text" name="email" id="email" value="<%=user.getUMail() %>" class="full" placeholder="" READONLY="readonly">
=======
              <label for="email" class="smalllabel">邮箱</label>
              <input type="text" name="email" id="email" value="<%=user.getUMail() %>" class="full" placeholder="" readonly="readonly">
>>>>>>> master
            </div>
            <div class="clear"></div>

            <!-- User First Name -->
            <div class="check person"></div>
            <div class="checkinfo">
<<<<<<< HEAD
              <label for="firstname" class="smalllabel">��</label>
              <input type="text" name="firstname" id="firstname" value="" class="full" placeholder="Your name">
=======
              <label for="firstname" class="smalllabel">姓</label>
              <input type="text" name="firstname" id="firstname" value="<%=user.getUFirstname() %> " class="full" placeholder="Your name">
>>>>>>> master
            </div>
            <div class="clear"></div>

            <!-- User Last Name -->
            <div class="check person"></div>
            <div class="checkinfo">
<<<<<<< HEAD
              <label for="lastname" class="smalllabel">��</label>
              <input type="text" name="lastname" id="lastname" value="" class="full" placeholder="Your surname">
=======
              <label for="lastname" class="smalllabel">名</label>
              <input type="text" name="lastname" id="lastname" value="<%=user.getULastname() %> " class="full" placeholder="Your surname">
>>>>>>> master
            </div>
            <div class="clear"></div>

            <!-- User Birthday -->
            <div class="check person"></div>
            <div class="checkinfo">
              <label for="birthday" class="smalllabel">生日</label>
              <input type="date" name="birthday" id="birthday" value="<%=user.getUBirthday() %>" class="full" placeholder="YYYY-MM-DD" min="1900-01-01">
            </div>
            <div class="clear"></div>

            <!-- Analytics Tracking Code -->
          </div>
        </div>
        <div class="controlgroup d12x5 g1">
          <h3>About you</h3>
          <div class="controls" style="min-height: 700px; overflow: visible;">
            <div class="arrow"></div>

            <!-- User Avatar -->
            <div class="check screen"></div>
            <div class="checkinfo">

              <div class="settings-avatar-container">
<<<<<<< HEAD
                <a href="" class="settings-avatar-image" style="background-image:url(images2/avatar.jpg);"></a>
=======
                <a href="" class="settings-avatar-image" style="background-image:url(uploads/<%=user.getUPhoto()%>);"></a>
>>>>>>> master
              </div>
              <div class="settings-avatar-upload">
                <div>最大 500Kb 或 500px x 500px .</div>
                <div id="avatar-upload">
                  <input id="user_photo" name="File_upload" type="file" >
                </div>
                <div class="showbox">
                  <a href="javascript:px.deleteUserPhoto()" class="button small red">删除</a>
                </div>
                <div class="clear"></div>
              </div>
            </div>
            <div class="clear"></div>

            <!-- User Biography -->
            <div class="check person"></div>
            <div class="checkinfo">
              <label for="about" class="smalllabel">简介</label>
              <textarea name="about" id="about" class="full" placeholder="Tell us something about you"><%=user.getUDescribe() %></textarea>
            </div>
            <div class="clear"></div>

            <!-- User Gender -->
            <div class="check person"></div>
            <div class="checkinfo">
              <label for="sex_1">性别</label>
              <div  class="showbox">
                <input type="radio" name="sex" id="sex_1" value="1"  <% if(user.getUGender()==1){
              %> checked <%
              }else{%><%}%> >
                <label for="sex_1">男</label>

                <input type="radio" name="sex" id="sex_2" value="2" <% if(user.getUGender()==2){
              %> checked <%
              }else{%><%}%>>
                <label for="sex_2">女</label>

                <input type="radio" name="sex" id="sex_0" value="0" <% if(user.getUGender()==0){
              %> checked <%
              }else{%><%}%>>
                <label for="sex_0">不明确</label>
              </div>
            </div>
            <div class="clear"></div>

            <!-- User Location -->
            <div class="check point"></div>
            <div class="checkinfo">
              <label>地址</label>
              <div class="showbox">
<<<<<<< HEAD
                <input type="text" name="city" id="city" value="" class="full bottom" placeholder="City">
                <input type="text" name="state" id="state" class="full bottom" placeholder="��">
                <input type="text" name="country" id="country" value="" class="full bottom" placeholder="Country">
=======
                <input type="text" name="city" id="city" value="<%=user.getUAddCity() %> " class="full bottom" placeholder="市">
                <input type="text" name="area" id="area" value="<%=user.getUAddArea() %> " class="full bottom" placeholder="区">
                <input type="text" name="country" id="country" value="<%=user.getUAddCountry() %> " class="full bottom" placeholder="国家">

>>>>>>> master
              </div>
            </div>
            <div class="clear"></div>

            <!-- User Equipment -->
            <div class="check gear"></div>
            <div class="checkinfo">
              <!-- add things -->
              <label>设备</label>
              <div class="showbox">
                <ul id="gearlist">
                  <li class="type-camera">
                    <input name="camera[][id]" type="hidden">
<<<<<<< HEAD
                    <input type="text" name="camera" id="camera" class="small"></li>
                  <li class="type-lens"><input type="hidden" name="lens[][id]" value="">
                    <input type="text" name="lens" id="lens" class="small"></li>
                  <li class="type-misc"><input type="hidden" name="misc[][id]" value="">
=======
                    <input type="text" name="camera" id="camera" class="small" value="<%=user.getUCamera() %> "></li>
                  <li class="type-lens"><input type="hidden" name="lens[][id]" value="<%=user.getULens() %> " >
                    <input type="text" name="lens" id="lens" class="small"></li>
                  <li class="type-misc"><input type="hidden" name="misc[][id]" value="<%=user.getUMisc() %> " >
>>>>>>> master
                    <input type="text" name="misc" id="misc" class="small"></li>
                </ul>
              </div>
            </div>
            <div class="clear"></div>
          </div>
        </div>
        <div class="linetop">
          <div class="alignright">
            <input type="submit" class="button green" value="Save changes">
          </div>
          <div class="clear"></div>
        </div>
          </form>
      </div>



    </div>



  </div>





</div>
<script>
  function reg(form){
    if(form.username.value == ""){
      alert("取个好听的名字吧!");
      return false;
    }
    if(form.city.value == ""||form.area.value == ""||form.country.value == ""){
      alert("请填写您的地址!");
      return false;
    }
    alert("确认修改吗？");


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
