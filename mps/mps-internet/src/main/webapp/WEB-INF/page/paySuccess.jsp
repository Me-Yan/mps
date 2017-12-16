<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/16
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付成功</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/styles/paySuccess.css"></script>

    <div class="center" style="height: 500px;line-height: 500px;text-align: center;font-size: 20px;">
        <span>支付成功，<span class="time">5</span>秒后自动跳转到首页！</span><a href="${pageContext.request.contextPath}/product/listProduct">点我立即跳转到首页</a>
    </div>

    <script>
        $(function(){
            var flag = 4;
            var val = setInterval(function(){
                if(flag==0) {
                    clearInterval(val);
                    window.location.href = "${pageContext.request.contextPath}/product/listProduct";
                }
                $('.time').text(flag);
                flag--;

            }, 1000);
        });
    </script>

</body>
</html>
