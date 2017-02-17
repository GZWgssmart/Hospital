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
    <title>管理员信息-***医院系统</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>

    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/jquery.form.js"></script>
    <script src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="<%=path %>/js/site_easyui.js"></script>

    <script src="<%=path %>/js/hospital/info.js"></script>


</head>
<body>
<table id="info" class="site_table">
    <caption>医院基本信息</caption>
    <thead>
    <tr>
        <th>名称</th>
        <th>值</th>
    </tr>
    <tr>
        <td>医院名称</td>
        <td>${requestScope.hospital.name }</td>
    </tr>
    <tr>
        <td>医院等级</td>
        <td>${requestScope.hospital.level }</td>
    </tr>
    <tr>
        <td>医院地址</td>
        <td>${requestScope.hospital.address }</td>
    </tr>
    <tr>
        <td>电话</td>
        <td>${requestScope.hospital.telNo }</td>
    </tr>
    <tr>
        <td>网址</td>
        <td>${requestScope.hospital.webAddress }</td>
    </tr>
    <tr>
        <td>公交路线</td>
        <td>${requestScope.hospital.busLine }</td>
    </tr>
    <tr>
        <td>经度</td>
        <td>${requestScope.hospital.longidute }</td>
    </tr>
    <tr>
        <td>纬度</td>
        <td>${requestScope.hospital.laditude }</td>
    </tr>
    <tr>
        <td>描述</td>
        <td>${requestScope.hospital.des }</td>
    </tr>
    <tr>
        <td>平面图</td>
        <td>${requestScope.hospital.image }</td>
    </tr>
    </thead>
</table>
<div>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="openWin('editWin');">修改</a>
</div>

<div class="easyui-window site_win_small input_big" id="editWin" data-options="title:'修改医院信息',resizable:false,mode:true,closed:true">
    <div id="errMsg"></div>
    <form:form id="editForm" method="post" modelAttribute="hospital">
        <form:hidden path="id" />
        <table>
            <tr>
                <td>医院名称:</td>
                <td><form:input type="text" path="name" class="easyui-validatebox easyui-textbox"
                                data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>医院等级:</td>
                <td><form:input type="text" path="level" class="easyui-validatebox easyui-textbox"
                                data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>医院地址:</td>
                <td><form:input type="text" path="address" class="easyui-validatebox easyui-textbox"
                                data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><form:input type="text" path="telNo" class="easyui-numberbox easyui-textbox"
                                data-options="required:true,validType:'length[11,11]',novalidate:true"/></td>
            </tr>
            <tr>
                <td>网址:</td>
                <td><form:input type="text" path="webAddress" class="easyui-validatebox easyui-textbox"
                                data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>公交路线:</td>
                <td><form:input type="text" path="busLine" class="easyui-validatebox easyui-textbox"
                                data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>经度:</td>
                <td><form:input type="text" path="longidute" class="easyui-numberbox easyui-textbox"
                                data-options="required:true,validType:'length[1,11]',novalidate:true"/></td>
            </tr>
            <tr>
                <td>纬度:</td>
                <td><form:input type="text" path="laditude" class="easyui-numberbox easyui-textbox"
                                data-options="required:true,validType:'length[1,11]',novalidate:true"/></td>
            </tr>
            <tr>
                <td>描述:</td>
                <td><form:input type="text" path="des" class="easyui-textbox" data-options="multiline:true,required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td><button type="button" class="easyui-linkbutton" onclick="closeWin('editWin');">取消</button></td>
                <td>
                    <button type="button" class="easyui-linkbutton" onclick="edit('${requestScope.hospital.id }');">确认</button>
                </td>
            </tr>
        </table>
    </form:form>
</div>

</body>
</html>
