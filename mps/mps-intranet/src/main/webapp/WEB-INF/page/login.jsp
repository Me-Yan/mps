<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/4
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/login.css" />
</head>
<body>

    <div class="header">
        <div class="title">
            <span>基层物资采购后勤管理系统</span>
        </div>
        <div class="tip">
            <span><c:if test="${'fail' eq msg}">用户名或密码错误</c:if></span>
        </div>
    </div>

    <div class="sign">
        <div class="inner">
            <form action="${pageContext.request.contextPath}/login" name="loginForm" id="loginForm" method="post">
                <p>
                    <input type="text" name="usernameM" class="name" placeholder="请输入用户名"/>
                </p>
                <p>
                    <input type="password" name="passwordX" class="password" placeholder="请输入密码"/>
                </p>
                <p>
                    <a class="btn">登录</a>
                </p>
            </form>
        </div>
    </div>

<script>
    $(function(){

        $('.btn').click(function(){
            var flag = true;
            if(!$('.name').val()) {
                $('.name').css('border', '1px solid #e14041');
                flag = false;
            }
            if(!$('.password').val()||!$('.name').val()) {
                $('.password').css('border', '1px solid #e14041');
                flag = false;
            }
            if(flag) {
                $('#loginForm').serialize();
                $('#loginForm').submit();
            } else {
                $(".tip span").text("");
            }
        });
        $('input').focus(function(){
            $(this).css('border', '1px solid #3A4147');
        });
    });
</script>
</body>
</html>
