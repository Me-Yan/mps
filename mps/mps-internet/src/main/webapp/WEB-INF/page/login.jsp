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

    <div class="demo form-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6">
                    <form class="form-horizontal" action="productList.html">
                        <span class="heading">用户登录</span>
                        <div class="form-group">
                            <input type="email" class="form-control" id="inputEmail3" placeholder="电子邮件">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group help">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="密码">
                            <i class="fa fa-lock"></i>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default">立刻登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
