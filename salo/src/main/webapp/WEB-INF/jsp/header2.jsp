<%--
  Created by IntelliJ IDEA.
  User: Ashe
  Date: 16/6/22
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page contentType="text/html;charset=utf-8" %>
<style type="text/css">
    #header #search.visible {
        padding: 0.5em 0.5em 0 0;
    }
</style>
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
<!-- Header -->

<header id="header">
    <img src="images2/logo.png" class="logo">
    <h1><a href="index.jsp">SALOTTO 沙龙</a></h1>
    <nav class="links">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="Pictures.jsp?type=0">图</a></li>
            <li><a href="#">活动</a></li>
            <li><a href="News.jsp">资讯</a></li>
            <li><a href="/salotto/BMain?pageNumber=1">论坛</a></li>
            <li><a href="#">红娘</a></li>
        </ul>
    </nav>

    <nav class="main">
        <ul>
            <%

                User user = (User)session.getAttribute("user");
                if(user!=null){
            %>
            <li class="new">
                <a onclick="document.getElementById('detail').style.display='block'; document.getElementById('fade').style.display='block'">Post</a>
                </form>
            </li>
            <li class="search">
                <a class="fa-search" href="#search">Search</a>
                <form id="search" method="post" action="BSearch">
                    <input type="text" name="searchContent" placeholder="Search" />
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
        <li></li>
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
    <%}%>
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
    </section>


</section>
<div id="fade" class="black_overlay"></div>
<div id="detail" class="white_content">
    <div class="modal-dialog-title">
        <span class="modal-dialog-title-text" role="heading">发帖</span>
        <span class="modal-dialog-title-text" style="float:right" role="button" onclick="onclick=document.getElementById('detail').style.display='none'; document.getElementById('fade').style.display='none'">×</span>
    </div>

    <div class="modal-dialog-content">
        <div class="bbs-form">
            <input autocomplete="off" id="userID"  name="userID" style="display: none" value="<%=user.getUId()%>">
            <div class="form-title">
                <div class="form-head">问题标题</div>
                <div class="form-input" >
                    <input autocomplete="off" name="postTitle" id="postTitle" maxlength="50" size="60" type="text">
                </div>
            </div>

            <div class="form-content">
                <div class="form-head">问题内容</div>
                <div class="form-input" style="padding-top: 0px !important;">
                    <textarea name="postContent"  id="postContent"  rows="6"></textarea>
                </div>
            </div>

            <div class="form-section">
                <div class="form-head">选择版块</div>
                <div class="form-select">
                    <select name="postClass" id="postClass" class="required" style="height: 2.5em;">
                        <option name="postClass" value="0">-选择版块-</option>
                        <option name="postClass" value="1">新手讨论区</option>
                        <option name="postClass" value="2">摄影技巧讨论区</option>
                        <option name="postClass" value="3">后期处理讨论区</option>
                        <option name="postClass" value="4">器材大家谈</option>
                    </select>
                </div>
            </div>


            <ul class="actions pagination">
                <li>
                    <input type="button" value="Cancel" id="post-cancel" class="button big next"></li>
                <li>
                    <input type="button" value="Submit" id="post-submit" onclick="post()" class="button big next"></li>
            </ul>


        </div>
    </div>
</div>