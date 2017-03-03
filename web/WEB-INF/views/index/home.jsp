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
    <title>主页-${requestScope.hospital.name}</title>
    <link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="<%=path%>/js/index/jquery-1.11.1.min.js"></script>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
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
    <style>
        .img img {
            max-width: 200px;
            max-height: 200px;
            border-radius: 50%;
        }

        #services a {
            color: black;
        }

        #services a:hover {
            color: #ff9900;
        }

        .my-icon {
            margin-bottom: 3em;
        }

        .my-copy {
            text-align: center;
            font-size: 2.5em;
            padding-top: 1em;
        }

        .my-web-add {
            text-align: center;
            font-size: 4em;
        }

    </style>
</head>

<body>
<!-- 头部开始 -->
<div class="header" id="move-top">
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
<!-- 头部结束 -->
<div class="service-section" id="services" style="background-color: white;">
    <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
        <div class="col-md-4 col-sm-4 col-xs-6 col-lg-3 my-icon">
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
        <div class="col-md-4 col-sm-4 col-xs-6 col-lg-3 my-icon">
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
        <div class="col-md-4 col-sm-4 col-xs-6 col-lg-3 my-icon">
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
            <div class="col-md-4 col-sm-4 col-xs-6 col-lg-3 my-icon">
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

<!-- 底部开始 -->
<div class="footer">
    <div class="footer-bottom-at">
        <div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 footer-grid my-copy">
            医院地址：${requestScope.hospital.address}
        </div>
        <div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 footer-grid my-copy">
            联系方式：${requestScope.hospital.telNo}
        </div>
        <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12 my-web-add">
            <a href="${requestScope.hospital.webAddress}">${requestScope.hospital.webAddress}</a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- 底部结束 -->

</body>
</html>
