<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .left {
        width: 250px;
        margin-right: 15px;
        float: left;
        background-color: #fff;
    }
    .list li {
        height: 43px;
        line-height: 43px;
        text-align: center;
        font-size: 15px;
        border-bottom: 1px #E1E1E1 solid;
    }
    .list li a {
        display: block;
        height: 43px;
        width: 100%;
        color: #666;
    }
    .list li a:hover {
        background-color: #E14041;
        color: #fff;
    }
    .list .li-selected a {
        background-color: #E14041;
        color: #fff;
    }
</style>

<div class="left">
    <div class="list">
        <ul>
            <li <c:if test="${'user' eq position}">class="li-selected"</c:if>><a href="${pageContext.request.contextPath}/user/detail">个人资料</a></li>
            <li <c:if test="${'order' eq position}">class="li-selected"</c:if>><a href="${pageContext.request.contextPath}/order/listOrder">我的订单</a></li>
            <li <c:if test="${'comment' eq position}">class="li-selected"</c:if>><a href="${pageContext.request.contextPath}/comment/listComment">留言</a></li>
        </ul>
    </div>
</div>