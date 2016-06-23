<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/23
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>MyPost</title>
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
                >
                我的发帖

            </div>
            <div class="my">
                <a href="BCollectList?userID=<%=user.getUId()%>">我的收藏</a>
                |
                <a href="/forums/WebDevelop/replied">我参与的帖子</a>
            </div>
            <script type="text/javascript">
                function gotoSelectedPage()
                {
                    document.getElementById("navigatorForm").submit();
                }
            </script>
            <form action="BBSPost" method="get" id="navigatorForm">
                <input type="text" style="display: none" id="userID" name="userID" value="<%=user.getUId()%>">

                <div class="page_nav">
                    <ul>
                        <li><a href="BCollectList?pageNumber=1&userID=<%=user.getUId()%>">首页</a></li>
                        <c:if test="${pageNumber>1}">
                            <a href="BCollectList?pageNumber=${pageNumber-1}&userID=<%=user.getUId()%>">上一页</a>
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
                            <li> <a href="BCollectList?pageNumber=${pageNumber+1}&userID=<%=user.getUId()%>">下一页</a></li>
                        </c:if>
                        <li> <a href="BCollectList?pageNumber=${totalPages}&userID=<%=user.getUId()%>">末页</a></li>
                        <li>
                            <span>第:${pageNumber}页,</span>
                            <span>总贴数:${totalPosts},</span>
                            <span>共${totalPages}页</span>
                        </li>
                    </ul>
                </div>

            </form>
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
                    <col width="100px" />

                </colgroup>
                <tr>
                    <th class="tc">
                        <a class="top" href="/forums/WebDevelop/my">主题</a>
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
                    <th class="tc"></th>

                </tr>
                <c:forEach items="${entryList}" var="Post">
                    <input name="postid" id="postid" value="${Post.getPID()}" style="display: none;">
                    <tr>
                        <td class="title"><strong class="green">？</strong>
                            <a href="BPost?postID=${Post.getPID()}&authorID=${Post.getUID()}">${Post.getPTitle()}</a>
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
                            <a href="">${Post.findNewRUser(pid)}</a>
                            <br />
                            <span class="time">${Post.findNewRTime(pid)}</span>
                        </td>
                        <td class="tc"><a onclick="del()">删除</a> </td>

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
                    <th class="tc"></th>
                </tr>
            </table>
        </div>
    </div>
</div>
</div>

<!-- Scripts -->
<script src="assets2/js/jquery.min.js"></script>

<script>
    function del() {
        var x = {
                postid: $("#postid").val(),
            };
            console.log(x);//check
            $.ajax(
                    {
                        url: "BBSDelete",
                        type: "POST",
                        data: x,
                        dataType: "json",
                        success: function (data) {
                            if (data.msg == "success") {
                                alert("删除成功");
                                window.location.reload();
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
</div>
</body>
</html>
