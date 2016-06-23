<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.dao.PostDao" %>
<%@ page import="com.salojava.salo.PostReply" %>
<%@ page import="com.sun.xml.internal.bind.v2.model.core.ID" %>
<%@ page import="com.salojava.dao.CollectDao" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/8
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>${postTitle}</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--[if lte IE 8]>
    <script src="assets2/js/ie/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="assets2/css/main.css"/>
    <link rel="stylesheet" href="assets2/css/add_bbs_3.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets2/css/ie9.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets2/css/ie8.css"/>
    <![endif]-->
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

<body>
<!-- Wrapper -->
<div id="wrapper">
    <%@include file="WEB-INF/jsp/header2.jsp" %>
    <!-- Main -->
    <div id="main">

        <!-- Post article-->
        <article class="post">
            <header>
                <div class="title">
                    <h2>
                        ${postTitle}
                    </h2>

                </div>
                <div class="meta">
                    <time class="published" datetime="${postDate}">${postDate}</time>
                    <a href="#" class="author">
                        <span class="name">${authorName}</span>
                        <img src="uploads/${authorPic}" alt=""/>
                    </a>
                </div>
            </header>
            <p>${postContent}</p>

            <footer>
                <ul class="icons">
                    <%
                        int pid=Integer.parseInt(request.getParameter("postID"));
                        int collectCount=Integer.parseInt(request.getAttribute("collectCount").toString());
                        CollectDao collectDao =new CollectDao();
                        System.out.println(collectDao.CollectIsExist(pid,user.getUId()));
                        if(!collectDao.CollectIsExist(pid,user.getUId())){
                            out.print("<li><a href=\"javascript:styleChange(1)\" id=\"ButtonIWant\" class=\"icon fa-heart\" onclick=\"collect()\">");
                            out.print("<span class=\"label\">Collect</span></a>");
                            out.print("<span id=\"collect\">");
                            out.print(collectCount );
                            //out.print(collectDao.CollectIsExist(pid,user.getUId()));
                            out.print("</span></li>");
                        }else{
                            out.print("<li><a href=\"javascript:styleChange(1)\" id=\"ButtonIWant\" class=\"icon alt fa-heart\" onclick=\"collect()\">");
                            out.print("<span class=\"label\">Collect</span></a>");
                            out.print("<span id=\"collect\">");
                            out.print(collectCount);
                            out.print("</span></li>");
                        }
                    %>

                    <%--<li><a href="javascript:styleChange(1)" id="ButtonIWant" class="icon fa-heart" onclick="like()"><span class="label">Likes</span></a><span id="likes"><%=portfolio.getPfLikesCount()%></span></li>--%>

                    <li><a href="#replyDiv" class="icon fa-share"><span class="label">Share</span></a></li>
                    <li><a href="#" class="icon fa-star"><span class="label">Star</span></a></li>
                    <li><a href="#" class="icon fa-ellipsis-h"><span class="label">more</span></a></li>

                </ul>
            </footer>
        </article>
        <div class="reply" id="replyDiv">
            <!-- Post reply-->
            <c:forEach items="${entryList}" var="PostReply">
                <article class="post">
                    <header>
                        <div class="meta">
                            <time class="published" datetime="${PostReply.getPRDate()}">${PostReply.getPRDate()}</time>
                            <a href="#" class="author">
                                <span class="name">${PostReply.getUName()}</span>
                                <img src="uploads/${PostReply.getUPhoto()}" alt=""/>
                            </a>
                        </div>
                        <div class="title">
                            <p>
                                    ${PostReply.getPRContent()}
                            </p>
                        </div>
                    </header>
                </article>
            </c:forEach>
            <!--Page Footer -->
            <script type="text/javascript">
                function gotoSelectedPage()
                {
                    var x = document.getElementById("navigatorForm");
                    //alert("Original action: " + x.action)
                    x.submit();
                }
            </script>
            <form action="BBSPost" method="get" id="navigatorForm">
                <div class="page_nav">
                    <ul>
                        <li><a href="BPost?pageNumber=1&postID=${postID}&authorID=${authorID}">首页</a></li>
                        <c:if test="${pageNumber>1}">
                            <a href="BPost?pageNumber=${pageNumber-1}&postID=${postID}&authorID=${authorID}">上一页</a>
                        </c:if>
                        <li>跳转到第</li>
                        <li><select name="pageNumber" onchange="gotoSelectedPage();" style="height: 1.7em;
                                font-size: 100%;>
                        <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">
                        <c:choose>
                        <c:when test="${pageIndex eq pageNumber}">
                                <option value="${pageIndex}" selected="selected">${pageIndex}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${pageIndex}">${pageIndex}</option>
                            </c:otherwise>
                            </c:choose>
                            </c:forEach>
                            </select></li>
                        <li>页</li>
                        <c:if test="${pageNumber<totalPages}">
                            <li> <a href="BPost?pageNumber=${pageNumber+1}&postID=${postID}&authorID=${authorID}">下一页</a></li>
                        </c:if>
                        <li> <a href="BPost?pageNumber=${totalPages}&postID=${postID}&authorID=${authorID}">末页</a></li>
                        <li>
                            <span>第:${pageNumber}页,</span>
                            <span>总贴数:${totalPosts},</span>
                            <span>共${totalPages}页</span>
                        </li>
                    </ul>
                </div>

            </form>

        </div>
        </div>

    <!-- Sidebar -->
    <section id="sidebar">
        <section class="reply-area">
            <input autocomplete="off" id="postid" name="postid" style="display: none" value="${postID}">
            <input autocomplete="off" id="userID" name="userID" style="display: none" value="<%=user.getUId()%>">
            <input autocomplete="off" id="authorid" name="authorid" style="display: none" value="${authorID}">

            <article class="post">
                <header>
                    <div class="meta">
                        <a href="#" class="author">
                            <span class="name"><%=user.getUName()%> </span>
                            <img src="uploads/<%=user.getUPhoto()%>" alt=""/>
                        </a>
                    </div>
                    <div class="title">
                        <textarea name="replyContent" id="replyContent" rows="6"></textarea>
                    </div>
                </header>
                <footer>
                    <ul class="actions pagination">
                        <li>
                            <input type="button" onclick="reply()" value="Submit" id="post-submit"
                                   class="button big next"></li>
                    </ul>
                </footer>
            </article>
        </section>


    </section>
        </div>
