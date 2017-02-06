var contextPath = '';

function loadimage(){
    // document.getElementById("randImage").src = "image.jsp";
    // 注意：这里加了?Math.random()因为有些浏览器会认为src没有变化，不会提交！！firefox下不会提交！！
    document.getElementById("randImage").src = "../js/image.jsp?"+Math.random();
}
function checkCode(){

    var txtCode=document.getElementById("txtCode").value;
    var codenull = document.getElementById("code    null");
    if(txtCode == null || txtCode == ""){
        codenull.innerHTML = "";
        return false;
    }else
        codenull.innerHTML = "";
    return true;
}

function register() {
    var name = document.getElementById("name").value;
    var phone = document.getElementById("phone").value;
    var pwd = document.getElementById("pwd").value;
    var pwd1 = document.getElementById("pwd1").value;
    if (name != "" && phone != "" && pwd != "" && pwd1 != "") {
        if (!isNaN(phone) && phone.length == 11) {
            if (pwd == pwd1) {
                return  true;
            } else {
                $("#errMsg").html("两次密码不一致");
            }
        } else {
            $("#errMsg").html("请输入正确的手机号");
        }
    } else {
        $("#errMsg").html("用户名、手机号和密码都不能为空");
    }
    return false;
}