<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/20
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/main.css" />

    <div class="latest">

        <!-- 最新动态 -->
        <div class="latest-status">
            <div class="status-title">
                <span>最新动态</span>
            </div>
            <ul class="status-content">
                <li>
                    <ul>
                        <li>${dayCount}</li>
                        <li>日订单量</li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li>${amountCount}</li>
                        <li>日交易额</li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li>${allCount}</li>
                        <li>订单总量</li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li>￥${allAmount}</li>
                        <li>总交易额</li>
                    </ul>
                </li>
                <div class="clearBoth"></div>
            </ul>
        </div>

        <!-- 最近成功交易情况 -->
        <div class="latest-deal">
            <div class="deal-title">
                <span>最近成功交易</span>
            </div>
            <div class="deal-content">
                <ul>
                    <li>
                        <ul>
                            <li>用户名</li>
                            <li>订单编号</li>
                            <li>购买量</li>
                            <li>消费额</li>
                        </ul>
                    </li>
                    <c:choose>
                        <c:when test="${not empty orderDTOList}">
                            <c:forEach items="${orderDTOList}" var="order">
                                <li>
                                    <ul>
                                        <li>${order.username}</li>
                                        <li>${order.companyName}</li>
                                        <li>${order.createDate}</li>
                                        <li style="color: #e14041">￥${order.totalN}</li>
                                    </ul>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div style="width: 100%;text-align: center;height: 100px;line-height: 100px;">近期没有任何订单交易</div>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>