</div>



    <!-- Scripts -->
    <script src="assets2/js/jquery.min.js"></script>
    <script>
        function reply() {
            if ($("#replyContent").val() == "") {
                alert("回复不能为空~")
            }
            else {
                var x = {
                    replyContent: $("#replyContent").val(),
                    postid: $("#postid").val(),
                    userID: $("#userID").val()
                };
                console.log(x);//check
                $.ajax(
                        {
                            url: "BBSReply",
                            type: "POST",
                            data: x,
                            dataType: "json",
                            success: function (data) {
                                if (data.msg == "success") {
                                    alert("回复成功");
                                    window.location.reload();
                                }
                            }
                        }
                );
            }
        }



    </script>
    <script>
        function collect(){
            var va=document.getElementById("collect").innerText;
            var i=parseInt(va);
            console.log(i)
            var y;
            if (document.getElementById("ButtonIWant").className == "icon fa-heart") {
                var j = {postid: $("#postid").val(), userID: $("#userID").val(),Yes:"1"};
                y=1;
            }else{
                var j = {postid: $("#postid").val(), userID: $("#userID").val(),Yes:"0"};
                y=0;
            }

            console.log(j);//check
            $.ajax(
                    {
                        url:"PostCollect",
                        type:"POST",
                        data:j,
                        dataType:"json",
                        success: function (data) {
                            if(data.option=='1'){
                                i=i+1;
                                console.log(i);
                                document.getElementById("collect").innerText=i;
                                console.log(document.getElementById("collect").innerText);
                            }else{
                                i=i-1;
                                console.log(i);
                                document.getElementById("collect").innerText=i;
                                console.log(document.getElementById("collect").innerText);
                            }
                        }
                    }
            );
        }
    </script>

    <script src="assets2/js/skel.min.js"></script>
    <script src="assets2/js/util.js"></script>
    <!--[if lte IE 8]>
    <script src="assets2/js/ie/respond.min.js"></script>
    <![endif]-->
    <script src="assets2/js/main.js"></script>
</body>
</html>