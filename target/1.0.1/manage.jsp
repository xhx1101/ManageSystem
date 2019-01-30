<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/22
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理页</title>
    <link rel="stylesheet" type="text/css" href="css-styles/manage.css" />
    <!--<meta http-equiv="refresh" content="20">-->
    <!--<script type="text/javascript" >location.reload([false])</script>-->
    <script src="js/jquery.js"></script>
    <script type="text/javascript" >
        <!--点击事件的判断，显示进入哪个页面-->
        function hate(a) {
            var src="";
            switch (a)
            {
                case 1:
                    src="/index.jsp";
                    break;
                case 2:
                    src="/analyse.jsp";
                    break;
                case 3:
                    src="/modify.jsp";
                    break;
            }
            $("#frame").attr("src",src);
        }
    </script>
</head>
<body>
<!--  头部 -->
<div class="container_title" style="height:100px;background:-webkit-linear-gradient(top,white,lightblue,skyblue)">
    <img src="/images/headlogo.png" class="pic">
</div>
<!-- 导航栏 -->
<div class="container_navigation" style="background:-webkit-linear-gradient(left,white,lightgoldenrodyellow,lightgreen)"><div class="titleA" style="margin-left: 70%">欢迎访问!</div>
</div>
<!-- 中间 -->
<div class="container_main" style="background-image:url('/images/bg01.jpeg'); background-size:100% 100%;background-repeat: no-repeat;">
    <div class="row">
        <div class="left-column" style="margin: unset">
            <div class="tab" style="border: 1px solid black">常用功能</div>
            <div class="sidebar-box gallery-list">
                <div class="design" id="leftcolumn">
                    <a href="main.jsp" target="iframe_a" style="background:lightblue; border: 1px solid black"><img src="/images/coin04.png" class="pic1">实时查询</a>
                    <a href="query.jsp" target="iframe_a"style="border: 1px solid black"><img src="/images/coin06.png" class="pic2">历史查询</a>
                    <a href="analyse.jsp" target="iframe_a" style="background:lightblue; border: 1px solid black"><img src="/images/coin07.png" class="pic3">图形分析</a>
                    <a href="analyse_thk.jsp" target="iframe_a" style=" border: 1px solid black"><img src="/images/coin08.png" class="pic3">厚度预测</a>
                    <a href="warning.jsp" target="iframe_a"style="background:lightblue;border: 1px solid black"><img src="/images/coin12.png" class="pic5">等级分类</a>
                    <a href="journal.jsp" target="iframe_a" style=" border: 1px solid black"><img src="/images/coinL2.png" class="pic6">预警日志</a>
                    <a href="modify.jsp" target="iframe_a" style="background:lightblue;border: 1px solid black"><img src="/images/coin10.png" class="pic4">修改密码</a>
                    <a  href="/delete" style="border: 1px solid black"><img src="/images/coin09.png" class="pic5">注销登录</a>
                </div>
            </div>
        </div>
        <div class="right-column" style="background-image: unset">
            <iframe id="frame" frameborder="0" src="/main.jsp" name="iframe_a"></iframe>
        </div>
    </div>
</div>
</body>
</html>