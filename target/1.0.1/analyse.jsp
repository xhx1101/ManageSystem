<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/29
  Time: 9:41
  To change this template use File | Settings | File Templates.
  微气象数据分析页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css-styles/analyse.css"/>
    <script type="text/javascript" src="js/WdatePicker.js"></script>
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {// 初始化内容
            $("#to").val(GetDateStr(0));//现在的时间
            $("#from").val(GetDateStr(-7));//一星期前
            //return like();
            return func();
        });
        function GetDateStr(AddDayCount) {
            var dd = new Date();
            dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
            var y = dd.getFullYear();
            var m = dd.getMonth()+1;//获取当前月份的日期
            var d = dd.getDate();
            return y+"-"+m+"-"+d;
        }



        function func() {
            var vs = $('select  option:selected').val();
            var start = document.getElementById("from").value;
            var end = document.getElementById("to").value;
            var flag = true;
            if (start.length == 0 || end.length == 0) {
                alert("请选择一个时间段!");
                flag = false;
            }
            start = start.split("-");
            end = end.split("-");
            var dstart = new Date(start[0], start[1] - 1, start[2]);
            var dend = new Date(end[0], end[1] - 1, end[2]);
            if (dend < dstart) {
                alert("时间段选择有误，开始时间不能比结束时间晚!");
                flag = false;
            }
            else if (Math.round((dend - dstart) / 86400000) > 365) {
                alert("时间段跨度请勿超过一年!");
                flag = false;
            }


        }



        function like() {
            var vs = $('select  option:selected').val();
            var start = document.getElementById("from").value;
            var end = document.getElementById("to").value;
            var flag = true;
            if (start.length == 0 || end.length == 0) {
                alert("请选择一个时间段!");
                flag = false;
            }
            start = start.split("-");
            end = end.split("-");
            var dstart = new Date(start[0], start[1] - 1, start[2]);
            var dend = new Date(end[0], end[1] - 1, end[2]);
            if (dend < dstart) {
                alert("时间段选择有误，开始时间不能比结束时间晚!");
                flag = false;
            }
            else if (Math.round((dend - dstart) / 86400000) > 365) {
                alert("时间段跨度请勿超过一年!");
                flag = false;
            }
            if (vs == "a") {
                if (flag) {
                    var myChart = echarts.init(document.getElementById('main'));
                    // 显示标题，图例和空的坐标轴
                    var option = {
                        tooltip: {
                            show: true
                        },
                        title: {
                            text: '覆冰厚度预测分析'
                        },
                        legend: {
                            data: ['覆冰厚度(mm)']
                        },
                        xAxis: [{
                            type: 'category'
                        }],
                        yAxis: [{type: 'value'}],
                        dataZoom: [
                            {
                                type: 'slider',
                                show: true,
                                xAxisIndex: [0]
                            },
                            {
                                type: 'slider',
                                show: true,
                                yAxisIndex: [0],
                                left: '93%'
                            },
                            {
                                type: 'inside',
                                xAxisIndex: [0]
                            },
                            {
                                type: 'inside',
                                yAxisIndex: [0]
                            }
                        ],
                        series: [{
                            name: '覆冰厚度(mm)',
                            type: 'line'
                        }]
                    };
                    //加载数据
                    loadDATA(option);
                    // 为echarts对象加载数据
                    myChart.setOption(option);

                    // 异步加载数据
                    function loadDATA(option) {
                        var starttime = document.getElementById("from").value;//传送的起始时间数据
                        var endtime = document.getElementById("to").value;//传送的终止时间数据
                        $.ajax({
                            type: "post",
                            async: false, //同步执行
                            url: '/analyse',
                            data: {"starttime": starttime, "endtime": endtime + 1000 * 60 * 60 * 24},
                            dataType: "json", //返回数据形式为json
                            success: function (result) {
                                if (result) {
                                    //初始化option.xAxis[0]中的data
                                    option.xAxis[0].data = [];
                                    for (var i = 0; i < result.length; i++) {
                                        option.xAxis[0].data.push(result[i].time);
                                    }
                                    //初始化option.series[0]中的data
                                    var j;
                                    var sdx = ["thickness"];
                                    option.series[0].data = [];
                                    for (j = 0; j < result.length; j++) {
                                        option.series[0].data.push(result[j][sdx[0]]);
                                    }
                                }
                            }
                        });
                    };
                }
            }
            else if (vs == "b") {
                if (flag) {
                    var myChart = echarts.init(document.getElementById('main'));
                    // 显示标题，图例和空的坐标轴
                    var option = {
                        tooltip: {
                            show: true
                        },
                        title: {
                            text: '微气象数据分析'
                        },
                        legend: {
                            data: ['空气温度(°C)']
                        },
                        xAxis: [{
                            type: 'category'
                        }],
                        yAxis: [{type: 'value'}],
                        dataZoom: [
                            {
                                type: 'slider',
                                show: true,
                                xAxisIndex: [0]
                            },
                            {
                                type: 'slider',
                                show: true,
                                yAxisIndex: [0],
                                left: '93%'
                            },
                            {
                                type: 'inside',
                                xAxisIndex: [0]
                            },
                            {
                                type: 'inside',
                                yAxisIndex: [0]
                            }
                        ],
                        series: [{
                            name: '空气温度(°C)',
                            type: 'line'
                        }]
                    };
                    //加载数据
                    loadDATA(option);
                    // 为echarts对象加载数据
                    myChart.setOption(option);

                    // 异步加载数据
                    function loadDATA(option) {
                        var starttime = document.getElementById("from").value;//传送的起始时间数据
                        var endtime = document.getElementById("to").value;//传送的终止时间数据
                        $.ajax({
                            type: "post",
                            async: false, //同步执行
                            url: '/analyse',
                            data: {"starttime": starttime, "endtime": endtime + 1000 * 60 * 60 * 24},
                            dataType: "json", //返回数据形式为json
                            success: function (result) {
                                if (result) {
                                    //初始化option.xAxis[0]中的data
                                    option.xAxis[0].data = [];
                                    for (var i = 0; i < result.length; i++) {
                                        option.xAxis[0].data.push(result[i].time);
                                    }
                                    //初始化option.series[0]中的data
                                    var j;
                                    var sdx = ["airtem"];
                                    option.series[0].data = [];
                                    for (j = 0; j < result.length; j++) {
                                        option.series[0].data.push(result[j][sdx[0]]);
                                    }
                                }
                            }
                        });
                    };
                }
            }
            else if (vs == "c") {
                if (flag) {
                    var myChart = echarts.init(document.getElementById('main'));
                    // 显示标题，图例和空的坐标轴
                    var option = {
                        tooltip: {
                            show: true
                        },
                        title: {
                            text: '微气象数据分析'
                        },
                        legend: {
                            data: ['空气湿度(%)']
                        },
                        xAxis: [{
                            type: 'category'
                        }],
                        yAxis: [{type: 'value'}],
                        dataZoom: [
                            {
                                type: 'slider',
                                show: true,
                                xAxisIndex: [0]
                            },
                            {
                                type: 'slider',
                                show: true,
                                yAxisIndex: [0],
                                left: '93%'
                            },
                            {
                                type: 'inside',
                                xAxisIndex: [0]
                            },
                            {
                                type: 'inside',
                                yAxisIndex: [0]
                            }
                        ],
                        series: [{
                            name: '空气湿度(%)',
                            type: 'line'
                        }]
                    };
                    //加载数据
                    loadDATA(option);
                    // 为echarts对象加载数据
                    myChart.setOption(option);

                    // 异步加载数据
                    function loadDATA(option) {
                        var starttime = document.getElementById("from").value;//传送的起始时间数据
                        var endtime = document.getElementById("to").value;//传送的终止时间数据
                        $.ajax({
                            type: "post",
                            async: false, //同步执行
                            url: '/analyse',
                            data: {"starttime": starttime, "endtime": endtime + 1000 * 60 * 60 * 24},
                            dataType: "json", //返回数据形式为json
                            success: function (result) {
                                if (result) {
                                    //初始化option.xAxis[0]中的data
                                    option.xAxis[0].data = [];
                                    for (var i = 0; i < result.length; i++) {
                                        option.xAxis[0].data.push(result[i].time);
                                    }
                                    //初始化option.series[0]中的data
                                    var j;
                                    var sdx = ["airhum"];
                                    option.series[0].data = [];
                                    for (j = 0; j < result.length; j++) {
                                        option.series[0].data.push(result[j][sdx[0]]);
                                    }
                                }
                            }
                        });
                    };
                }
            }
            else if (vs == "d") {
                if (flag) {
                    var myChart = echarts.init(document.getElementById('main'));
                    // 显示标题，图例和空的坐标轴
                    var option = {
                        tooltip: {
                            show: true
                        },
                        title: {
                            text: '微气象数据分析'
                        },
                        legend: {
                            data: ['风速(m/s)']
                        },
                        xAxis: [{
                            type: 'category'
                        }],
                        yAxis: [{type: 'value'}],
                        dataZoom: [
                            {
                                type: 'slider',
                                show: true,
                                xAxisIndex: [0]
                            },
                            {
                                type: 'slider',
                                show: true,
                                yAxisIndex: [0],
                                left: '93%'
                            },
                            {
                                type: 'inside',
                                xAxisIndex: [0]
                            },
                            {
                                type: 'inside',
                                yAxisIndex: [0]
                            }
                        ],
                        series: [{
                            name: '风速(m/s)',
                            type: 'line'
                        }]
                    };
                    //加载数据
                    loadDATA(option);
                    // 为echarts对象加载数据
                    myChart.setOption(option);

                    // 异步加载数据
                    function loadDATA(option) {
                        var starttime = document.getElementById("from").value;//传送的起始时间数据
                        var endtime = document.getElementById("to").value;//传送的终止时间数据
                        $.ajax({
                            type: "post",
                            async: false, //同步执行
                            url: '/analyse',
                            data: {"starttime": starttime, "endtime": endtime + 1000 * 60 * 60 * 24},
                            dataType: "json", //返回数据形式为json
                            success: function (result) {
                                if (result) {
                                    //初始化option.xAxis[0]中的data
                                    option.xAxis[0].data = [];
                                    for (var i = 0; i < result.length; i++) {
                                        option.xAxis[0].data.push(result[i].time);
                                    }
                                    //初始化option.series[0]中的data
                                    var j;
                                    var sdx = ["windspeed"];
                                    option.series[0].data = [];
                                    for (j = 0; j < result.length; j++) {
                                        option.series[0].data.push(result[j][sdx[0]]);
                                    }
                                }
                            }
                        });
                    };
                }
            }
            else if (vs == "e") {
                if (flag) {
                    var myChart = echarts.init(document.getElementById('main'));
                    // 显示标题，图例和空的坐标轴
                    var option = {
                        tooltip: {
                            show: true
                        },
                        title: {
                            text: '微气象数据分析'
                        },
                        legend: {
                            data: ['风向(°)']
                        },
                        xAxis: [{
                            type: 'category'
                        }],
                        yAxis: [{type: 'value'}],
                        dataZoom: [
                            {
                                type: 'slider',
                                show: true,
                                xAxisIndex: [0]
                            },
                            {
                                type: 'slider',
                                show: true,
                                yAxisIndex: [0],
                                left: '93%'
                            },
                            {
                                type: 'inside',
                                xAxisIndex: [0]
                            },
                            {
                                type: 'inside',
                                yAxisIndex: [0]
                            }
                        ],
                        series: [{
                            name: '风向(°)',
                            type: 'line'
                        }]
                    };
                    //加载数据
                    loadDATA(option);
                    // 为echarts对象加载数据
                    myChart.setOption(option);

                    // 异步加载数据
                    function loadDATA(option) {
                        var starttime = document.getElementById("from").value;//传送的起始时间数据
                        var endtime = document.getElementById("to").value;//传送的终止时间数据
                        $.ajax({
                            type: "post",
                            async: false, //同步执行
                            url: '/analyse',
                            data: {"starttime": starttime, "endtime": endtime + 1000 * 60 * 60 * 24},
                            dataType: "json", //返回数据形式为json
                            success: function (result) {
                                if (result) {
                                    //初始化option.xAxis[0]中的data
                                    option.xAxis[0].data = [];
                                    for (var i = 0; i < result.length; i++) {
                                        option.xAxis[0].data.push(result[i].time);
                                    }
                                    //初始化option.series[0]中的data
                                    var j;
                                    var sdx = ["winddir"];
                                    option.series[0].data = [];
                                    for (j = 0; j < result.length; j++) {
                                        option.series[0].data.push(result[j][sdx[0]]);
                                    }
                                }
                            }
                        });
                    };
                }
            }
            else if (vs == "f") {
                if (flag) {
                    var myChart = echarts.init(document.getElementById('main'));
                    // 显示标题，图例和空的坐标轴
                    var option = {
                        tooltip: {
                            show: true
                        },
                        title: {
                            text: '微气象数据分析'
                        },
                        legend: {
                            data: ['光照强度(lux)']
                        },
                        xAxis: [{
                            type: 'category'
                        }],
                        yAxis: [{type: 'value'}],
                        dataZoom: [
                            {
                                type: 'slider',
                                show: true,
                                xAxisIndex: [0]
                            },
                            {
                                type: 'slider',
                                show: true,
                                yAxisIndex: [0],
                                left: '93%'
                            },
                            {
                                type: 'inside',
                                xAxisIndex: [0]
                            },
                            {
                                type: 'inside',
                                yAxisIndex: [0]
                            }
                        ],
                        series: [{
                            name: '光照强度(lux)',
                            type: 'line'
                        }]
                    };
                    //加载数据
                    loadDATA(option);
                    // 为echarts对象加载数据
                    myChart.setOption(option);

                    // 异步加载数据
                    function loadDATA(option) {
                        var starttime = document.getElementById("from").value;//传送的起始时间数据
                        var endtime = document.getElementById("to").value;//传送的终止时间数据
                        $.ajax({
                            type: "post",
                            async: false, //同步执行
                            url: '/analyse',
                            data: {"starttime": starttime, "endtime": endtime + 1000 * 60 * 60 * 24},
                            dataType: "json", //返回数据形式为json
                            success: function (result) {
                                if (result) {
                                    //初始化option.xAxis[0]中的data
                                    option.xAxis[0].data = [];
                                    for (var i = 0; i < result.length; i++) {
                                        option.xAxis[0].data.push(result[i].time);
                                    }
                                    //初始化option.series[0]中的data
                                    var j;
                                    var sdx = ["light"];
                                    option.series[0].data = [];
                                    for (j = 0; j < result.length; j++) {
                                        option.series[0].data.push(result[j][sdx[0]]);
                                    }
                                }
                            }
                        });
                    };
                }
            }

        }
    </script>
