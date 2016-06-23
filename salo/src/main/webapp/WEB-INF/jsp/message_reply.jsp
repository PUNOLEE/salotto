<%@ page import="com.salojava.salo.User" %>

<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>消息</title>
    <meta http-equiv="Content-Type" contentType="text/html;charset=utf-8"/>
    <meta http-equiv= "refresh" content= "2;url=BPost?${pID}&authorid=${authorid} ">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets2/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets2/css/main.css" />
    <link rel="stylesheet" href="assets2/css/pop.css" />
    <!--[if lte IE 9]><link rel="stylesheet" href="assets2/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="assets2/css/ie8.css" /><![endif]-->
</head>

<!-- Wrapper -->
<div id="wrapper" class="wrapper-styleu">

    <%@include file="header2.jsp"%>

    <!-- Main -->
    <div id="main">
        <div class="container-default1" style="height: 700px;">

            <div class="controlgroup d12x5 g1 margin" id="reply">

                <h3>
                    info
                </h3>
                <%
                    String info = (String)request.getAttribute("info");
                %>
                <div>
                    <%=info%>
                </div>

            </div>






        </div>



    </div>

</div>
<!-- Scripts -->
<script src="assets2/js/jquery.min.js"></script>
<script src="assets2/js/skel.min.js"></script>
<script src="assets2/js/util.js"></script>
<!--[if lte IE 8]><script src="assets2/js/ie/respond.min.js"></script><![endif]-->
<script src="assets2/js/main.js"></script>

</body>
</html>

