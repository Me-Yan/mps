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
</head>
<body>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/login.css" />

    <div class="header">
        <div class="title">
            <span>基层物资采购后勤管理系统</span>
        </div>
        <div class="tip">
            <span>很高兴认识你</span>
        </div>
    </div>

    <div class="sign">
        <div class="inner">
            <form action="" name="loginForm" id="loginForm" method="post">
                <p>
                    <input type="text" name="name" class="name" placeholder="请输入用户名"/>
                </p>
                <p>
                    <input type="text" name="password" class="password" placeholder="请输入密码"/>
                </p>
                <p>
                    <a class="btn">登录</a>
                </p>
            </form>
        </div>
    </div>

<script>
    $(function(){
        var flag = true;
        $('.btn').click(function(){
            if($('.name').val()==""||$('.name')==null) {
                $('.name').css('border', '1px solid #e14041');
            flag = false;
            }
            if($('.password').val()==""||$('.name')==null) {
                $('.password').css('border', '1px solid #e14041');
                flag = false;
            }
            if(flag) {
                $('#loginForm').serialize();
                $('#loginForm').submit();
            }
        });
        $('input').focus(function(){
            $(this).css('border', '1px solid #3A4147');
        });
    });
</script>
</body>
</html>
