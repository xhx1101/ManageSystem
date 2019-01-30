<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-07-21
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预警界面</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/new_file.css">
    <script src="js/pie.js"></script>
    <style>
        table tr:hover{color: #09C;}
    </style>
</head>

<body style="width: 100%;height: 85%;">
<h1 style="color: red">危险等级说明及措施</h1>
<h3>覆冰厚度危险分级说明</h3>
<div class="tab_width" style="float: left;">
    <b class="t1" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f; margin: 0 5px;
    background: #F6F; display: block;overflow: hidden; height: 1px;"></b>
    <b class="t2" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f;margin: 0 3px;
    border-width: 2px; display: block;overflow: hidden; height: 1px;"></b>
    <b class="t3" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f; margin: 0 2px;
    display: block;overflow: hidden; height: 1px;"></b>
    <b class="t4" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f;  height: 0px;
    margin: 0 1px; display: block;overflow: hidden;"></b>
    <div class="tab" style="  border: 2px solid #f6f; height:100%;background: #F7F8F9;padding-top  :0px;">
        <table border="1px" style="height: 100%;border-collapse: collapse;" >
            <tr style="height: 10%">
                <td>危险级别</td>
                <td>覆冰厚度/mm</td>
                <td>覆冰特征</td>
                <td>一般措施</td>
            </tr>
            <tr class="bg1" style="background: #ccc;height: 15%">
                <td>一级</td>
                <td>10></td>
                <td>冰层特别厚，不易融化</td>
                <td>1、2、5</td>
            </tr>
            <tr class="bg2" style="background: #999;height: 15%">
                <td>二级</td>
                <td>7-8</td>
                <td>冰层较厚，不易融化</td>
                <td>3、6</td>
            </tr>
            <tr class="bg1" style="background: #ccc;height: 15%">
                <td>三级</td>
                <td>5-6</td>
                <td>冰层厚，合适天气能融化</td>
                <td>2</td>
            </tr>
            <tr class="bg2" style="background: #999;height: 15%">
                <td>四级</td>
                <td>3-4</td>
                <td>冰层不太厚，改变电压可以融化</td>
                <td>3、7</td>
            </tr>
            <tr class="bg1" style="background: #ccc;height: 15%">
                <td>五级</td>
                <td>1-2</td>
                <td>冰层不厚，易融化，无危险</td>
                <td>6、9</td>
            </tr>
            <tr class="bg2" style="background: #999;height: 15%">
                <td>六级</td>
                <td><1</td>
                <td>无危险，不用人工干预</td>
                <td>无</td>
            </tr>
        </table>
    </div>
    <b class="b4" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f;  height: 0px;
    margin: 0 1px; display: block;overflow: hidden;"></b>
    <b class="b3" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f; margin: 0 2px;
 display: block;overflow: hidden; height: 1px;"></b>
    <b class="b2" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f;margin: 0 3px;
    border-width: 2px; display: block;overflow: hidden; height: 1px;"></b>
    <b class="b1" style="  border-left: 2px solid #f6f;border-right: 2px solid #f6f; margin: 0 5px;
       background: #F6F; display: block;overflow: hidden; height: 1px;"></b>
</div>
<div id="my_container" style="width:500px; height:400px; margin-left: 500px;margin-top: -30px;filter:alpha(opacity=10);">
    <canvas id="pie_canvas" style="float: left"></canvas>
</div>
<br/><br/>
<div class="advice">
    <table  border="1px " text-align="center"style="border-collapse: collapse;border-top: #FF66FF;border-bottom: #FF66FF;
border-left: #FF66FF;boeder-right:#FF66FF">
        <tr style="background: #ccc;">
            <td>措施编号</td>
            <td colspan="3">具体措施</td>
            <td>措施编号</td>
            <td colspan="3">具体措施</td>

        </tr>
        <tr style="background: #999;">
            <td>1</td>
            <td colspan="3" style="width:300px">立刻用人工干预加物理干预的方法对合适的线路进行覆冰清理</td>
            <td>2</td>
            <td colspan="3" style="width:300px">进行人工干预的除冰方法</td>

        </tr>
        <tr style="background: #ccc;">
            <td>3</td>
            <td colspan="3" style="width:300px">采用改变输电线路电流电压值的方法进行干预</td>
            <td>4</td>
            <td colspan="3" style="width:300px">对气象情况做到精准分析</td>

        </tr>
        <tr style="background: #999;">
            <td>5</td>
            <td colspan="3" style="width:300px">加强对历史数据的分析</td>
            <td>6</td>
            <td colspan="3" style="width:300px">及时的对线路覆冰情况进行报告</td>

        </tr>
        <tr style="background: #ccc;">
            <td>7</td>
            <td colspan="3" style="width:300px">搞好线路通道的清理 </td>
            <td>8</td>
            <td colspan="3" style="width:300px">根据地形及地理环境选择观冰点</td>

        </tr>
        <tr style="background: #999;">
            <td>9</td>
            <td colspan="3" style="width:300px">事故及时抢修，避免在高山风口架立输电线路</td>
            <td>10</td>
            <td colspan="3" style="width:300px">加强日常维护保证输电线路的安全</td>

        </tr>
    </table>
    <br/><br/><br/><br/>
</div>
</body>
</html>
