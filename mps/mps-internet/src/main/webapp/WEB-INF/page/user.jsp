<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/17
  Time: 0:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/user.css" />
<script src="${pageContext.request.contextPath}/resources/scripts/user.js"></script>

    <div class="center">
        <div class="infomation">

            <jsp:include page="decorators/left.jsp" />

            <div class="right">
                <div class="userTitle">
                    个人资料
                </div>
                <div class="userInfo">
                    <div class="inner">
                        <div class="info">
                            <p>
                                <span class="same">用&nbsp;&nbsp;户&nbsp;&nbsp;名：&nbsp;&nbsp;&nbsp;</span><span class="re">${userDTO.usernameM}</span>
                            </p>
                            <p>
                                <span class="same">实&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;&nbsp;&nbsp;</span><span class="re">${userDTO.realNameM}</span>
                            </p>
                            <p>
                                <span class="same">余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：&nbsp;&nbsp;&nbsp;</span><span class="re">${userDTO.amountN}</span>
                            </p>
                            <p>
                                <span class="same">连&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;队：&nbsp;&nbsp;&nbsp;</span><span class="gr">${userDTO.companyName}</span>
                            </p>
                            <p>
                                <span class="same">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;</span><span class="gr">${userDTO.sexX}</span>
                            </p>
                            <p>
                                <span class="same">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：&nbsp;&nbsp;&nbsp;</span><span class="gr">${userDTO.ageN}</span>
                            </p>
                            <p>
                                <span class="same">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：&nbsp;&nbsp;&nbsp;</span><span class="gr">${userDTO.emailX}</span>
                            </p>
                            <p>
                                <span class="same">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：&nbsp;&nbsp;&nbsp;</span><span class="gr">${userDTO.phoneX}</span>
                            </p>
                            <p>
                                <span class="same">注册时间&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span><span><fmt:formatDate value="${userDTO.crtOnDt}" pattern="yyy-MM-dd"/></span>
                            </p>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>

</body>
</html>
