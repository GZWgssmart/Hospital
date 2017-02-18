<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/16
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 新闻详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">

                    <div class="text-center article-title">
                        <h1>
                            ${requestScope.news.title}
                        </h1>
                        <p style="text-algin: center">
                            ${requestScope.news.author}
                        </p>
                    </div>
                    <p>
                        ${requestScope.news.content}

                    </p>
                    <p style="text-align: right" id="date">
                        <fmt:formatDate value="${requestScope.news.pubTime}" pattern="yyyy-MM-dd HH:DD:ss"></fmt:formatDate>
                    </p>
                    <div class="mail-body text-right tooltip-demo">
                        <a class="btn btn-sm btn-white" href="<%=path %>/news/search_pager_type"><img
                                src="<%=path %>/images/left.png"/> 返回列表</a>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>

<!-- 全局js -->
<script src="<%=path %>/js/user/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/user/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="<%=path %>/js/user/content.js?v=1.0.0"></script>



</body>

</html>

