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
        $.post(contextPath + "/admin/add",
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
        $.messager.alert("提示", "请选择需要修改的管理员信息", "info");
    }
}

function edit() {
    toValidate("editForm");
    if (validateForm("editForm")) {
        $.post(contextPath + "/admin/update",
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

function showUpdatePwd() {
    var row = selectedRow("list");
    if (row) {
        $("#editPwdForm").form("load", row);
        $("#update_password").textbox("setValue", "");
        openWin("editPwdWin");
    } else {
        $.messager.alert("提示", "请选择需要修改密码的管理员", "info");
    }
}

function updatePwd() {
    toValidate("editPwdForm");
    if (validateForm("editPwdForm")) {
        $.messager.confirm("提示", "更新该管理员密码，是否继续?", function(r) {
            if (r) {
                $.post(contextPath + "/admin/update_other_pwd",
                    $("#editPwdForm").serialize(),
                    function (data) {
                        if (data.result == "success") {
                            closeWin("editPwdWin");
                            $.messager.alert("提示", data.message, "info", function () {
                                // dataGridReload("list");
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
        });
    }
}

function inactive() {
    var row = selectedRow("list");
    if (row) {
        if (row.status == 'N') {
            $.messager.alert("提示", "管理员不可用,无需冻结", "info");
        } else {
            $.get(contextPath + "/admin/inactive?id=" + row.id,
                function (data) {
                    if (data.result == "success") {
                        $.messager.alert("提示", data.message, "info");
                        dataGridReload("list");
                    } else if (data.result == 'notLogin') {
                        $.messager.alert("提示", data.message, "info", function() {
                            toAdminLoginPage();
                        });
                    }
                });
        }
    } else {
        $.messager.alert("提示", "请选择需要冻结的管理员", "info");
    }
}

function active() {
    var row = selectedRow("list");
    if (row) {
        if (row.status == 'Y') {
            $.messager.alert("提示", "管理员可用,无需激活", "info");
        } else {
            $.get(contextPath + "/admin/active?id=" + row.id,
                function (data) {
                    if (data.result == "success") {
                        $.messager.alert("提示", data.message, "info");
                        dataGridReload("list");
                    } else if (data.result == 'notLogin') {
                        $.messager.alert("提示", data.message, "info", function() {
                            toAdminLoginPage();
                        });
                    }
                });
        }
    } else {
        $.messager.alert("提示", "请选择需要激活的管理员", "info");
    }
}

function doSearch() {
    $("#list").datagrid({
        url:contextPath + '/admin/search_pager',
        pageSize:20,
        queryParams:getQueryParams("list", "searchForm")
    });
    setPagination("#list");
}

function searchAll() {
    $("#searchForm").form("clear");
    $("#list").datagrid({
        url:contextPath + '/admin/search_pager',
        pageSize:20,
        queryParams:getQueryParams("list", "searchForm")
    });
    setPagination("#list");
}

function refreshAll() {
    $("#list").datagrid("reload");
}