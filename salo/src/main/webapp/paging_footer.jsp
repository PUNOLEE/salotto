<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/9
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="assets2/css/add_bbs_2.css" />
<script src="assets2/js/jquery.min.js"></script>
<script type="text/javascript">
    function gotoSelectedPage()
    {
        document.getElementById("naForm").submit();
    }
</script>
<form method="get" id="naForm" action="Posts" >
    <div class="page_nav">
        <input type="text" style="display: none" id="classID" name="classID" value="<%=request.getParameter("classID")%>">

        <ul>
            <li><a href="Posts?pageNumber=1&classID=<%=request.getParameter("classID")%>">首页</a></li>
    <c:if test="${pageNumber>1}">
            <li><a href="Posts?pageNumber=${pageNumber-1}&classID=<%=request.getParameter("classID")%>">上一页</a></li>
    </c:if>
            <li>跳转到第</li>
        <li><select name="pageNumber" onchange="gotoSelectedPage();" style="height: 1.7em;
                    font-size: 100%;">
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
            <li><a href="Posts?pageNumber=${pageNumber+1}&classID=<%=request.getParameter("classID")%>">下一页</a></li>
    </c:if>
            <li><a href="Posts?pageNumber=${totalPages}&classID=<%=request.getParameter("classID")%>">末页</a></li>
            <li>
                <span>第:${pageNumber}页,</span>
                <span>总贴数:${totalPosts},</span>
                <span>共${totalPages}页</span>
            </li>
            </ul>
        </div>
</form>