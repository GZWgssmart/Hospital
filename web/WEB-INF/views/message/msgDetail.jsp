<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/16
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 查看消息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-md-12 col-sm-12 col-xs-12 col-lg-12 animated">
            <div class="mail-box-header">

                <h2>
                    查看消息
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">


                    <h3>
                        <span class="font-noraml">标题： </span>${requestScope.msg.title}
                    </h3>
                    <h5>
                        <span class="pull-right font-noraml">
                            <fmt:formatDate value="${requestScope.msg.sendTime}" pattern="yyyy/MM/dd"></fmt:formatDate>
                        </span>
                        <span class="font-noraml">发布人： </span>${requestScope.msg.author}
                    </h5>
                </div>
            </div>
            <div class="mail-box">


                <div class="mail-body context">
                    <h4>消息内容：</h4>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;${requestScope.msg.content}
                    </p>

                </div>

                <div class="mail-body text-left tooltip-demo">
                    <a class="btn btn-sm btn-white" href="<%=path %>/msg/msg_pager?page=1&rows=10"><img src="<%=path %>/images/left.png" /> 返回列表</a>
                </div>
                <div class="clearfix"></div>


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