</head>


<body>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#F9FCF3">
    <tr>
        <form method="post">
            <col width="40"/>
            <col width="60"/>
            <col width="120"/>
            <col/>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2">
            <table cellpadding="0" cellspacing="0" width="100%" border="0" class="nobord">
                <img src="/images/tb.gif" width="22" height="21" align="absmiddle"/> <span class="bt1">微气象数据</span>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2" style="line-height: 220%;">
            分析数据类型：<label>微气象数据</label>
            <br/>数据时间：<input type="text" size="9" onclick="WdatePicker()" readonly="readonly" name="from" id="from"/>
            &nbsp;-&nbsp;<input type="text" size="9" onclick="WdatePicker()" readonly="readonly" name="to" id="to"/>
            &nbsp;&nbsp;
            <select  id="page">
                <option value="a">覆冰厚度</option>
                <option value="b">空气温度</option>
                <option value="c">空气湿度</option>
                <option value="d">风速</option>
                <option value="e">风向</option>
                <option value="f">光照强度</option>
            </select>
            &nbsp;&nbsp;<input type="button" value="查 询" class="iptbtn" onclick="like()"/>
        </td>
    </tr>
</table>

<!--图形分析dataset的位置样式-->
<div id="main" class="chartstyle"></div>
<script type="text/javascript">

</script>
</body>
</html>
