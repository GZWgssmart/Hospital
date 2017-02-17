<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 5/17/16
  Time: 16:15
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
    <meta name="renderer" content="webkit">

    <title> 用户 - 主页</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">

        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:16px;">
                                        <strong class="font-bold">欢迎您，</strong>
                                        <select style="color: red; border: none; background-color: rgba(0,0,0,0)" name="logout" onChange="logout(this)">
                                            <option value="y">${sessionScope.user.name }</option>
                                            <option value="n">安全退出</option>
                                        </select>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">
                        ${sessionScope.user.name }
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">功能菜单</span>
                </li>
                <li>
                    <a class="J_menuItem" href="<%=path %>/user/index_demo">
                        <img src="<%=path %>/images/home.png">
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li>
                    <a class="J_menuItem" href="<%=path %>/user/query/${sessionScope.user.id }">
                        <img src="<%=path %>/images/user.png">
                        <span class="nav-label">个人信息</span>
                    </a>
                </li>
                <li>
                    <a class="J_menuItem" href="<%=path %>/msg/msg_pager?page=1&rows=10">
                        <img src="<%=path %>/images/contact.png">
                        <span class="nav-label">系统消息</span>
                    </a>
                </li>


            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><img src="<%=path %>/images/menu.png"> </a>
                
            </div>
        </nav>   
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="<%=path %>/user/index_demo" frameborder="0" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="<%=path %>/js/user/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/user/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=path %>/js/user/jquery.metisMenu.js"></script>
<script src="<%=path %>/js/user/jquery.slimscroll.min.js"></script>

<!-- 自定义js -->
<script src="<%=path %>/js/user/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="<%=path %>/js/user/index.js"></script>

<script>
    function logout(name) {
        var value = name.options[name.selectedIndex].value;
        if (value == "n") {
            $.get("<%=path %>/user/logout", function(data) {
                window.location.reload();
            });
        }
    }

</script>

</body>

</html>
