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
    <title>客户列表-***医院系统</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" href="<%=path %>/css/site_main.css"/>

    <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/jquery.form.js"></script>
    <script src="<%=path %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <script src="<%=path %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="<%=path %>/js/site_easyui.js"></script>

    <script src="<%=path %>/js/doctor/doctor.js"></script>

    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript">
        function dept(value) {
            return value.name;
        }
    </script>
</head>
<body>
<table id="list" class="easyui-datagrid" toolbar="#tb" style="height:100%;"
       data-options="
        url:'<%=path %>/doctor/search_pager',
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
        <th field="id" checkbox="true" width="50">管理员ID</th>
        <th field="name" width="150">名称</th>
        <th field="major" width="100">专长</th>
        <th field="dept" width="80" formatter="dept">科室</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="openWinFitPos('addWin');">添加</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="showEdit();">修改</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" plain="true"
       onclick="seeDes();">查看描述</a>
</div>

<div class="easyui-window site_win_small input_big" id="addWin" data-options="title:'添加医生',resizable:false,mode:true,closed:true" style="width:700px; height: 400px">
    <form:form id="addForm" modelAttribute="doctor">
        <table>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="name" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true" style="width: 600px;"/></td>
            </tr>
            <tr>
                <td>专长:</td>
                <td><input type="text" name="major" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true" style="width: 600px;"/></td>
            </tr>
            <tr>
                <td>科室:</td>
                <td>
                    <select id="addDeptId" name="dept.id" class="easyui-validatebox easyui-combobox"
                            data-options="url:'<%=path %>/dept/all',method:'get',valueField:'id',textField:'text',
                           panelHeight:'auto',editable:false,required:true,novalidate:true" style="width: 600px;"></select>
                </td>
            </tr>
            <tr>
                <td>描述:</td>
                <td>
                    <script id="addEditor" type="text/plain" name="des" style="width: 600px; height: 200px;"></script>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="button" class="easyui-linkbutton" onclick="add();">确认</button>
                </td>
            </tr>
        </table>
    </form:form>
</div>

<div class="easyui-window site_win_small input_big" id="editWin" data-options="title:'修改医生信息',resizable:false,mode:true,closed:true" style="width:700px; height: 400px">
    <form id="editForm" modelAttribute="doctor">
        <input type="hidden" name="id" />
        <table>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="name" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true" style="width: 600px;"/></td>
            </tr>
            <tr>
                <td>专长:</td>
                <td><input type="text" name="major" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true" style="width: 600px;"/></td>
            </tr>
            <tr>
                <td>科室:</td>
                <td>
                    <select id="editDeptId" name="dept.id" class="easyui-validatebox easyui-combobox"
                            data-options="editable:false,required:true,novalidate:true" style="width: 600px;"></select>
                </td>
            </tr>
            <tr>
                <td>描述:</td>
                <td>
                    <script id="editEditor" type="text/plain" name="des" style="width: 600px; height: 200px;"></script>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="button" class="easyui-linkbutton" onclick="edit();">确认</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<div class="easyui-window site_win_small input_big" id="seeWin" data-options="title:'查看描述',resizable:false,mode:true,closed:true" style="width:700px; height: 400px">
    <div id="des"></div>
</div>

</body>
<script src="<%=path %>/js/window.js"></script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('addEditor');
    var ue1 = UE.getEditor('editEditor');

    ue.ready(function() {
        ue.setContent("");
    });

    $(function() {
        setWin();
    });

</script>
</html>
