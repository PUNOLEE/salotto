<%@ page import="com.salojava.salo.User" %>
<%@ page import="com.salojava.dao.UserDao" %>
<%@ page import="com.salojava.salo.Portfolio" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: PunoLee
  Date: 16/6/10
  Time: 下午3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8" language="java" %>

<html>
<head>
  <title>上传</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!--[if lte IE 8]><script src="assets2/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="assets2/css/main.css" />
  <link rel="stylesheet" href="assets2/css/pop.css" />
  <link rel="stylesheet" href="assets2/css/tag.css" />
  <link rel="stylesheet" href="assets2/css/bootstrap.min.css" />
  <link href="assets2/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
  <script src="assets2/js/jquery.min.js"></script>
  <!--[if lte IE 9]><link rel="stylesheet" href="assets2/css/ie9.css" /><![endif]-->
  <!--[if lte IE 8]><link rel="stylesheet" href="assets2/css/ie8.css" /><![endif]-->
    <%--<script type="text/javascript" src="assets2/js/ajaxfileupload.js"></script>--%>
  <%--<script type="text/javascript">--%>
    <%--function ajaxFileUpload() {--%>
      <%--$.ajaxFileUpload({--%>
        <%--url : 'upload',--%>
        <%--secureuri : false,--%>
        <%--type:"post",--%>
        <%--fileElementId : 'fileToUpload',--%>
        <%--dataType:"json",--%>
        <%--contentType: "application/json; charset=utf-8",--%>
        <%--data : {username : $("#username").val(),portfolioID:$("#portfolioID").val()},--%>
        <%--success : function(data,status) {--%>
          <%--alert("成功！");--%>
          <%--console.log("成功");--%>
          <%--console.log(data);--%>
          <%--console.log(data.pfid);--%>
          <%--$('#portfolioID').attr('value',data.pfid);--%>
        <%--},--%>
        <%--error : function(data, status, e) {--%>
          <%--if(status=='timeout'){//超时,status还有success,error等值的情况--%>

            <%--ajaxTimeOut.abort(); //取消请求--%>
            <%--alert("超时");--%>

          <%--}--%>
          <%--alert('上传出错');--%>
        <%--}--%>

      <%--});--%>
    <%--}--%>
  <%--</script>--%>
</head>

<body >

