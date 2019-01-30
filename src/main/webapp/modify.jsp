<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/29
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="css-styles/modify.css"/>
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        function modify() {
            var oldword = $("#oldword").val();
            var password = $("#assureword").val();
            $.ajax({
                url: "/modify",
                dataType: "json",
                data: {"oldword": oldword, "assureword": password},
                type: "POST",
                success: function (result) {
                    //请求成功
                    if (result == 1) {
                        //$("#form").submit();
                        alert("密码修改成功");
                    }
                    else if (result == 2) {
                        alert("原始密码错误，请重新进行修改");
                    } else {
                        alert("密码修改错误");
                    }
                    $("#oldword").val("");
                    $("#newword").val("");
                    $("#assureword").val("");
                }
            })
        }
    </script>
</head>
<body>
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/formValidator.js" type="text/javascript"></script>
<script src="js/formValidatorRegex.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        document.forms[0].onsubmit=function () {
            return $.formValidator.pageIsValid();
        };
        $.formValidator.initConfig({
            autotip: true,
            onerror:function(){
                alert("输入有误，无法提交，具体错误请看错误提示")}
        });
        $("#oldword").formValidator({
            onshow: "请输入原始密码",
            onfocus: "原始密码不能为空",
            oncorrect: ""
        }).inputValidator({
            min: 1, onerror: "原始密码不能为空"
        });
        $("#newword").formValidator({
            onshow: "请输入新密码",
            onfocus: "新密码至少3位",
            oncorrect: "密码合法"
        }).inputValidator({min: 3, onerror: "密码长度不能小于3位"})
            .compareValidator({
                desid: "oldword",
                operateor: "!=", onerror: "新密码和原始密码相同，重新更改密码"
        });
        $("#assureword").formValidator({
            onshow: "请再次输入新密码",
            onfocus: "两次密码必须一致",
            oncorrect: "输入正确"
        }).inputValidator({
            min: 1, onerror: "重复密码不能为空"
        }).compareValidator({
            desid: "newword",
            operateor: "=",
            datatype: "string",
            onerror: "确认密码不一致"
        });
    });
</script>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#F9FCF3">
<form>
    <col width="40"/>
    <col width="60"/>
    <col width="120"/>
    <col/>
    <tr>
        <td colspan="4" align="left" bgcolor="#F5F8F2">
            <table cellpadding="0" cellspacing="0" width="100%" border="0" class="nobord">
                <img src="/images/tb.gif" width="22" height="21" align="absmiddle"/><span class="bt1">修改密码</span>
            </table>
        </td>
    </tr>
    <tr>
        <td class="link1"><span class="link"  style="margin-left: 300px">原密码:</span></td>
        <td class="setting" ><input type="password" id="oldword" name="oldword" class="link2" ></td>
        <td id="oldwordTip"></td>
    </tr>
    <tr>
        <td class="link1"><span class="link"  style="margin-left: 300px">新密码:</span></td>
        <td class="setting"><input type="password" id="newword" name="newword" class="link2"></td>
        <td id="newwordTip"></td>
    </tr>
    <tr>
        <td class="link1"><span class="link" style="margin-left: 300px">确认密码:</span></td>
        <td class="setting"><input type="password" id="assureword" name="assureword" class="link2"></td>
        <td id="assurewordTip"></td>
    </tr>
    <tr>
        <td><input class="button" type="button" value="提交" style="margin-left: 320px" onclick="modify()"></td>
    </tr>
</form>
</table>
</body>
</html>
