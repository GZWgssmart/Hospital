<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/26
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 系统消息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

    <style>
        .my-font {
            font-size: 0.5em;
        }
    </style>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-sm-12 animated fadeInRight">
            <div class="mail-box-header">


                <h2>
                    系统消息 (${requestScope.messages.total})

                </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <div class="btn-group pull-right">
                        <button class="btn btn-white btn-sm" onclick="previous('${requestScope.pager.pageNo}')"><img src="<%=path %>/images/left.png" alt="上一页" /></i>
                        </button>
                        <button class="btn btn-white btn-sm" onclick="next('${requestScope.pager.pageNo}', '${requestScope.messages.total}')"><img src="<%=path %>/images/right.png" alt="下一页" /></i>
                        </button>

                    </div>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="refreshMsg('${requestScope.pager.pageNo}')" title="刷新消息列表"><img src="<%=path %>/images/refresh.png" /> 刷新</button>


                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail my-font">
                    <tr class="unread">
                        <td class="mail-ontact">消息标题
                        </td>
                        <td class="mail-subject">消息的内容
                        </td>
                        <td class="mail-date">发布的时间</td>
                        <td>操作</td>
                    </tr>

                    <c:forEach items="${requestScope.messages.rows}" var="msg" >
                        <tr class="read">
                            <td class="mail-ontact"><a href="<%=path %>/msg/queryById/${msg.id}">${msg.title}</a>
                            </td>
                            <td class="mail-subject"><a href="<%=path %>/msg/queryById/${msg.id}">${msg.abstracts}</a>
                            </td>
                            <td class="mail-date">
                                <fmt:formatDate value="${msg.sendTime}" pattern="yyyy/MM/dd" />

                            </td>
                            <td>
                                <a href="<%=path %>/msg/queryById/${msg.id}" style="color: #99cdff;">详情</a>

                            </td>
                        </tr>
                    </c:forEach>


                </table>


            </div>
        </div>
    </div>
</div>


<!-- 全局js -->
<script src="<%=path %>/js/user/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/user/bootstrap.min.js?v=3.3.6"></script>



<!-- 自定义js -->
<script src="<%=path %>/js/user/content.js?v=1.0.0"></script>


<!-- iCheck -->
<script src="<%=path %>/js/user/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

    function refreshMsg(pageNo) {
        window.location.href = "<%=path %>/msg/msg_pager?page=" + pageNo + "&rows=10";
    }

    function previous(pageNo) {
        var pageNo1 = parseInt(pageNo) - 1;
        window.location.href = "<%=path %>/msg/msg_pager?page=" + pageNo1 + "&rows=10";
    }

    function next(pageNo, total) {
        var pageNo1 = parseInt(pageNo) + 1;
        var maxPage = Math.ceil(parseInt(total) / 10);
        if (pageNo1 > maxPage) {
            pageNo1 = maxPage;
        }
        window.location.href = "<%=path %>/msg/msg_pager?page=" + pageNo1 + "&rows=10";
    }
</script>




</body>

</html>

