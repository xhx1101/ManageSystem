<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/6
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主界面</title>
    <link rel="stylesheet" type="text/css" href="css-styles/main.css"/>
    <script src="js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript">
        $(function() {// 初始化内容
            $.ajax({
                url:"/realget",
                type: "POST",
                dataType:"json",
                success: function (result) {
                    var obj=result[0];
                    $("#realtime").val(obj.time);
                    $("#airtem").val( obj.airtem);
                    $("#airhum").val(obj.airhum);
                    $("#windspeed").val(obj.windspeed);
                    $("#winddir").val( obj.winddir);
                    $("#light").val(obj.light);
                    $("#thinkness").val(obj.thinkness);
                }
            })
        });
    </script>

    <script language="javascript">
        function goto() {
            window.location.replace("addwarn.jsp");
        }
    </script>
</head>
<body>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#F9FCF3">
    <tr>
        <col width="40"/>
        <col width="60"/>
        <col width="120"/>
        <col/>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2">
            <table cellpadding="0" cellspacing="0" width="100%" border="0" class="nobord">
                <img src="/images/tb.gif" width="22" height="21" align="absmiddle"/> <span class="bt1">最新数据显示</span>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2" style="line-height: 220%;">
            监控类型：<label>所有类别</label>
            <div style="font-size: 15px;font-color:red">
            <span>覆冰厚度(mm)</span><input type="text" class="item7" id="thinkness" name="thinkness"  readonly="true" style="width: 108px;"/>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                <button  onclick="goto()" style="width: 120px;height: 25px;border: 3px solid royalblue;">添加预警</button>
            </div>

            <div>
                <span>数据时间</span><input type="text" class="item1" id="realtime" name="realtime" readonly="true"/>
                <span class="name2">空气温度(°C)</span><input type="text" class="item2" id="airtem" name="airtem" readonly="true"/>
            </div>

            <div>
                <span>空气湿度(%)</span><input type="text" class="item3" id="airhum" name="airhum" readonly="true"/>
                <span class="name6">风速(m/s)</span><input type="text" class="item6" id="windspeed" name="windspeed" readonly="true"/>
            </div>



            <div>
                <span>风向(°)</span><input type="text" class="item7" id="winddir" name="winddir" readonly="true"/>
                <span class="name8">光照强度(lux)</span><input type="text" class="item8" id="light" name="light" readonly="true"/>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
