<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/8
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title><%if(Integer.parseInt(request.getParameter("classID"))==1)
        out.print("新手讨论区");
    else if(Integer.parseInt(request.getParameter("classID"))==2)
        out.print("摄影技巧讨论区");
    else if(Integer.parseInt(request.getParameter("classID"))==2)
        out.print("后期处理讨论区");
    else if(Integer.parseInt(request.getParameter("classID"))==2)
        out.print("器材大家谈");
    %></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]>
    <script src="assets2/js/ie/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="assets2/css/main.css" />
    <link rel="stylesheet" href="assets2/css/add_bbs_2.css" />
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
        <div class="conts">
            <div class="link">
                <a href="BMain">Salotto BBS</a>
                <
                <a href="">
                <%if(Integer.parseInt(request.getParameter("classID"))==1)
                    out.print("新手讨论区");
                    else if(Integer.parseInt(request.getParameter("classID"))==2)
                    out.print("摄影技巧讨论区");
                    else if(Integer.parseInt(request.getParameter("classID"))==2)
                    out.print("后期处理讨论区");
                     else if(Integer.parseInt(request.getParameter("classID"))==2)
                    out.print("器材大家谈");
                    //else if(Integer.parseInt((String)(request.getAttribute("classID")))==5)
                   // out.print("我的收藏");
                %>
                </a>

            </div>
            <div class="my">
                <a href="BCollectList?userID=<%=user.getUId()%>">我的收藏</a>
                |
                <a href="BMyPost?userID=<%=user.getUId()%>">我的帖子</a>
                |
                <a href="">我参与的帖子</a>
            </div>
            <jsp:include page="/paging_footer.jsp"></jsp:include>
        </div>
        <div class="content">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_list">
                <colgroup>
                    <col />
                    <col width="100px" />
                    <col width="100px" />
                    <col width="100px" />
                    <col width="100px" />
                    <col width="120px" />
                </colgroup>
                <tr>
                    <th class="tc">
                        <a class="top" href="/forums/WebDevelop/my">全部主题</a>
                        |
                        <a class="top" href="/forums/WebDevelop/my">最新</a>
                        |
                        <a class="top" href="/forums/WebDevelop/replied">热门</a>
                    </th>
                    <th class="tc">作者</th>
                    <th class="tc">回复</th>
                    <th class="tc">收藏</th>
                    <th class="tc">查看</th>
                    <th class="tc">最后发表</th>
                </tr>
                <c:forEach items="${entryList}" var="Post">
                <tr>
                    <td class="title"><strong class="green">？</strong>
                        <a href="BPost?postID=${Post.getPID()}&authorID=${Post.getUID()}&classID=${classID}">${Post.getPTitle()}</a>
						<span class="forum_link">
							[
							<span class="parent">
								<a href="">XXX</a>
							</span>
							<a href="">XXX</a>
							]
						</span>
                    </td>
                    <td class="tc">
                        <c:set var="uid" value="${Post.getUID()}"/>
                        <c:set var="uName" value="${Post.getUName()}"/>
                        <a href="Account.jsp?uID=${Post.getUID()}">${uName}</a>
                        <br />
                        <span class="time">${Post.getPDate()}</span>
                    </td>
                    <td class="tc">${Post.getRECount()}</td>
                    <td class="tc">${Post.getCollectCount()}</td>
                    <td class="tc">${Post.getBRCount()}</td>

                    <td class="tc">
                        <c:set var="pid" value="${Post.getPID()}"/>
                        ${Post.findNewRUser(pid)}
                        <br />
                        <span class="time">${Post.findNewRTime(pid)}</span>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <th class="tc">
                        <a class="top" href="/forums/WebDevelop/my">全部主题</a>
                        |
                        <a class="top" href="/forums/WebDevelop/my">最新</a>
                        |
                        <a class="top" href="/forums/WebDevelop/replied">热门</a>
                    </th>
                    <th class="tc">作者</th>
                    <th class="tc">回复</th>
                    <th class="tc">收藏</th>
                    <th class="tc">查看</th>
                    <th class="tc">最后发表</th>
                </tr>
            </table>
        </div>
    </div>
    </div>
<!-- Scripts -->
<script src="assets2/js/jquery.min.js"></script>
<script>
    function post() {
        if ($("#postTitle").val() == "") {
            alert("标题不能为空~")
        }
                else if($("#postContent").val() == ""){
            alert("内容不能为空~")
        }
                else if($("#postClass").val()=="0"){

        }
        else {
            var x = {

                postContent: $("#postContent").val(),
                postTitle: $("#postTitle").val(),
                postClass: $("#postClass").val(),
                userID: $("#userID").val()
            };
            console.log(x);//check
            $.ajax(
                    {
                        url: "BBSFaTie",
                        type: "POST",
                        data: x,
                        dataType: "json",
                        success: function (data) {
                            if (data.msg == "success") {
                                alert("发表成功");
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
<!--[if lte IE 8]>
<script src="assets2/js/ie/respond.min.js"></script>
<![endif]-->
<script src="assets2/js/main.js"></script>
</div>
</body>
</html>