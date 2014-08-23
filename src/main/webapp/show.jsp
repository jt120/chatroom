<%--
  Created by IntelliJ IDEA.
  User: JT
  Date: 2014/8/23
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<style>
    .container {
        width: 600px;
        height: 500px;
        border: 1px solid #CCC;
        margin: 0px auto;
    }
    #show {
        width: 580px;
        height: 300px;
        border: 1px solid #CCC;
        margin: 0px auto;
    }
    .info {
        width: 580px;
        height: 200px;
        margin: 0px auto;
    }
</style>
<body>
<div class="container">
    <div id="show"></div>
    <div class="info">
        <textarea style="width: 580px;" cols="50" rows="5"></textarea>
        <button onclick="pub()">提交</button>
    </div>
</div>

<script src="js/jquery.js"></script>
<script>
    //定义一个sub函数,来进行对redis服务器的订阅
    function sub() {
        $.post('sub.jsp', function (data) {//使用ajax的post请求sub.php页面
            if (data != "") {//如果有数据发布,就会插入到div层当中
                $("#show").append(data + "<br />");
            }
            $("textarea").val("");//清空textarea里面的值
            sub();//重新调用自己,重新去订阅redis服务器(无限循环的)
        });
    }
    sub();//第一次调用订阅函数


    function pub() {//定义发布函数
        $.post('pub.jsp', {'content': $('textarea').val()});//将textarea里面的值通过ajax的post请求发送到pub.php页面
    }
</script>
</body>
</html>
