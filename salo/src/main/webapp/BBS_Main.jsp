<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/7
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>

<html>
<head>
	<title>沙龙摄影论坛</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]>
	<script src="assets2/js/ie/html5shiv.js"></script>
	<![endif]-->
	<link rel="stylesheet" href="assets2/css/main.css" />
	<link rel="stylesheet" href="assets2/css/add_bbs_1.css" />

	<!--[if lte IE 9]>
	<link rel="stylesheet" href="assets2/css/ie9.css" />
	<![endif]-->
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="assets2/css/ie8.css" />
	<![endif]-->
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">
		<%@include file="WEB-INF/jsp/header2.jsp"%>
		<!-- Main -->
		<div id="main">
			<section>
				<div class="mini-posts">
					<!-- Mini Post1 -->
					<article class="mini-post">
						<header>
							<dl>
								<dt>
									<h2>
									<a href="BList?classID=1">${classname1}</a>
									</h2>
								</dt>
								<dd class="fl_c">
									<em>贴数: ${postcount1}</em>
									,
									<em>回复数:
										${recount1}</em>
								</dd>
								<dd class="last_post">
									${cdescription1}
								</dd>
							</dl>
							</dl>
							<a href="#" class="author">
								<img src="images2/avatar.jpg" alt="" />
							</a>
						</header>
					</article>
					<!-- Mini Post2 -->
					<article class="mini-post">
						<header>
							<dl>
								<dt>
									<h2>
										<a href="BList?classID=2">${classname2}</a>

									</h2>
								</dt>
								<dd class="fl_c">
									<em>贴数: ${postcount2}</em>
									,
									<em>回复数:
										${recount2}</em>
								</dd>
								<dd class="last_post">
									${cdescription2}
								</dd>
							</dl>
							<a href="#" class="author">
								<img src="images2/avatar.jpg" alt="" />
							</a>
						</header>
					</article>

					<!-- Mini Post 3-->
					<article class="mini-post">
						<header>
							<dl>
								<dt>
									<h2>
										<a href="BList?classID=3">${classname3}</a>
									</h2>
								</dt>
								<dd class="fl_c">
									<em>贴数: ${postcount3}</em>
									,
									<em>回复数:
										${recount3}</em>
								</dd>
								<dd class="last_post">
									${cdescription3}
								</dd>
							</dl>
							</dl>
							<a href="#" class="author">
								<img src="images2/avatar.jpg" alt="" />
							</a>
						</header>
					</article>

					<!-- Mini Post4 -->
					<article class="mini-post">
						<header>
							<dl>
								<dt>
									<h2>
										<a href="BList?classID=4">${classname4}</a>
									</h2>
								</dt>
								<dd class="fl_c">
									<em>贴数: ${postcount4}</em>
									,
									<em>回复数:
										${recount4}</em>
								</dd>
								<dd class="last_post">
									${cdescription4}
								</dd>
							</dl>
							</dl>
							<a href="#" class="author">
								<img src="images2/avatar.jpg" alt="" />
							</a>
						</header>
					</article>
				</div>
			</section>

			</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo">
					<img src="images2/logo.jpg" alt="" />
				</a>
				<header>
					<h2>Sallot论坛</h2>
					<p>这里，有你想要的一切</p>
				</header>
			</section>


		</section>
		<!-- Scripts -->
		<script src="assets2/js/jquery.min.js"></script>
		<script src="assets2/js/skel.min.js"></script>
		<script src="assets2/js/util.js"></script>
		<!--[if lte IE 8]>
		<script src="assets2/js/ie/respond.min.js"></script>
		<![endif]-->
		<script src="assets2/js/main.js"></script>
	</div>

</body>
	</html>
