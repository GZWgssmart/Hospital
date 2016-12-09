var contextPath = '';

function redirectIndex(needRedirect) {
    if (needRedirect == "redirect") {
        $.messager.alert("提示", "登录信息无效，请重新登录", "info", function() {
            top.location.href = "/admin/login_page";
        });
    }
}

function login() {
    $.post(contextPath + "/admin/login",
        $("#login_form").serialize(),
        function (data) {
            var result = data.result;
            if(result == "success") {
                window.location.href = contextPath + "/admin/home";
            } else {
                $("#errMsg").html(data.message);
            }
        }
    );
}