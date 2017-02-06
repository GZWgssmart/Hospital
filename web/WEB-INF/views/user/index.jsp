<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/25
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title> - 主页示例</title>

    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="row">

                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title" style="border-bottom:none;background:#fff;">
                            <h5>服务器状态</h5>
                        </div>
                        <div class="ibox-content" style="border-top:none;">
                            <div id="flot-line-chart-moving" style="height:217px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<script src="<%=path %>/js/user/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/user/bootstrap.min.js?v=3.3.6"></script>
<!-- Flot -->
<script src="<%=path %>/js/user/jquery.flot.js"></script>
<script src="<%=path %>/js/user/jquery.flot.tooltip.min.js"></script>
<script src="<%=path %>/js/user/jquery.flot.resize.js"></script>
<script src="<%=path %>/js/user/jquery.flot.pie.js"></script>
<!-- 自定义js -->
<script src="<%=path %>/js/user/content.js"></script>
<!--flotdemo-->
<script type="text/javascript">
    $(function() {
        var container = $("#flot-line-chart-moving");
        var maximum = container.outerWidth() / 2 || 300;
        var data = [];

        function getRandomData() {
            if (data.length) {
                data = data.slice(1);
            }
            while (data.length < maximum) {
                var previous = data.length ? data[data.length - 1] : 50;
                var y = previous + Math.random() * 10 - 5;
                data.push(y < 0 ? 0 : y > 100 ? 100 : y);
            }
            var res = [];
            for (var i = 0; i < data.length; ++i) {
                res.push([i, data[i]])
            }
            return res;
        }
        series = [{
            data: getRandomData(),
            lines: {
                fill: true
            }
        }];
        var plot = $.plot(container, series, {
            grid: {

                color: "#999999",
                tickColor: "#f7f9fb",
                borderWidth:0,
                minBorderMargin: 20,
                labelMargin: 10,
                backgroundColor: {
                    colors: ["#ffffff", "#ffffff"]
                },
                margin: {
                    top: 8,
                    bottom: 20,
                    left: 20
                },
                markings: function(axes) {
                    var markings = [];
                    var xaxis = axes.xaxis;
                    for (var x = Math.floor(xaxis.min); x < xaxis.max; x += xaxis.tickSize * 2) {
                        markings.push({
                            xaxis: {
                                from: x,
                                to: x + xaxis.tickSize
                            },
                            color: "#fff"
                        });
                    }
                    return markings;
                }
            },
            colors: ["#4fc5ea"],
            xaxis: {
                tickFormatter: function() {
                    return "";
                }
            },
            yaxis: {
                min: 0,
                max: 110
            },
            legend: {
                show: true
            }
        });

        // Update the random dataset at 25FPS for a smoothly-animating chart

        setInterval(function updateRandom() {
            series[0].data = getRandomData();
            plot.setData(series);
            plot.draw();
        }, 40);
    });
    $(function() {
        function euroFormatter(v, axis) {
            return "&yen;"+v.toFixed(axis.tickDecimals);
        }
    });
</script>
</body>

</html>

