<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 12/9/16
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>主页-***医院</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- js -->
    <script src="<%=path%>/js/index/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <!-- for-mobile-apps -->
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="<%=path%>/js/index/move-top.js"></script>
    <script type="text/javascript" src="<%=path%>/js/index/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->
</head>

<body>
<!-- 头部开始 -->
<div class="header" id="move-top">
    <div class="container">
        <div class="header-left">
            <div class="logo">
                <h1><a href="index.html">***医院</a></h1>
            </div>
        </div>
        <div class="header-right">
            <ul>
                <li><a href="<%=path %>/user/login_page">登入</a></li>
                &nbsp;|&nbsp;
                <li><a href="<%=path %>/user/reg_page">注册</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- 头部结束 -->
<div class="header-banner">
    <div class="banner">
        <div class="container">
            <div class="banner-navigation">
                <div class="banner-nav">
                    <span class="menu"><img src="<%=path %>/images/menu.png" alt=" "/></span>
                    <ul class="nav1">
                        <li class="hvr-sweep-to-top cap"><a href="<%=path %>/index">主页</a></li>
                        <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=服务指南">服务指南</a></li>
                        <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=健康百科">健康百科</a></li>
                        <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=新闻动态">新闻动态</a></li>
                        <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=体检流程">体检流程</a></li>
                        <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=体检套餐">体检套餐</a></li>
                        <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=使用帮助">使用帮助</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 控制导航菜单的JavaScript开始 -->
        <!-- 新闻开始 -->
        <div class="news" id="news">
            <div class="container">
                <div class="news-section-head text-center">
                    <h3>新闻动态</h3>
                </div>
                <div class="news-section-grids">
                    <c:forEach items="${requestScope.newss}" var="news">
                        <div class="col-md-4 news-section-grid">
                            <div class="article_post">
                                <a class="news-post" href="<%=path %>/news/queryById/${news.id}">${news.title}</a>
                            </div>
                        </div>
                    </c:forEach>


                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <%--新闻结束--%>
    </div>
</div>

<!-- 底部开始 -->
<div class="footer">
    <div class="container">
        <div class="footer-bottom-at">
            <div class="col-md-6 footer-grid">
                <h3>***医院</h3>
                <p>医院的简介</p>
            </div>
            <div class="col-md-6 footer-grid-in">
                <ul class="footer-nav">
                    <li><a class="scroll" href="#move-top">主页</a>|</li>
                    <li><a href="<%=path %>/article/search_pager_type?type=服务指南">服务指南</a>|</li>
                    <li><a href="<%=path %>/article/search_pager_type?type=健康百科">健康百科</a>|</li>
                    <li><a href="<%=path %>/article/search_pager_type?type=新闻动态">新闻动态</a>|</li>
                    <li><a href="<%=path %>/article/search_pager_type?type=体检流程">体检流程</a>|</li>
                    <li><a href="<%=path %>/article/search_pager_type?type=体检套餐">体检套餐</a>|</li>
                    <li><a href="<%=path %>/article/search_pager_type?type=使用帮助">使用帮助</a></li>
                </ul>
                <p class="footer-class">地址：赣州市&nbsp;&nbsp;技术支持:Wgssmart </p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 底部结束 -->

</body>
</html>
