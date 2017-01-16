<%--
  Created by IntelliJ IDEA.
  User: WangGenshen
  Date: 5/18/16
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>客户列表-青岛宝瑞液晶综合信息屏媒体系统</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>

    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/jquery.form.js"></script>
    <script src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="<%=path %>/js/site_easyui.js"></script>

    <script src="<%=path %>/js/user/users.js"></script>
</head>
<body>
<table id="list" class="easyui-datagrid" toolbar="#tb" style="height:100%;"
       data-options="
        url:'<%=path %>/user/search_pager',
        method:'get',
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				pagination:true,
				border:false,
				pageSize:20,
				rowStyler: function(index,row){
					if (row.role == 'super'){
						return 'background-color:#ccc;';
					} else if (row.status == 'N') {
					    return 'color:red;';
					}
				}">
    <thead>
    <tr>
        <th field="id" checkbox="true" width="50">用户ID</th>
        <th field="name" width="100">姓名</th>
        <th field="phone" width="80">手机号</th>
        <th field="createdTime" width="120" formatter="formatterDate">注册时间</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div class="input_small">
        <form id="searchForm" modalAttribute="user">
            姓名:<input type="text" name="name" class="easyui-textbox"/>
            手机:<input type="text" name="phone" class="easyui-textbox"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
               onclick="doSearch();">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
               onclick="searchAll();">查询所有</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
               onclick="refreshAll();">刷新</a>
        </form>
    </div>
</div>

</body>
</html>
