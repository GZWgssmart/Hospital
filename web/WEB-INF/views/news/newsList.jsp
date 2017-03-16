<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/16
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 新闻列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight blog">
    <div class="row">
        <div class="col-lg-12">
            <c:forEach items="${requestScope.pagers.rows}" var="news">
                <div class="ibox">
                    <div class="ibox-content">

                        <h2><a href="<%=path %>/news/queryById/${news.id}">${news.title}</a></h2>
                        <div class="small m-b-xs">
                            <strong>${news.author}</strong> <span class="text-muted"><img src="<%=path %>/images/full-time.png" />
                                <fmt:formatDate value="${news.pubTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>

                            </span>
                        </div>
                        <a href="<%=path %>/news/queryById/${news.id}">
                            <p>
                                ${news.abstracts}
                            </p>
                        </a>
                        <p style="text-align: right">
                            <a href="<%=path %>/news/queryById/${news.id}" class="btn-link title">更多></a>
                        </p>

                    </div>

                </div>
            </c:forEach>
            <div class="btn-group pull-right" style="margin-top: 30px;">
                <button class="btn btn-white btn-sm" onclick="previous('${requestScope.pager.pageNo}')"><img src="<%=path %>/images/left.png" alt="上一页" /></i>
                </button>
                <button class="btn btn-white btn-sm" onclick="next('${requestScope.pager.pageNo}', '${requestScope.pagers.total}', '${requestScope.articleType}')"><img src="<%=path %>/images/right.png" alt="下一页"/></i>
                </button>

            </div>


        </div>
    </div>
</div>

<!-- 全局js -->
<script src="<%=path %>/js/user/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/user/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="<%=path %>/js/user/content.js?v=1.0.0"></script>
<script>
    function previous(pageNo) {
        var pageNo1 = parseInt(pageNo) - 1;
        window.location.href = "<%=path %>/news/search_pager_type?page=" + pageNo1 + "&rows=10";
    }

    function next(pageNo, total, type) {
        var pageNo1 = parseInt(pageNo) + 1;
        var maxPage = Math.ceil(parseInt(total) / 10);
        if (pageNo1 > maxPage) {
            pageNo1 = maxPage;
        }
        window.location.href = "<%=path %>/news/search_pager_type?page=" + pageNo1 + "&rows=10";
    }
</script>

</body>

</html>

