<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.dao.PortfolioDao" %>
<%@ page import="com.salojava.salo.Portfolio" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.salojava.dao.PortfolioPhotosDao" %>
<%@ page import="com.salojava.salo.Follow" %>
<%@ page import="com.salojava.dao.FollowDao" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/18
  Time: 下午11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
  <title>我的主页</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--[if lte IE 8]>
  <script src="assets2/js/ie/html5shiv.js"></script>
  <![endif]-->
  <!-- 	<link rel="stylesheet" href="assets2/css/main.css" />
   -->		<link rel="stylesheet" href="assets2/css/my-main.css" />
  <link rel="stylesheet" href="assets2/css/sl.css" />



  <!--[if lte IE 8]>
  <link rel="stylesheet" href="assets2/css/ie8.css" />
  <![endif]-->
  <script src="assets2/js/jquery.min.js"></script>
  <script language="javascript">

    function styleChange(s) {
      var cssLink2=document.getElementById("unfollowbtn");
      var cssLink = document.getElementById("followbtn");

      switch (s)
      {
        case 1: {
          if (cssLink.style.display='block') {
            cssLink.style.display='none';
            cssLink2.style.display='block';
          }
          else if(cssLink.style.display='none'){
            cssLink.style.display='block';
          cssLink2.style.display='none';
        }} break;
        case 2:{
          if (cssLink2.style.display='block') {
            cssLink2.style.display='none';
            cssLink.style.display='block';
          }
          else if(cssLink2.style.display='none'){
            cssLink2.style.display='block';
            cssLink.style.display='none';
          }
        }
          break;
        default:
          break;
      }

    }
  </script>
</head>
<body id="top">

<div id="wrapper" style="height:42;width:100%;">
  <!-- Header -->
  <header id="real-header">
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
        <li><a  href="Login.jsp" class="signupbtn">登录</a></li>
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
    </section><%}%>


  </section>

</div>
<div>
  <%
    UserDao authorDao=new UserDao();
    User author=new User();
    author=authorDao.findbyID(Integer.parseInt(request.getParameter("uID")));
    FollowDao followDao=new FollowDao();
    List<User> followers=followDao.findfollowers(author.getUId());
    List<User> following=followDao.findfollowing(author.getUId());

  %>
  <div id="fade" class="black_overlay"></div>
  <div id="followers-detail" class="white_content">
    <div class="contain">
      <div class="contain-header">
        <h3>Followers</h3>
        <span class="count" style="margin:5px !important"><%=author.getUFollower()%></span>
        <div class="close" onclick="document.getElementById('followers-detail').style.display='none'; document.getElementById('fade').style.display='none'" >×</div>
      </div>
      <div class="contain-list">
        <ul class="actors">
<%
  for (User a :followers){
  if(user!=null&&user.getUId()==a.getUId()){
%>
          <li class="actor">
            <div class="left">
              <a href="#" class="avatar" style="background-image:url('uploads/<%=a.getUPhoto()%>');"></a>
              <div class="actor-info">
                <a class="name" href="Account.jsp?uID=<%=a.getUId()%>"><%=a.getUName()%></a>
                <span class="description"><%=a.getUFollower()%> followers</span>
              </div>
            </div>
            <div class="right">
              <ul class="actions">
                <li style="padding-top: 10px;" >
                  <a href="Account.jsp?uID=<%=a.getUId()%>" class="button" >我的主页</a>
                </li>
              </ul>
            </div>
          </li>
          <%}else{%>
          <li class="actor">
            <div class="left">
              <a href="#" class="avatar" style="background-image:url('uploads/<%=a.getUPhoto()%>');"></a>
              <div class="actor-info">
                <a class="name" href="Account.jsp?uID=<%=a.getUId()%>"><%=a.getUName()%></a>
                <span class="description"><%=a.getUFollower()%> followers</span>
              </div>
            </div>
            <div class="right">
              <ul class="actions">
                <li style="padding-top: 10px;" >
                  <a href="#" class="button" >+Follow</a>
                </li>
              </ul>
            </div>
          </li>
<%}}%>


        </ul>
      </div>
    </div>
  </div>

  <div id="following-detail" class="white_content">
    <div class="contain">
      <div class="contain-header">
        <h3>Following</h3>

        <span class="count" style="margin:5px !important"><%=author.getUFollowing()%></span>
        <div class="close" onclick="document.getElementById('following-detail').style.display='none'; document.getElementById('fade').style.display='none'" >×</div>
      </div>
      <div class="contain-list">
        <ul class="actors">
          <%
            for (User a :following){
          %>
          <li class="actor">
            <div class="left">
              <a href="#" class="avatar" style="background-image:url('uploads/<%=a.getUPhoto()%>')"></a>
              <div class="actor-info">
                <a class="name" href="Account.jsp?uID=<%=a.getUId()%>"><%=a.getUName()%></a>
                <span class="description"><%=a.getUFollower()%> followers</span>
              </div>
            </div>
            <div class="right">
              <ul class="actions">
                <li style="padding-top: 10px;" >
                  <a href="#" class="button" >Follow</a>
                </li>
              </ul>
            </div>
          </li><%}%>


        </ul>
      </div>
    </div>
  </div>

  <!-- Header -->
  <header id="header" style="margin-top: 42px; background-position: 0% 0px;">
