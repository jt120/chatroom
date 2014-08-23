<%@ page import="redis.clients.jedis.Jedis" %>
<%@ page import="redis.clients.jedis.JedisSentinelPool" %>
<%@ page import="redis.clients.jedis.JedisPubSub" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
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
<body>
<%
    final JspWriter oo = out;
    final Jedis jedis = new Jedis("192.168.79.100");
    class MyListener extends JedisPubSub {
        public void onMessage(String channel, String message) {
            System.out.println("receive " + message);
            try {
                oo.println(message);
//                jedis.close();
//                System.exit(0);
                this.unsubscribe();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public void onSubscribe(String channel, int subscribedChannels) {
        }

        public void onUnsubscribe(String channel, int subscribedChannels) {
        }

        public void onPSubscribe(String pattern, int subscribedChannels) {
        }

        public void onPUnsubscribe(String pattern, int subscribedChannels) {
        }

        public void onPMessage(String pattern, String channel,
                               String message) {
        }
    }

    MyListener l = new MyListener();




    jedis.subscribe(l,"tv1");
%>
</body>
</html>
