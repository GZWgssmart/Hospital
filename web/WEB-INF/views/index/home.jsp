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
    <style>
        .img img {
            width: 100px;
            height: 100px;
            border-radius:50%;
        }
    </style>
</head>

<body>
<!-- 头部开始 -->
<div class="header" id="move-top">
    <div class="container">
        <div class="header-left">
            <div class="logo">
                <h1><a href="index.html">${requestScope.hospital.name}</a></h1>
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
<div class="service-section" id="services">
    <div class="container">
        <div class="service-section-grids">
            <div class="col-md-3 service-grid">
                <div class="service-section-grid">
                    <div class="img">
                        <a href="<%=path %>/news/search_pager_type">
                            <img src="/images/news.jpg" alt="新闻动态"/>
                        </a>
                    </div>
                    <div class="icon-text">
                        <a href="<%=path %>/news/search_pager_type">新闻动态</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 service-grid">
                <div class="service-section-grid">
                    <div class="img">
                        <a href="<%=path %>/dept/search_pager_type">
                            <img src="/images/dept.jpg" alt="科室信息"/>
                        </a>
                    </div>
                    <div class="icon-text">
                        <a href="<%=path %>/dept/search_pager_type">科室信息</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 service-grid">
                <div class="service-section-grid">
                    <div class="img">
                        <a href="<%=path %>/doctor/search_pager_type">
                            <img src="/images/doctor.jpg" alt="医生信息"/>
                        </a>
                    </div>
                    <div class="icon-text">
                        <a href="<%=path %>/doctor/search_pager_type">医生信息</a>
                    </div>
                </div>
            </div>
            <c:forEach items="${requestScope.articleTypes}" var="at" begin="0" end="4" varStatus="s">
                <div class="col-md-3 service-grid">
                    <div class="service-section-grid">
                        <div class="img">
                            <a href="<%=path %>/article/search_pager_type?type=${at.name}">
                                <img src="/images/${s.index}.jpg" alt="${at.name}"/>
                            </a>
                        </div>
                        <div class="icon-text">
                            <a href="<%=path %>/article/search_pager_type?type=${at.name}">${at.name}</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<%--
<div class="container">
    <div class="banner-navigation">
        <div class="banner-nav">
            <span class="menu"><img src="<%=path %>/images/menu.png" alt=" "/></span>
            <ul class="nav1">
                <li class="hvr-sweep-to-top cap"><a href="<%=path %>/index">主页</a></li>
                <li class="hvr-sweep-to-top"><a href="<%=path %>/news/search_pager_type">新闻动态</a></li>
                <li class="hvr-sweep-to-top"><a href="<%=path %>/dept/search_pager_type">科室信息</a></li>
                <li class="hvr-sweep-to-top"><a href="<%=path %>/doctor/search_pager_type">医生信息</a></li>
                <c:forEach items="${requestScope.articleTypes}" var="at">
                    <li class="hvr-sweep-to-top"><a href="<%=path %>/article/search_pager_type?type=${at.name}">${at.name}</a></li>
                </c:forEach>

            </ul>
        </div>
    </div>
</div>
--%>
<!-- 新闻开始 -->
<%--
<div class="news" id="news">
    <div class="container">
        <div class="news-section-head text-center">
            <h3>新闻动态</h3>
        </div>
        <div class="news-section-grids">
            <c:forEach items="${requestScope.newss}" var="news">
                <div class="col-md-4 news-section-grid">
                    <div class="article_post" style="border:1px solid #778899; height: 300px; text-align: center; padding: 10px;">
                        <a class="news-post" href="<%=path %>/news/queryById/${news.id}">${news.title}</a>
                        <br />
                        <a class="news-post" href="<%=path %>/news/queryById/${news.id}">
                            <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${news.abstracts}</p>
                        </a>
                    </div>
                </div>
            </c:forEach>


            <div class="clearfix"></div>
        </div>
    </div>
</div>
--%>
<%--新闻结束--%>

<!-- 底部开始 -->
<div class="footer">
    <div class="container">
        <div class="footer-bottom-at">
            <div class="col-md-5 footer-grid">
                <h3>${requestScope.hospital.name}</h3>
                <p>${requestScope.hospital.des}</p>
            </div>
            <div class="col-md-7 footer-grid-in">
                <ul class="footer-nav">
                    <li><a class="scroll" href="#move-top">主页</a>|</li>
                    <c:forEach items="${requestScope.articleTypes}" var="at">
                        <li><a href="<%=path %>/article/search_pager_type?type=${at.name}">${at.name}</a>|</li>
                    </c:forEach>
                    <li><a href="<%=path %>/dept/search_pager_type">科室信息</a>|</li>
                    <li><a href="<%=path %>/doctor/search_pager_type">医生信息</a>|</li>
                    <li><a href="<%=path %>/news/search_pager_type">新闻动态</a></li>
                </ul>
                <p class="footer-class">地址：赣州市&nbsp;&nbsp;技术支持:Wgssmart </p>
            </div>
            <div style="text-align: center;">
                医院地址：${requestScope.hospital.address}&nbsp;&nbsp;<a
                    href="${requestScope.hospital.webAddress}">${requestScope.hospital.webAddress}</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 底部结束 -->

</body>
</html>
