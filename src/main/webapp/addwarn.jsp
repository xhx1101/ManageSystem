<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-10-23
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预警添加</title>
    <link rel="stylesheet" type="text/css" href="css-styles/main.css"/>
    <script src="js/jquery-1.4.1.min.js"></script>
    <script language="javascript">
        function goto() {
           window.location.replace("main.jsp");
        }
        function go() {
            $("#form1").submit();
            alert("添加成功！！！");
            var t = document.getElementById("operator");
            t.value = "";
            var t1 = document.getElementById("operation");
            t1.value = "";
            var t2 = document.getElementById("remarks");
            t2.value = "";
    }

    </script>

    <script type="text/javascript">
        $(function() {// 初始化内容
            $.ajax({
                url:"/realget",
                type: "POST",
                dataType:"json",
                success: function (result) {
                    var obj=result[0];
                    $("#thickness").val(obj.thinkness);
                }
            })
        });
    </script>




</head>
<body onload="getTime()">
<form action="addWarn" method="post" id="form1" target="rfFrame">

    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#F9FCF3">
    <tr>
        <col width="40"/>
        <col width="60"/>
        <col width="120"/>
        <col/>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2">
            <table cellpadding="0" cellspacing="0" width="100%" border="0" class="nobord">
                <img src="/images/tb.gif" width="22" height="21" align="absmiddle"/> <span class="bt1">添加预警信息</span>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2" style="line-height: 220%;">
           <label>信息类别：</label>
            <div style="font-size: 13px;font-color:red">
                <span style="color:#ab1e1e ;font-size: 10px;">覆冰厚度(mm)&nbsp;&nbsp;&nbsp;</span><input type="text" class="item7" name="thickness" id="thickness" style="width: 97px"/>
                &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                <input type="button"  onclick="go()" value="添加"  style="width:50px;height:25px;border: 2px solid #38B1B9;">
                 &nbsp; &nbsp;&nbsp;&nbsp;<input type="button" onclick="goto()" value="返回" style="width:50px;height:25px;border: 2px solid #38B1B9;">
            </div>
            <div>
                <span>添加时间&nbsp;&nbsp;&nbsp;</span><input type="text"  id="time" name="time"style="width: 141px"/>
                <script language="JavaScript" type="text/javascript">
                    var date = new Date();
                    var year = date.getFullYear(),
                        month = date.getMonth() + 1,//月份是从0开始的
                        day = date.getDate(),
                        hour = date.getHours(),
                        min = date.getMinutes(),
                        sec = date.getSeconds();
                    var newTime = year + '-' +
                        month + '-' +
                        day + ' ' +
                        hour + ':' +
                        min + ':' +
                        sec;
                    document.getElementById("time").value = newTime;
                </script>
            </div>
            <div>
                <span class="name4" style="margin-left: 0px;">预警等级&nbsp;&nbsp;</span>
                <select name="grade" size="1" class="font1" style="width: 140px;height: 20px;">
                    <option value="1">一级预警</option>
                    <option value="2">二级预警</option>
                    <option value="三级">三级预警</option>
                    <option value="四级">四级预警</option>
                    <option value="五级">五级预警</option>
                    <option value="六级">六级预警</option>
                 </select>
            </div>
            <div>
                <span>处理人：&nbsp;&nbsp;&nbsp;</span><input type="text" class="item5" id="operator" name="operator" style="width: 140px"/>
            </div>
            <div>
                <span>操作意见：</span><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <textarea name="operation"  id="operation" rows=5 cols=50></textarea><br>
                <span style="font-size: 13px">备注：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <textarea name="remarks" id="remarks" rows=1 cols=50></textarea>
            </div>
        </td>
    </tr>
</table>
</form>
<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
</body>
</html>
