var contextPath = '';

function edit(id) {
    toValidate("editForm");
    if (validateForm("editForm")) {
        $.post(contextPath + "/user/update",
            $("#editForm").serialize(),
            function(data) {
                if(data.result == "success") {
                    closeWin("editWin");
                    $.messager.alert("提示", data.message, "info", function() {
                        window.location.href = contextPath + "/user/query/" + id;
                    });
                } else if (data.result == 'notLogin') {
                    $.messager.alert("提示", data.message, "info", function() {
                        toCustomerLoginPage();
                    });
                } else {
                    $("#errMsg").html(data.message);
                }
            }
        );
    }
}

function update() {
    $.post(contextPath + "/user/update",
        $("#updateForm").serialize(),
        function(data) {
            parent.location.href = contextPath + "/user/login_page";
        }
    );
}

function updatePwd() {
    $.post(contextPath + "/user/update_pwd",
        $("#updatePwdForm").serialize(),
        function(data) {
            if(data.result == "success") {
                parent.location.href = contextPath + "/user/login_page";
            } else if (data.result == 'notLogin') {
                parent.location.href = contextPath + "/user/login_page";
            } else {
                $("#errMsg").html(data.message);
            }
        }
    );
}