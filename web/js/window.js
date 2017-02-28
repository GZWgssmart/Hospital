/**
 * Created by Administrator on 2017/2/18.
 */
function setWin() {
    $('addWin').window({
        width: 700, // 宽度
        height: 500, // 高度
        modal: false, // 是否是模式窗口
        title: "添加", // 标题
        minimizable: true, // 是否显示最小化按钮
        maximizable: true, // 是否显示最大化按钮
        resizable: true, // 时候可以改变窗体大小
        closed: true, // 默认不显示窗口
        onOpen: function() { // 当窗口打开是发生
            $(".panel").css("z-index", "999");
            $(".window-shadow").css("z-index", "998");
        },
        onMove: function(left, top) { // 当窗口移动时发生
            $(".panel").css("z-index", "999");
            $(".window-shadow").css("z-index", "998");
        },
        onResize: function (width, height) { // 当窗口大小改变时发生
            $(".panel").css("z-index", "999");
            $(".window-shadow").css("z-index", "998");
        }
    });

    $('editWin').window({
        width: 700, // 宽度
        height: 500, // 高度
        modal: false, // 是否是模式窗口
        title: "修改", // 标题
        minimizable: true, // 是否显示最小化按钮
        maximizable: true, // 是否显示最大化按钮
        resizable: true, // 时候可以改变窗体大小
        closed: true, // 默认不显示窗口
        onOpen: function() { // 当窗口打开是发生
            $(".panel").css("z-index", "999");
            $(".window-shadow").css("z-index", "998");
        },
        onMove: function(left, top) { // 当窗口移动时发生
            $(".panel").css("z-index", "999");
            $(".window-shadow").css("z-index", "998");
        },
        onResize: function (width, height) { // 当窗口大小改变时发生
            $(".panel").css("z-index", "999");
            $(".window-shadow").css("z-index", "998");
        }
    });
}

function seeContent() {
    var row = selectedRow("list");
    if (row) {
        openWin("seeWin");
        var div = document.getElementById("content");
        div.innerHTML = row.content;
    } else {
        $.messager.alert("提示", "请选择需要查看的内容", "error");
    }
}

function seeDes() {
    var row = selectedRow("list");
    if (row) {
        openWin("seeWin");
        var div = document.getElementById("des");
        div.innerHTML = row.des;
    } else {
        $.messager.alert("提示", "请选择需要查看的描述信息", "error");
    }
}
