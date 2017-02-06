<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/26
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">

        <div class="col-sm-12 animated fadeInRight">
            <div class="mail-box-header">

                <form method="get" action="index.html" class="pull-right mail-search">
                    <div class="input-group">
                        <input type="text" class="form-control input-sm" name="search" placeholder="搜索消息标题，正文等">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-sm btn-primary">
                                搜索
                            </button>
                        </div>
                    </div>
                </form>
                <h2>
                    系统消息 (2)
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <div class="btn-group pull-right">
                        <button class="btn btn-white btn-sm"><img src="<%=path %>/images/left.png" /></i>
                        </button>
                        <button class="btn btn-white btn-sm"><img src="<%=path %>/images/right.png" /></i>
                        </button>

                    </div>
                    <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新消息列表"><img src="<%=path %>/images/refresh.png" /> 刷新</button>


                </div>
            </div>
            <div class="mail-box">

                <table class="table table-hover table-mail">
                    <tr class="unread">
                        <td class="check-mail">
                            <input type="checkbox" class="i-checks">
                        </td>
                        <td class="mail-ontact">消息标题
                        </td>
                        <td class="mail-subject">消息的内容
                        </td>
                        <td class="">
                        </td>
                        <td class="text-right mail-date">发布的时间</td>
                    </tr>

                    <tr class="read">
                        <td class="check-mail">
                            <input type="checkbox" class="i-checks">
                        </td>
                        <td class="mail-ontact"><a href="mail_detail.html">某某通知</a>
                        </td>
                        <td class="mail-subject"><a href="mail_detail.html">通知的详情</a>
                        </td>
                        <td class="">
                        </td>
                        <td class="text-right mail-date">2017-01-15</td>
                    </tr>
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
</script>




</body>

</html>

