<%@ page import="redis.clients.jedis.Jedis" %>
<%--
  Created by IntelliJ IDEA.
  User: JT
  Date: 2014/8/23
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String content = request.getParameter("content");
    Jedis jedis = new Jedis("192.168.79.100");
    jedis.publish("tv1", content);
%>
</body>
</html>
