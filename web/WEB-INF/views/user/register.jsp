<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 5/17/16
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>客户注册-青岛宝瑞液晶综合信息屏媒体系统</title>
    <style type="text/css">
        label{
            width:120px;
            display:block;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes//default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/themes//icon.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui/demo.css">
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path %>/js/customer/register.js"></script>
</head>
<body>
<h2>新增管理员</h2>
<div class="demo-info">
    <div class="demo-tip icon-tip"></div>
    <div>请安要求完成管理员注册</div>
</div>

<div style="margin:10px 0;"></div>
<div style="padding:10px;width:300px;height:300px;">
    <form:form action="/customer/reg" method="post" modelAttribute="customer">
        <div>
            <label for="email">用户名:</label>
                <form:input path="email" class="easyui-validatebox" type="email" name="email" data-options="required:true"/>
        </div>
        <div>
            <label>密码:</label>
            <form:password path="password" id="password" name="password" validType="length[4,32]" class="easyui-validatebox" required="true" value=""/>
        </div>
        <div>
           <%--<form:input path="lastLoginTime" val/>--%>
        </div>

        <div>
            <label for="txtCode">验证码:</label>

            <input name="txtCode" id="txtCode" class="reg_input_tcode_text" type="text" maxlength="4" onblur="checkCode()"/>
            <a href="javascript:loadimage();">
                <img alt="点击换一张" name="randImage" id="randImage" src="../js/image.jsp" style="cursor:pointer;vertical-align:middle;margin-left:1px; margin-top:-3px;height:30px;" />
            </a>
            <font style="color:green;font-size: 17px">${ms}</font>
        </div>


        <div>
            <input type="reset" value="重新填写">
            <input type="submit" value="提交数据">
        </div>
    </form:form>
</div>

</body>
</html>
