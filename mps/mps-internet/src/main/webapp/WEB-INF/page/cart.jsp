<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/15
  Time: 0:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/cart.css" />
<form:form action="${pageContext.request.contextPath}/order/add" modelAttribute="orderForm" commandName="orderForm" id="orderForm" method="post">
    <!--主要部分-->
    <div class="center">
        <div class="cart">
            <form action="" id="cartForm">
                <div class="title">
                    购物车
                </div>
                <div class="details">
                    <div class="topTitle">
                        <span class="goods">商品</span>
                        <span class="price">单价(元)</span>
                        <span class="number">数量</span>
                        <span class="total">小计(元)</span>
                        <span class="operate">操作</span>
                    </div>
                    <c:choose>
                        <c:when test="${not empty cartDTOList}">
                            <c:forEach items="${cartDTOList}" var="cart" varStatus="status">
                                <div class="productList" style="line-height: 100px;">
                                    <input hidden name="orderItemDTOList[${status.index}].productId" value="${cart.productId}"/>
                                    <div class="proImg">
                                        <img src="${pageContext.request.contextPath}/file/${cart.imagePath}" alt="">
                                    </div>
                                    <div class="proName">
                                        <a href="${pageContext.request.contextPath}/product/detail?productId=${cart.productId}" target="_blank"><c:out value="${cart.productName}"/></a>
                                    </div>
                                    <div class="proPrice"><c:out value="${cart.price}"/><input hidden name="orderItemDTOList[${status.index}].priceN" value="${cart.price}" /></div>
                                    <div class="proNumber">
                                        <a class="less fa fa-minus fa-0.1x"></a>
                                        <input type="text" class="countInput" name="orderItemDTOList[${status.index}].countN" value="${cart.countN}" />
                                        <a class="add fa fa-plus"></a>
                                        <span class="left-count" style="display: none;">${cart.leftCount}</span>
                                    </div>
                                    <div class="proTotal"><c:out value="${cart.totalN}"/></div>
                                    <input hidden name="orderItemDTOList[${status.index}].totalN" value="${cart.totalN}" />
                                    <div class="proOperate">
                                        <a class="mps-pointer" onclick="window.location.href='${pageContext.request.contextPath}/cart/delete?cartId=${cart.cartId}'">删除</a>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="productList" style="text-align: center">
                                没有任何商品。
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:if test="${not empty cartDTOList}">
                    <div class="conCart">
                        <div class="conRight">
                            <span class="subtotal"><input hidden name="totalN" value="${totalMoney}" class="totalInput" />总计：<span><c:out value="${totalMoney}"/></span>元</span>
                            <span class="conClick"><a class="mps-pointer">结算</a></span>
                        </div>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</form:form>

    <script type="text/javascript">

        $(".countInput").on("change", function () {
            var count = 1;
            if (!isNaN($(this).val())) {
                count = parseInt($(this).val());
            }

            if (count>parseInt($(this).next().next().text())||count<1) {
                count = 1
            }

            $(this).val(count);

            var subTotal = parseFloat($(this).parent().prev().text()) * count;
            $(this).parent().next().text(subTotal);
            $(this).parent().next().next().val(subTotal);
            total();
        });

        $(".less").on("click", function () {
            var count = 1;
            if (!isNaN($(this).next().val())) {
                count = parseInt($(this).next().val()) - 1;
                if (count<1) {
                    count = 1;
                }
                $(this).next().val(count);
            } else {
                $(this).val(1);
            }

            var subTotal = parseFloat($(this).parent().prev().text()) * count;
            $(this).parent().next().text(subTotal);
            $(this).parent().next().next().val(subTotal);
            total();
        });
        $(".add").on("click", function () {
            var count = 1;
            if (!isNaN($(this).prev().val())) {
                count = parseInt($(this).prev().val()) + 1;
                if (count>parseInt($(this).parent(".proNumber").find(".left-count").text())) {
                    count = $(this).parent(".proNumber").find(".left-count").text();
                }
                $(this).prev().val(count);
            } else {
                $(this).val(1);
            }

            var subTotal = parseFloat($(this).parent().prev().text()) * count;
            $(this).parent().next().text(subTotal);
            $(this).parent().next().next().val(subTotal);
            total();
        });
        
        function total() {
            var total = 0;
            $(".proTotal").each(function () {
                total += parseFloat($(this).text());
            });
            $(".subtotal span").text(total);
            $(".subtotal input").val(total);
        }

        $(".conClick").on("click", function () {
           $("#orderForm").serialize();
           $("#orderForm").submit();
        });
    </script>

</body>
</html>
