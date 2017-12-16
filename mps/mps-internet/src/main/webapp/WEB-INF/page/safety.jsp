<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/17
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>安全中心</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/safety.css" />

    <div class="center">
        <div class="safety">

            <jsp:include page="decorators/left.jsp" />

            <div class="right">
                <div class="safetyTitle">
                    安全中心
                </div>
                <div class="safetyInfo">
                    <div class="info">
                        <div class="edit">
                            <i class="fa fa-key fa-3x"></i>
                            <span class="e">
                                    <strong>修改密码</strong>经常的更换您的账户密码，并且不要和其他账户共用同一个密码
                                </span>
                            <a class="editPwd">修改密码</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
</body>
</html>
