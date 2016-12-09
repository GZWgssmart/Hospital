var contextPath = '';

$(function() {
    setPagination("#list");
    $('#list').datagrid({
        onDblClickCell: function(rowIndex, rowData){
            showRes();
        }
    });
    $("#statusSearch").combobox({
        onChange:function(n, o){
            if (n != o) {
                doSearch();
            }
        }
    });
});

function showRes() {
    var row = selectedRow("list");
    if (row) {
        addTab(row.email + "的资源列表", contextPath + "/res/list_page_admin/" + row.id);
    } else {
        $.messager.alert("提示", "请先选择客户", "info");
    }
}

function doSearch() {
    $("#list").datagrid({
        url:contextPath + '/customer/search_pager',
        pageSize:20,
        queryParams:getQueryParams("list", "searchForm")
    });
    setPagination("#list");
}

function searchAll() {
    $("#searchForm").form("clear");
    $("#list").datagrid({
        url:contextPath + '/customer/search_pager',
        pageSize:20,
        queryParams:getQueryParams("list", "searchForm")
    });
    setPagination("#list");
}

function refreshAll() {
    $("#list").datagrid("reload");
}