<!-- Wrapper -->
<div id="wrapper" >

  <%@include file="WEB-INF/jsp/header.jsp"%>

  <!-- Main -->
  <div id="main">
      <div class="container-default1" style="margin:0 auto;">

        <div class="controlgroup d12x5 g1 margin" >

          <h3>
            Photos' Information
          </h3>

          <div class="controls" style="min-height: 840px; overflow: hidden;">
            <div class="arrow"></div>


            <!-- title-->
            <div class="check mail"></div>
            <div class="checkinfo title">
              <label for="title" class="smalllabel">标题</label>
              <input type="text" name="title" id="title" class="full" >
            </div>
            <div class="clear"></div>

            <!-- info -->
            <div class="checkinfo">
              <label for="about" class="smalllabel">简介</label>
              <textarea name="about" id="about" class="full" ></textarea>
            </div>
            <div class="clear"></div>

            <div class="checkinfo">
              <label for="tag-editor" class="smalllabel">标签</label>
              <div class="showbox"><div class="tag-editor" id="tag-editor">
                <input class="text" type="text" name="tags" readonly="readonly"></div></div>

              <section class="tag-selector">
                <span class="tag-selector-caret"></span>
                <h3>常用的标签</h3>
                <ul class="tag-selector-list tag-selector-mine clearfix">
                  <span class="tag-selector-caret"></span>
                  <li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">人像</a>
                  </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">风光</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">色彩</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">尼康</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">佳能</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">黑白</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">人文</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">纪实</a>

                </li><li><a href="javascript:void(0);" onclick="$(this).closest('.tag-selector-list').find('li').show();$(this).hide();return false;" style="color:#aaa">更多</a></li>
                </ul>
                <h3>题材</h3>
                <ul class="tag-selector-list tag-selector-subject clearfix">
                  <span class="tag-selector-caret"></span>
                  <li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">人像</a>
                  </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">风光</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">纪实</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">街拍</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">城市</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">人文</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">旅行</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">美女</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">建筑</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">夜景</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">自然</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">少女</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">生活</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">静物</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">光影</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">植物</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">花卉</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">动物</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">校园</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">儿童</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">私房</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">生态</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">美食</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">昆虫</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">星空</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">婚礼</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">猫</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">日出</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">海</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">夏天</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">毕业</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">荷花</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">婚纱</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">铁路</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">夕阳</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">云</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">自拍</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">汽车</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">火车</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">Cosplay</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">宠物</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">运动</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">模特</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">黄昏</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">晚霞</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">雪山</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">乡村</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">舞台</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">情侣</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">倒影</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">大学</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">女孩</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">鸟</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">蓝天</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">长城</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">户外</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">阳光</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">地铁</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">古镇</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">森林</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">公园</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">室内</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">花草</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">青春</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">特写</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">草原</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">教堂</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">蝴蝶</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">学校</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">春天</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">水</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">雨</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">剪影</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">摇滚</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">童年</a>
                </li><li><a href="javascript:void(0);" onclick="$(this).closest('.tag-selector-list').find('li').show();$(this).hide();return false;" style="color:#aaa">更多</a></li>
                </ul>
                <h3>风格</h3>
                <ul class="tag-selector-list tag-selector-style clearfix">
                  <span class="tag-selector-caret"></span>
                  <li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">色彩</a>
                  </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">黑白</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">抓拍</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">小清新</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">情绪</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">日系</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">情感</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">后期</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">长曝光</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">微距</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">唯美</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">小品</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">写真</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">文艺</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">故事</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">极简主义</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">性感</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">复古</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">逆光</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">创意</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">艺术</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">时尚</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">画意</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">绿色</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">文化</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">安静</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">心情</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">现场</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">怀旧</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">HDR</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">可爱</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">观念</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">lightroom</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">概念</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">蓝色</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">超现实</a>
                </li><li><a href="javascript:void(0);" onclick="$(this).closest('.tag-selector-list').find('li').show();$(this).hide();return false;" style="color:#aaa">更多</a></li>
                </ul>
                <h3>器材</h3>
                <ul class="tag-selector-list tag-selector-equipment clearfix">
                  <span class="tag-selector-caret"></span>
                  <li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">佳能</a>
                  </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">尼康</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">手机</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">索尼</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">广角</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">50mm</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">35mm</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">胶片</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">富士</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">宾得</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">徕卡</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">iphone</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">奥林巴斯</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">28MM</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">定焦</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">85mm</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">理光</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">蔡司</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">D90</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">5d3</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">超广角</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">24-70</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">适马</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">哈苏</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">腾龙</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">狗头</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">大光圈</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">禄来</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">60D</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">卡片机</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">中画幅</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">单反</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">sl66</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">数码</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">Rolleiflex</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">美能达</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">华为手机</a>
                </li><li><a href="javascript:void(0);" onclick="$(this).closest('.tag-selector-list').find('li').show();$(this).hide();return false;" style="color:#aaa">更多</a></li>
                </ul>
                <h3>地区</h3>
                <ul class="tag-selector-list tag-selector-location clearfix">
                  <span class="tag-selector-caret"></span>
                  <li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">北京</a>
                  </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">上海</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">广州</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">武汉</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">南京</a>
                </li><li style=""><a href="javascript:void(0)"  onclick="addItem(this)" class="tag-btn">深圳</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">成都</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">四川</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">杭州</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">重庆</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">云南</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">西安</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">中国</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">浙江</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">大连</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">厦门</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">苏州</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">新疆</a>
                </li><li style=""><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">天津</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">长沙</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">香港</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">安徽</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">郑州</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">西藏</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">日本</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">福建</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">美国</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">贵州</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">昆明</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">青岛</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">江西</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">湖南</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">济南</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">意大利</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">哈尔滨</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">珠海</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)"  class="tag-btn">海南</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">台湾</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">欧洲</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">西湖</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">江苏</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">英国</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">新西兰</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">南昌</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">泰国</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">福州</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">山西</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">拉萨</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">三亚</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">江南</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">内蒙古</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">巴黎</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">桂林</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">青海</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">大理</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">外滩</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">德国</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">澳大利亚</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">马来西亚</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">斯里兰卡</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">澳门</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">故宫</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">海外</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">常州</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">法国</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">黄山</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">土耳其</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">尼泊尔</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">坝上</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">墨尔本</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">三里屯</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">韩国</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">鼓浪屿</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">加拿大</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">纽约</a>
                </li><li style="display:none;"><a href="javascript:void(0)" onclick="addItem(this)" class="tag-btn">纽约</a>
                </li><li><a href="javascript:void(0);" onclick="$(this).closest('.tag-selector-list').find('li').show();$(this).hide();return false;" style="color:#aaa">更多</a></li>
                </ul>
                <h3>活动</h3>
                <ul class="tag-selector-list tag-selector-event clearfix">
                  <span class="tag-selector-caret"></span>
                </ul>
              </section>
            </div>
            <div class="clear"></div>


            <!-- Analytics Tracking Code -->
          </div>


        </div>
        <div class="controlgroup d12x5 g1 x">
          <h3>Photos</h3>
          <div class="controls" style="min-height: 810px; overflow: hidden;">
            <div class="arrow"></div>
            <div class="form-group">
              <input id="imgs-upload" type="file" multiple data-preview-file-type="any" data-upload-url="upload" >
            <input type="text" id="username" name="username" style="display: none;" value="<%=user.getUId()%>"/>
              <%--<input id="fileToUpload" type="file" size="45" name="fileToUpload"--%>
                     <%--class="input"  multiple>--%>
              <div id="show"></div>
              <%--<button class="button" onclick="ajaxFileUpload()" >上传</button>--%>


            </div>

            <div class="clear"></div>
          </div>
        </div>
        <div class="linetop">
          <div class="alignright">
            <button class="button green" id="upload-btn" onclick="submit()" >上传</button>
          </div>
          <div class="clear"></div>
        </div>
          </div>




          </div>





        </div>


        <!-- Scripts -->

        <script src="assets2/js/skel.min.js"></script>
        <script src="assets2/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets2/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets2/js/main.js"></script>
        <script src="assets2/js/upload/fileinput.js" type="text/javascript"></script>
        <script src="assets2/js/upload/fileinput_locale_zh.js" type="text/javascript"></script>
        <script type="text/javascript">
          function addItem(obj){
            var text=$(obj).html();
            var addHtml="<span><input type='hidden' name='tags'' value='"+text+"'><em class='tag'>"+text+"</em><a class='del'  onclick='deleteItem(this)'>x</a></span>";
            $("#tag-editor").find("input[type='text']").before(addHtml);
          }

          function deleteItem(obj){
            $(obj).closest("span").remove();
          }

        </script>