<%

%>
    <div class="test" style="float:left;">
      <input type="text" style="display: none;" id="foID" value="<%=author.getUId()%>">
      <%if (user!=null){%>
      <input type="text" style="display: none;" id="uID" value="<%=user.getUId()%>"><%}%>
    </div>
    <a href="#" class="image avatar">
      <img src="uploads/<%=author.getUPhoto()%>" alt="" />
    </a>
    <h1> <strong><%=author.getUName()%></strong>
    </h1>
    <%
      if(user!=null&&user.getUId()!=author.getUId()){
    %>
    <ul class="actions">
      <li style="padding-top: 10px;" id="followinfo" >
        <%
          if(!followDao.FollowIsExist(user.getUId(),author.getUId())){
%>
        <a href="javascript:styleChange(2)" class="button disable" id="unfollowbtn"  onclick="follow(0)">√Following</a>

        <%
          }else{%>
        <a href="javascript:styleChange(1)" class="button" id="followbtn" onclick="follow(1)" >+Follow</a>

        <%
          }
        %>

      </li>
    </ul>
    <%}%>
    <ul class="details" >
      <li class="affection">
        <div>
          <span>0</span>
          Affection
        </div>
      </li>
      <li class="views">
        <div>
          <span>0</span>
          Photo Views
        </div>
      </li>
      <li class="followers">
        <div>
          <span id="follower"><%=author.getUFollower()%></span>
          <a style="color:#a2a2a2;" onclick="document.getElementById('followers-detail').style.display='block'; document.getElementById('fade').style.display='block'" >Followers</a>
        </div>
      </li>
      <li class="following">
        <div>
          <span><%=author.getUFollowing()%></span>
          <a style="color:#a2a2a2 ;" onclick="document.getElementById('following-detail').style.display='block'; document.getElementById('fade').style.display='block'" >Following</a>
        </div>
      </li>
    </ul>
  </header>

  <!-- Main -->
  <div id="main">

    <!-- One -->
    <section id="one">
      <header class="major">
        <h2><%if(author.getUDescribe().equals(""))
                out.print("这个人很懒，什么都没写");else out.print(author.getUDescribe());%></h2>
      </header>
      <p>Welcome to my blog !</p>
    </section>

    <!-- Two -->
    <section id="two">
      <h2>Recent Work</h2>
      <div class="row">
        <%
          PortfolioDao portfolioDao=new PortfolioDao();
          List<Object[]> p=portfolioDao.findUserPhotos(author.getUId());
          String[] pn=new String[p.size()];
          for(int i=0;i<p.size();i++){
            pn[i] = String.valueOf(p.get(i));
            StringUtils stringUtils = null;
            pn[i] = stringUtils.substringBetween(pn[i], "=", "}");
            System.out.println(pn[i]);
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
        <article class="6u 12u$(xsmall) work-item">
          <a href="View.jsp?pfid=<%=pn[j]%>" class="image fit thumb">
            <img src="upload/<%=pm%>" alt="" />
          </a>
          <h3><%=portfolio.getPfTitle()%></h3>
          <p><%=portfolio.getPfDescribe()%></p>
        </article>
        <%}%>

      </div>
      <ul class="actions">
        <li>
          <a href="#" class="button">Full Portfolio</a>
        </li>
      </ul>
    </section>


