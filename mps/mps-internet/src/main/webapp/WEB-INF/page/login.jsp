<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/12
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/login.css" />
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.bootstrap.js"></script>

    <div class="demo form-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6">
                    <form id="loginForm" class="form-horizontal" action="${pageContext.request.contextPath}/login" method="post">
                        <span class="heading">用户登录</span>
                        <div class="row" style="color: red;text-align: center" id="message">
                            <c:if test="${'fail' eq msg}">
                                <span>用户名或密码错误。</span>
                                <div style="height: 10px;"></div>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <input name="usernameM" type="text" class="form-control" id="username" placeholder="用户名">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group help">
                            <input name="passwordX" type="text" class="form-control" id="password" placeholder="密码">
                            <i class="fa fa-lock"></i>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-default" id="submitBtn">立刻登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            initLoginValidation();
        });

        $("#submitBtn").on("click", function () {
            var loginForm = $("#loginForm").data("formValidation");
            loginForm.validate();
            if (loginForm.isValid()) {
                $("#message").text("");
                var form = document.getElementById("loginForm");
                form.submit();
            }
        });

        function initLoginValidation() {
            $("#loginForm").formValidation({
                excluded: [':disabled'],
                framework: 'bootstrap',
                fields: {
                    usernameM: {
                        validators: {
                            notEmpty: {
                                message: '请输入用户名。'
                            }
                        }
                    },
                    passwordX: {
                        validators: {
                            notEmpty: {
                                message: '请输入密码。'
                            }
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>
