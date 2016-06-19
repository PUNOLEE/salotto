<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/2
  Time: 上午11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <title>注册</title>
  <meta http-equiv="Content-Type" contentType="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--[if lte IE 8]><script src="assets2/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="assets2/css/main.css" />
  <link rel="stylesheet" href="assets2/css/pop.css" />
  <link rel="stylesheet" href="assets2/css/sl.css" />

  <!--[if lte IE 9]><link rel="stylesheet" href="assets2/css/ie9.css" /><![endif]-->
  <!--[if lte IE 8]><link rel="stylesheet" href="assets2/css/ie8.css" /><![endif]-->
</head>

<body >

<!-- Wrapper -->
<div id="wrapper" class="wrapper-styleu">


  <!-- Header -->

  <header id="header">
    <img src="images2/logo.png" class="logo">
    <h1><a href="index.jsp">SALOTTO 沙龙</a></h1>
    <nav class="links">
      <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="#">图</a></li>
        <li><a href="#">活动</a></li>
        <li><a href="#">资讯</a></li>
        <li><a href="#">论坛</a></li>
        <li><a href="#">红娘</a></li>
      </ul>
    </nav>
    <nav class="main">
      <ul>
        <li><a  href="Login.jsp" class="signupbtn">登录</a></li>

      </ul>
    </nav>
  </header>

  <!-- Main -->
  <div id="main">
    <div class="container-default1" style="height: 700px;">

      <div class="controlgroup d12x5 g1 margin" id="signup">

        <h3>
          signup
        </h3>
        <form method="post" action="Register" onsubmit="return reg(this);" autocomplete="off" name="signup1">

        <div class="controls" style="min-height: 450px; overflow: visible;">
          <div class="arrow"></div>



          <!-- User email -->
          <div class="check mail"></div>
          <div class="checkinfo shadow_email">
            <label for="email" class="smalllabel">邮箱</label>
            <input type="text" name="email" id="email" value="" class="full" placeholder="your@email.com">
          </div>
          <div class="clear"></div>

          <!-- Password -->

          <div class="checkinfo">
            <label for="password" class="smalllabel">密码</label>
            <div class="showbox"><input type="password" name="password" id="upassword" value="" class="full" placeholder=""></div>
          </div>
          <div class="checkinfo">
            <label for="password" class="smalllabel">确认密码</label>
            <div class="showbox"><input type="password" name="password" id="password" value="" class="full" placeholder="" onkeyup="pw()"></div>
          </div>
          <div class="clear"><span id="tishi"></span></div>

          <input type="submit" class="button login" value="注册">

          <!-- Analytics Tracking Code -->
        </div>
          </form>
      </div>






    </div>



  </div>





</div>
<script>
  function pw() {
    var pw1 = document.getElementById("upassword").value;
    var pw2 = document.getElementById("password").value;
    if(pw1 == pw2) {
      document.getElementById("tishi").innerHTML="<font color='green'>Correct password</font>";
      document.getElementById("submit").disabled = false;
    }
    else {
      document.getElementById("tishi").innerHTML="<font color='red'>Please enter the same password</font>";
      document.getElementById("submit").disabled = true;
    }
  }
  function reg(form){
    if(form.email.value == ""){
      alert("email can't be empty!");
      return false;
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
