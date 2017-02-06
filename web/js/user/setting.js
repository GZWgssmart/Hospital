var contextPath = '';

function updatePwd() {
    toValidate("updateForm");
    if (validateForm("updateForm")) {
        $.post(contextPath + "/customer/update_pwd",
            $("#updateForm").serialize(),
            function (data) {
                if (data.result == "success") {
                    $.messager.alert("提示", data.message, "info");
                    $("#updateForm").form("clear");
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