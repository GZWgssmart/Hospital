var contextPath = '';

$(function() {
    setPagination("#list");
    $("#statusSearch").combobox({
        onChange:function(n, o){
            if (n != o) {
                doSearch();
            }
        }
    });
});

function add() {
    toValidate("addForm");
    if (validateForm("addForm")) {
        $.post(contextPath + "/articleType/add",
            $("#addForm").serialize(),
            function (data) {
                if (data.result == "success") {
                    $("#addWin").window("close");
                    dataGridReload("list");
                    $("#addForm").form("clear");
                } else if (data.result == 'notLogin') {
                    $.messager.alert("提示", data.message, "info", function() {
                        toAdminLoginPage();
                    });
                } else {
                    $.messager.alert("提示", data.message, "info");
                }
            }
        );
    }
}

function showEdit() {
    var row = selectedRow("list");
    if (row) {
        $("#editForm").form("load", row);
        openWin("editWin");
    } else {
        $.messager.alert("提示", "请选择需要修改的医生信息", "info");
    }
}

function edit() {
    toValidate("editForm");
    if (validateForm("editForm")) {
        $.post(contextPath + "/articleType/update",
            $("#editForm").serialize(),
            function (data) {
                if (data.result == "success") {
                    closeWin("editWin");
                    $.messager.alert("提示", data.message, "info", function () {
                        dataGridReload("list");
                    });
                } else if (data.result == 'notLogin') {
                    $.messager.alert("提示", data.message, "info", function() {
                        toAdminLoginPage();
                    });
                } else {
                    $("#errMsg").html(data.message);
                }
            }
        );
    }
}

function doSearch() {
    $("#list").datagrid({
        url:contextPath + '/articleType/search_pager',
        pageSize:20,
        queryParams:getQueryParams("list", "searchForm")
    });
    setPagination("#list");
}

function searchAll() {
    $("#searchForm").form("clear");
    $("#list").datagrid({
        url:contextPath + '/articleType/search_pager',
        pageSize:20,
        queryParams:getQueryParams("list", "searchForm")
    });
    setPagination("#list");
}

function refreshAll() {
    $("#list").datagrid("reload");
}