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