<%
  if(user!=null&&user.getUId()!=author.getUId()){
%>
    <!-- Three -->
    <section id="three">
      <h2>留言</h2>
      <p>
        给他留言吧~
      </p>
      <div class="row">
        <div class="8u 12u$(small)">
          <form method="post" action="#">
            <div class="row uniform 50%">
              <div class="12u$">
                <textarea name="message" id="message" placeholder="Message" rows="4"></textarea>
              </div>
            </div>
          </form>
          <ul class="actions">
            <li>
              <input type="button" value="Send Message" onclick="sendmessage()"/>
            </li>
          </ul>
        </div>
        <div class="4u$ 12u$(small)">
          <ul class="labeled-icons">

            <li>
              <h3 class="icon fa-envelope-o">
                <span class="label">Email</span>
              </h3>
              <a href="#"><%=author.getUMail()%></a>
            </li>
          </ul>
        </div>
      </div>
    </section>
<%}%>
  </div>

  <!-- Footer -->
  <footer id="footer">
    <ul class="icons">
      <li>
        <a href="#" class="icon fa-twitter">
          <span class="label">Twitter</span>
        </a>
      </li>
      <li>
        <a href="#" class="icon fa-github">
          <span class="label">Github</span>
        </a>
      </li>
      <li>
        <a href="#" class="icon fa-dribbble">
          <span class="label">Dribbble</span>
        </a>
      </li>
      <li>
        <a href="#" class="icon fa-envelope-o">
          <span class="label">Email</span>
        </a>
      </li>
    </ul>
  </footer>

  <!-- Scripts -->
  <script>
    function follow(x){
      var va=document.getElementById("follower").innerText;
      var i=parseInt(va);
      console.log(i)
      var j={foID:$("#foID").val(),uID:$("#uID").val(),Yes:x};

      console.log(j);
      $.ajax(
              {
                url: "Follow",
                type: "POST",
                data: j,
                dataType: "json",
                success: function (data) {
                 console.log("success");
                  if(data.option=='1'){
                    document.getElementById("followinfo").innerHTML="<a href=\"javascript:styleChange(2)\" class=\"button disable\" id=\"unfollowbtn\"  onclick=\"follow(0)\">√Following</a>\n";
                    i=i+1;
                    console.log(i);
                    document.getElementById("follower").innerText=i;
                    console.log(document.getElementById("follower").innerText);
                  }else{
                    document.getElementById("followinfo").innerHTML="<a href=\"javascript:styleChange(1)\" class=\"button \" id=\"followbtn\"  onclick=\"follow(1)\">+Follow</a>\n";
                    i=i-1;
                    console.log(i);
                    document.getElementById("follower").innerText=i;
                    console.log(document.getElementById("follower").innerText);
                  }
                }

              }
      );


    }
  </script>
  <script>
    function sendmessage(){
      if($("#message").val()==""){
        alert("请说点啥吧！")
      }else {
        var x = {message: $("#message").val(), uID: $("#uID").val(),authorID:$("#foID").val()};
        console.log(x);
        $.ajax(
                {
                  url: "Comment",
                  type: "POST",
                  data: x,
                  dataType: "json",
                  success: function (data) {
                    if(data.msg=="success"){
                      alert("留言成功！");
                      window.location.reload();
                    }
                  }

                }
        );
      }
    }
  </script>
  <script src="assets2/js/skel.min.js"></script>
  <script src="assets2/js/util.js"></script>
  <script src="assets2/js/main.js"></script>
  <!--[if lte IE 8]>
  <script src="assets2/js/ie/respond.min.js"></script>
  <![endif]-->
  <script src="assets2/js/main-my.js"></script>
</div>

</body>
</html>
