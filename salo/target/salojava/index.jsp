<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>SALOTTO</title>
    <meta http-equiv="Content-Type" contentType="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/green.css" />
    <link rel="stylesheet" href="assets/css/first.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body class="landing">
<div id="page-wrapper">

    <!-- Header -->
    <header id="header" class="alt">
        <h1><a href="index.jsp">SALOTTO</a></h1>
        <nav id="nav">
            <ul>
                <%

                    User user = (User)session.getAttribute("user");

                    if(user==null){
                %>
                <li><a href="Signup.jsp" >注册</a></li>
                <li><a href="Login.jsp" >登录</a></li>
                <%}else{%>
                <li><a href="Set.jsp" >个人中心</a></li>
                <%}%>
            </ul>
        </nav>
    </header>

    <!-- Banner -->
    <section id="banner">
        <div class="container">
            <center><img src="images/SALOTTO2.png"></center>

            <header>
                <h4 style="font-weight:normal;">志趣相投／聚会一堂</h4>
            </header>

        </div>
        <div class="icredits">
							<span >
							图片来源
							<a href="https://500px.com/morganphillips" target="_blank">
                                叶流徽
                            </a>
							</span>
            <div class="fade_bottom"></div>
        </div>
    </section>

    <!-- Intro -->
    <section id="intro" class="wrapper style1">
        <div class="container">
            <h2>“沙龙”<span style="font-size:0.8em;">一个摄影爱好者的基地</span></h2>
            <footer>
                <p>源于意大利语单词"Salotto"，原意指的是装点有美术品的屋子。</p>


            </footer>
        </div>
    </section>

    <!-- Main -->
    <section id="main" class="wrapper style2">
        <div class="navbar-secondary">
            <nav class="navbar container">

            </nav>
            <ul class="navbar-subnav">
                <li class="active"><a href="#">人像</a></li>
                <li><a href="#">风光</a></li>
                <li><a href="#">人文</a></li>
                <li><a href="#">纪实</a></li>
            </ul>
        </div>

        <div class="container">

            <div class="photo_container" style="padding-top: 0px;">
                <div class="photo_grid">

                    <div class="">
                        <div class="irow">
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic01.jpg" alt="" /></a>
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic02.jpg" alt="" /></a>
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic03.jpg" alt="" /></a>
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic10.jpg" alt="" /></a>

                        </div>

                        <div class="x">
                            <a href="view.html" class="image featured" id="ifx2"><img src="images/pic04.jpg" alt="" /></a>
                            <a href="view.html" class="image featured" id="ifx2"><img src="images/pic05.jpg" alt="" /></a>

                            <!-- <div class="z">
                            <a href="view.html" class="image featured" id="ifx3"></a></div> --></div>
                        <div class="z">
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic06.jpg" alt="" /></a>
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic07.jpg" alt="" /></a>
                            <a href="view.html" class="image featured" id="ifx"><img src="images/pic11.jpg" alt="" /></a>

                        </div>
                    </div>
                </div></div>
            <div class="clearfix"></div>
            <div class="buttons">
                <a class="button large submit" data-ga-action="Click Signup" data-ga-category="Homempage Photo Grid" href="Signup.jsp">立即注册</a>
                <a class="button large tertiary" data-ga-action="Click Discover" data-ga-category="Homepage Photo Grid" href="Pictures.jsp?type=0">更多图片</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="container">

        </div>
        <div class="copyright">
            &copy; PunoLee. All rights reserved.
        </div>
    </footer>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrollgress.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

</body>
</html>