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

    <script src="<%=path %>/js/news/news.js"></script>

    <!-- 引用UEditor的配置文件 -->
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <!-- 引用UEditor的全部主文件 -->
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<table id="list" class="easyui-datagrid" toolbar="#tb" style="height:100%;"
       data-options="
        url:'<%=path %>/news/search_pager',
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
        <th field="title" width="150">标题</th>
        <th field="author" width="80">作者</th>
        <th field="abstracts" width="150">新闻摘要</th>
        <th field="content" width="200">内容</th>
        <th field="type" width="80">文章类型</th>
        <th field="pubTime" width="120" formatter="formatterDate">发布时间</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="openWinFitPos('addWin');">添加</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="showEdit();">修改</a>
</div>

<div class="easyui-window site_win_small input_big" id="addWin" data-options="title:'添加新闻动态',resizable:false,mode:true,closed:true" style="width:80%; height: 60%">
    <form:form id="addForm" modelAttribute="news">
        <table>
            <tr>
                <td>标题:</td>
                <td><input type="text" name="title" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>作者:</td>
                <td><input type="text" name="author" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>新闻摘要:</td>
                <td><input type="text" name="abstracts" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true" style="height: 100px;"/></td>
            </tr>
            <tr>
                <td>内容:</td>
            </tr>
            <tr>
                <td>
                    <script id="editor" type="text/plain" name="content"></script>
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

<div class="easyui-window site_win_small input_big" id="editWin" data-options="title:'修改文章类型',resizable:false,mode:true,closed:true">
    <form id="editForm" modelAttribute="news">
        <input type="hidden" name="id" />
        <table>
            <tr>
                <td>标题:</td>
                <td><input type="text" name="title" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>作者:</td>
                <td><input type="text" name="author" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true"/></td>
            </tr>
            <tr>
                <td>新闻摘要:</td>
                <td><input type="text" name="abstracts" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true" style="height: 100px;"/></td>
            </tr>
            <tr>
                <td>内容:</td>
                <td><input type="text" name="content" class="easyui-validatebox easyui-textbox"
                           data-options="required:true,novalidate:true"/></td>
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

</body>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

</script>
</html>
