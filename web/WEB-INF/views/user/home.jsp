<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 5/17/16
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>客户主页-青岛宝瑞液晶综合信息屏媒体系统</title>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/site_easyui.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" class="north">
    <img class="main_logo" src="<%=path %>/images/logo.jpg"/>

    <div class="north wel_msg">
        欢迎您:&nbsp;&nbsp;<b>${sessionScope.customer.email }</b>&nbsp;&nbsp;
        <a href="javascript:void(0);" onclick="toPage('<%=path %>/customer/home')">刷新主页</a>&nbsp;&nbsp;
        <a href="<%=path %>/customer/logout">安全退出</a>
    </div>
</div>
<div data-options="region:'west',split:true,title:'功能菜单'" class="west">
    <div class="easyui-accordion" data-options="border:false">
        <div title="用户管理" class="site_menu">
            <a href="javascript:void(0);" src="<%=path %>/customer/query/${sessionScope.customer.id }" class="site-navi-tab">账号信息</a></p>
            <a href="javascript:void(0);" src="<%=path %>/customer/setting_page" class="site-navi-tab">账号设置</a></p>
        </div>
        <div title="资源管理" class="site_menu">
            <a href="javascript:void(0);" src="<%=path %>/res/list_page" class="site-navi-tab">资源列表</a></p>
        </div>
        <div title="终端管理" class="site_menu">
            <a href="javascript:void(0);" src="<%=path %>/device/list_page" class="site-navi-tab">终端列表</a></p>
            <%--
            <ul class="easyui-tree" style="padding-bottom:10px;">
                <li>
                    <span>终端版本</span>
                    <ul>
                        <c:forEach items="${versions }" var="version">
                            <li>
                                <a href="javascript:void(0);" src="<%=path %>/device/list_page_version/${version.id }" class="site-navi-tab">${version.name }</a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
            --%>
            <a href="javascript:void(0);" src="<%=path %>/devgroup/list_page" class="site-navi-tab">终端分组列表</a></p>
        </div>
        <div title="发布计划" class="site_menu">
            <a href="javascript:void(0);" src="<%=path %>/pubplan/list_page" class="site-navi-tab">发布计划列表</a></p>
            <a href="javascript:void(0);" src="<%=path %>/pubplan/list_page_checking" class="site-navi-tab">发布计划审核</a></p>
            <a href="javascript:void(0);" src="<%=path %>/pubplan/list_page_checked" class="site-navi-tab">已审核未完成发布计划列表</a></p>
            <a href="javascript:void(0);" src="<%=path %>/pubplan/list_page_finish" class="site-navi-tab">已完成发布计划列表</a></p>
        </div>
    </div>
</div>
<div id="mainPanle" data-options="region:'center',border:true">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,border:false">
        <div title="主页">
            青岛宝瑞液晶综合信息屏媒体系统
        </div>
    </div>
</div>

<div data-options="region:'south',border:false" style="padding:10px auto 10px auto;text-align:center;">
    青岛宝瑞液晶综合信息屏媒体系统V1.0<br />
    地址：山东省青岛市崂山区株洲路140号&nbsp;&nbsp;技术支持:0532-80678775/80678776
</div>

<div id="mm" class="easyui-menu">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseother">关闭其他</div>
    <div id="mm-tabcloseall">关闭全部</div>
</div>
</body>
</html>
