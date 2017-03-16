<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/16
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 医院详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=pbQmAmbXrbWTloU2uPcyXXWrMIQh6PEX"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />

    <style>
        .my-content {
            padding: 1em;
        }
    </style>
</head>

<body class="gray-bg" style="height:100%;">
<div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="ibox" style="height: 55em;">
                <div class="my-content">

                    <div class="text-center article-title">
                        <h1>
                            ${requestScope.hospital.name}
                        </h1>
                        <p style="text-algin: center">
                            医院等级：${requestScope.hospital.level}
                        </p>
                    </div>
                    <p>
                        <label>医院地址：</label>
                        ${requestScope.hospital.address}
                        <br />
                        <label>医院网址：</label>
                        <a href="${requestScope.hospital.webAddress}">${requestScope.hospital.webAddress}</a>
                        <br />
                        <label>公交路线：</label>
                        ${requestScope.hospital.busLine}
                        <br />
                        <label>联系电话：</label>
                        ${requestScope.hospital.telNo}
                        <br />
                        <label>医院描述：</label>
                        ${requestScope.hospital.des}
                        <br />

                    </p>
                    <div><label>医院位置：</label></div>
                    <div id="mymap" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" style="height: 20em;"></div>

                </div>
            </div>
        </div>
    </div>

</div>

<!-- 全局js -->
<script src="<%=path %>/js/user/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/user/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="<%=path %>/js/user/content.js?v=1.0.0"></script>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("mymap", {minZoom:8,maxZoom:19});    // 创建Map实例
    var point = new BMap.Point(${requestScope.hospital.longidute}, ${requestScope.hospital.laditude});
    map.centerAndZoom(point, 16);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.setCurrentCity('${requestScope.hospital.address}');          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);

    var marker = new BMap.Marker(point);// 创建标注
    map.addOverlay(marker);             // 将标注添加到地图中
    marker.disableDragging();           // 不可拖拽

</script>



</body>

</html>

