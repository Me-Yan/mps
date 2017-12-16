<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header">
    <!--头部 链接导向栏-->
    <div class="headerTop">
        <div class="topNav">
            <div class="topNavWel"><span>欢迎来到物资采购平台！</span></div>
            <div class="topNavLogout">
                <a href="${pageContext.request.contextPath}/product/listProduct">首页</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/cart/listCart">购物车</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/order/listOrder">我的订单</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/user/detail">个人中心</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="login.html" style="color: #E14041;">退出</a>
            </div>
        </div>
    </div>
</div>