<script type="text/javascript">
  $(document)
          .ready(
          function() {
            // $(document).attr("title","职员信息");
            $("#imgs-upload").fileinput({
              'showUpload':false,
              'previewFileType': 'any',
              'language': 'zh', //设置语言
              'uploadUrl': "upload", //上传的地址
              'allowedFileExtensions': ['jpg', 'gif', 'png'],//接收的文件后缀
              'enctype': 'multipart/form-data', //表示允许同时上传的最大文件个数
              'uploadAsync': true,
              'showAjaxErrorDetails':false,
              'maxFileSize':20000,
            });
          });
  function submit(){
    if($("#title").value==""){
      alert("标题为空！");
    }
    else {
      var jsondata = "[";
      $("[name=tags]").each(function () {
        if (this.value != "") {
          jsondata += '{"tags":"' + this.value + '"},';
        }
      });
      var reg = /,$/gi;
      jsondata = jsondata.replace(reg, "");

      jsondata += "]";
      console.log(jsondata);
      var j = {username: $("#username").val(), title: $("#title").val(), about: $("#about").val(), tags: jsondata};
      console.log(j);
      $.ajax(
              {
                url: "upload", //访问路径
                type: "POST",	//访问方式
                data: j, //传入服务端的数据
                dataType: "json",
                success: function (data) {
                  var pfid=data.pfid;
                  $("#imgs-upload").fileinput('upload');
                  //$('#imgs-upload').on('fileuploaderror', function() {alert("新增失败：图片上传失败");});
                  $('#imgs-upload').on('fileuploaded', function (event, data, previewId, index) {
                    alert("上传成功");
                    window.location.href = 'View.jsp?pfid='+pfid+'';
                    var photoUrl = data.response;
                  });
                }

              }
      );
    }

  }

</script>

        <%--<script type="text/javascript">--%>
          <%--var upimg = document.querySelector('#fileToUpload');--%>
          <%--upimg.addEventListener('change', function(e){--%>
            <%--var files = this.files;--%>
            <%--if(files.length){--%>
              <%--// 对文件进行处理，下面会讲解checkFile()会做什么--%>
              <%--checkFile(this.files);--%>
            <%--}--%>
          <%--});--%>
          <%--function checkFile(files){--%>
            <%--var html='', i=0;--%>
            <%--var func = function(){--%>
              <%--if(i>=files.length){--%>
                <%--// 若已经读取完毕，则把html添加页面中--%>
                <%--show.innerHTML = html;--%>
              <%--}--%>
              <%--var file = files[i];--%>
              <%--var reader = new FileReader();--%>

              <%--// show表示<div id='show'></div>，用来展示图片预览的--%>
              <%--if(!/image\/\w+/.test(file.type)){--%>
                <%--show.innerHTML = "请确保文件为图像类型";--%>
                <%--return false;--%>
              <%--}--%>
              <%--reader.onload = function(e){--%>
                <%--html += '<img style="width:300px" src="'+e.target.result+'" alt="img">';--%>
                <%--i++;--%>
                <%--func(); //选取下一张图片--%>
              <%--}--%>
              <%--reader.readAsDataURL(file);--%>
            <%--}--%>
            <%--func();--%>
          <%--}--%>

        <%--</script>--%>
</body>
        </html>
