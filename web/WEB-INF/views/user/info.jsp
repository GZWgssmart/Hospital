<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 5/18/16
  Time: 19:27
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


    <title>个人资料</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInRight">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>个人资料</h5>
                </div>
                <div>

                    <div class="ibox-content profile-content">
                        <h5>
                            姓名：
                        </h5>
                        <strong style="padding-left: 20px;">${sessionScope.user.name }</strong>

                        <h5>
                            联系方式：
                        </h5>
                        <p style="padding-left: 20px;">
                            ${sessionScope.user.phone }
                        </p>

                        <h5>
                            注册时间：
                        </h5>
                        <p style="padding-left: 20px;">
                            ${sessionScope.user.createdTime }
                        </p>

                        <div class="user-button">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a data-toggle="modal" class="btn btn-primary" href="<%=path %>/user/query/${sessionScope.user.id }#update-form"><img src="<%=path %>/images/edit.png" width="16" height="16">编辑资料</a>
                                </div>
                                <div class="col-sm-6">
                                    <a data-toggle="modal" class="btn btn-primary" href="<%=path %>/user/query/${sessionScope.user.id }#pwd-form"><img src="<%=path %>/images/edit.png" width="16" height="16">修改密码</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%-- 弹窗 --%>
<div id="update-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">修改资料</h3>
                        <form role="form" id="updateForm" method="post" modelAttribute="user">
                            <input type="hidden" value="${sessionScope.user.id }" name="id" />
                            <div class="form-group">
                                <label>姓名：</label>
                                <input type="text" value="${sessionScope.user.name }" name="name" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>联系电话：</label>
                                <input type="text" value="${sessionScope.user.phone }" name="phone" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>注册时间：</label>
                                <p class="form-control-static">${sessionScope.user.createdTime }</p>
                            </div>
                            <div>
                                <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="button" onclick="update()"><strong>修改</strong>
                                </button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<div id="pwd-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">修改密码</h3>
                        <form role="form" id="updatePwdForm" method="post">
                            <input type="hidden" value="${sessionScope.user.id }" name="id" />
                            <div id="errMsg" style="color: red; text-align: left;"></div>
                            <div class="form-group">
                                <label>旧密码：</label>
                                <input type="password" placeholder="请输入旧密码" id="pwd" name="pwd" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>新密码：</label>
                                <input type="password" placeholder="请输入新密码" id="newPwd" name="newPwd" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>确认密码：</label>
                                <input type="password" placeholder="请确认新密码" id="conPwd" name="conPwd" class="form-control" />
                            </div>
                            <div>
                                <button class="btn btn-sm btn-primary pull-right m-t-n-xs" type="button" onclick="updatePwd()"><strong>修改</strong>
                                </button>
                            </div>
                        </form>
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
<script src="<%=path %>/js/user/info.js"></script>


<!-- Peity -->
<script src="<%=path %>/js/user/jquery.peity.min.js"></script>

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
