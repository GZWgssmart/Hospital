var contextPath = '';

function edit(id) {
    toValidate("editForm");
    if (validateForm("editForm")) {
        var path = "";
        if (id == null || id == "" || id == '0') {
            path = contextPath + "/hospital/add";
        } else {
            path = contextPath + "/hospital/update";
        }
        $.post(path, $("#editForm").serialize(),
            function (data) {
                if (data.result == "success") {
                    closeWin("editWin");
                    $.messager.alert("提示", data.message, "info", function () {
                        window.location.href = contextPath + "/hospital/query";
                    });
                } else if (data.result == 'notLogin') {
                    $.messager.alert("提示", data.message, "info", function () {
                        toAdminLoginPage();
                    });
                } else {
                    $("#errMsg").html(data.message);
                }
            }
        );
    }
}