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
    <title>管理员账号设置-***医院系统</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>

    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/jquery.form.js"></script>
    <script src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="<%=path %>/js/site_easyui.js"></script>

    <script src="<%=path %>/js/admin/setting.js"></script>


</head>
<body>
<div id="errMsg"></div>
<form:form id="updateForm" method="post" modelAttribute="admin">
    <table class="input_big">
        <caption>修改账号密码</caption>
        <tr>
            <td>原密码：</td>
            <td><input type="password" name="pwd" class="easyui-validatebox easyui-textbox"
                       data-options="required:true,validType:'length[6,20]',novalidate:true"/></td>
        </tr>
        <tr>
            <td>新密码:</td>
            <td><input type="password" name="newPwd" class="easyui-validatebox easyui-textbox"
                       data-options="required:true,validType:'length[6,20]',novalidate:true"/></td>
        </tr>
        <tr>
            <td>确认密码:</td>
            <td><input type="password" name="conPwd" class="easyui-validatebox easyui-textbox"
                       data-options="required:true,validType:'length[6,20]',novalidate:true"/></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="button" class="easyui-linkbutton" onclick="updatePwd();">确认</button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
