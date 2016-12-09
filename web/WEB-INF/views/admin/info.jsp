<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 5/18/16
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>管理员信息-青岛宝瑞液晶综合信息屏媒体系统</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>

    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/jquery.form.js"></script>
    <script src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="<%=path %>/js/site_easyui.js"></script>

    <script src="<%=path %>/js/admin/info.js"></script>


</head>
<body>
<table id="info" class="site_table">
    <caption>我的基本信息</caption>
    <thead>
    <tr>
        <th>名称</th>
        <th>值</th>
    </tr>
    <tr>
        <td>邮箱</td>
        <td>${requestScope.admin.email }</td>
    </tr>
    <tr>
        <td>姓名</td>
        <td>${requestScope.admin.name }</td>
    </tr>
    <tr>
        <td>手机</td>
        <td>${requestScope.admin.phone }</td>
    </tr>
    <tr>
        <td>角色</td>
        <td>
            <c:choose>
                <c:when test="${requestScope.admin.role == 'super' }">
                    超级管理员
                </c:when>
                <c:otherwise>
                    普通管理员
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td>状态</td>
        <td>
            <c:choose>
                <c:when test="${requestScope.admin.status == 'Y' }">
                    可用
                </c:when>
                <c:otherwise>
                    不可用
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <td>创建时间</td>
        <td><fmt:formatDate value="${requestScope.admin.createTime }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
    </tr>
    <tr>
        <td>上一次登录时间</td>
        <td><fmt:formatDate value="${requestScope.admin.lastLoginTime }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
    </tr>
    <tr>
        <td>登录时间</td>
        <td><fmt:formatDate value="${requestScope.admin.loginTime }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
    </tr>
    </thead>
</table>
<div>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="openWin('editWin');">修改</a>
</div>

<div class="easyui-window site_win_small input_big" id="editWin" data-options="title:'修改账号信息',resizable:false,mode:true,closed:true">
    <div id="errMsg"></div>
    <form:form id="editForm" method="post" modelAttribute="admin">
        <form:hidden path="id" />
        <table>
            <tr>
                <td>邮箱:</td>
                <td><form:input type="text" path="email" class="easyui-textbox" readonly="true"/></td>
            </tr>
            <tr>
                <td>姓名:</td>
                <td><form:input type="text" path="name" class="easyui-validatebox easyui-textbox"
                                data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>手机:</td>
                <td><form:input type="text" path="phone" class="easyui-numberbox easyui-textbox"
                                data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
            </tr>
            <tr>
                <td><button type="button" onclick="closeWin('editWin');">取消</button></td>
                <td>
                    <button type="button" onclick="edit('${requestScope.admin.id }');">确认</button>
                </td>
            </tr>
        </table>
    </form:form>
</div>

</body>
</html>
