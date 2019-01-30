<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/21
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
    <link rel="stylesheet" type="text/css" href="css-styles/login.css"/>
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        function zwx() {
            var username = $("#username").val();
            var password = $("#password").val();
            var code=$("#authnumber").val();
            $.ajax({
                url: "/match",
                dataType: "json",
                data: {"username": username, "password": password,"code":code},
                type: "POST",
                success: function (result) {
                    //请求成功
                    if (result==1) {
                        $("#form").submit();
                    } else if(result==0) {
                        alert("用户名或密码错误");
                    }else
                    {
                        alert("验证码错误！");
                    }
                }
            })
        }
        function changeImg() {
            var imgSrc = $("#imgObj");
            var src = imgSrc.attr("src");
            imgSrc.attr("src", chgUrl(src));
        }
        // 时间戳
        // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
        function chgUrl(url) {
            var timestamp = (new Date()).valueOf();
            url = url.substring(0, 20);
            if ((url.indexOf("&") >= 0)) {
                url = url + "×tamp=" + timestamp;
            } else {
                url = url + "?timestamp=" + timestamp;
            }
            return url;
        }
    </script>
<body class="login">
<!--用户登录模块-->
<div id="loginGF">
    <div class="title">
        <img src="/images/logo.png"  style="margin-left: 60px;margin-top: 40px">
        <div class="LoginTittle" style="margin-left: 5px">输电线路覆冰厚度预测平台</div>
    </div>
    <form action="/login" method="post" id="form">

        <div id="login">
            <div id="loginForm">

                <div class="headArea">用户登录</div>
                <div class="userArea">
                    <span class="userIcon"></span>
                    <input class="login_input" id="username" name="username" tabindex="1"
                           maxLength="30" size="19"
                           placeholder="用户名" title="请填写用户名"/>
                </div>
                <div class="passwordArea">
                    <span class="passwordIcon"></span>
                    <input class="login_input" id="password" name="password" tabindex="2"
                           maxLength="30" size="19"
                           title="请填写用户密码" placeholder="密码" type="password"
                           AUTOCOMPLETE="off"/>
                </div>
                <!--验证码显示view -->
                <div class="yanzArea" id="authnumberTd" style="border: none;">
                <span class="yanzm">
                    <span class="yanzmIcon"></span>
                    <input class="login_input yanz_input" id="authnumber" name="authnumber"
                           tabindex="3" maxlength="30"
                           size="19" placeholder="验证码" title="请填写右边图片中数字"/>
                </span>
                    <span><img id="imgObj" alt="验证码" src="/getCode"></span>
                    <span><a href="#" onclick="changeImg()">换一张</a></span>
                </div>
                <div class="login_button_div">
                    <input id="loginSubmitButton" class="login_button" type="button"
                           tabindex="4" onclick="zwx()"
                           value="登  录"/>
                </div>
                <div class="login_copyright"></div>
            </div>
        </div>

    </form>

</div>
</body>
</html>