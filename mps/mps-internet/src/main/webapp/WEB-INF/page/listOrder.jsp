<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/16
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/order.css" />
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.js"></script>
<style>
    body {
        background-color: #EDEDED;
    }
    a:hover {
        text-decoration: none;
    }

    .topNavLogout a:hover {
        text-decoration: none;
        color: #FFFFFF;
    }
</style>

    <!--中间主要内容部分-->
    <div class="center">
        <div class="myOrder">

            <jsp:include page="decorators/left.jsp" />

            <div class="right">
                <div class="orderTitle">
                    我的订单
                </div>
                <div class="orderList">
                    <div class="listInner">
                        <div class="infoTitle">
                            <ul>
                                <li class="goods">商品</li>
                                <li class="price">单价</li>
                                <li class="count">数量</li>
                                <li class="product-outcome">&nbsp;</li>
                                <li class="subtotal">总价</li>
                                <li class="status">状态</li>
                                <div class="clearBoth"></div>
                            </ul>
                        </div>

                        <!--例子-->
                        <c:choose>
                            <c:when test="${not empty orderDTOList}">
                                <c:forEach items="${orderDTOList}" var="order">
                                    <table class="orderInfo">
                                        <tr class="info">
                                            <td colspan="3"><span><fmt:formatDate value="${order.crtOnDt}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>订单号：${order.numberX}</td>
                                        </tr>

                                        <tr class="productList">
                                            <td class="proInfo">
                                                <c:forEach items="${order.orderItemDTOList}" var="orderItem">
                                                    <div class="product">
                                                        <a href="${pageContext.request.contextPath}/product/detail?productId=${orderItem.productId}" target="_blank" class="proImg"><img src="${pageContext.request.contextPath}/file/${orderItem.imagePath}" alt=""></a>
                                                        <span class="proName"><a href="${pageContext.request.contextPath}/product/detail?productId=${orderItem.productId}" target="_blank"><c:out value="${orderItem.productName}"/></a></span>
                                                        <span class="proPrice">￥<c:out value="${orderItem.priceN}"/></span>
                                                        <span class="proCount">${orderItem.countN}</span>
                                                        <span class="proOutcome">
                                                            <c:choose>
                                                                <c:when test="${'Pending' eq order.statusX or 'Payed' eq order.statusX}">
                                                                    <c:if test="${\"A\" eq orderItem.activeC}">
                                                                        <input style="cursor: pointer" type="button" data-orderid="${order.orderId}" data-orderitemid="${orderItem.orderItemId}" value="取消" class="cancel-orderitem"/>
                                                                    </c:if>
                                                                    <c:if test="${\"I\" eq orderItem.activeC}">
                                                                        已取消
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${\"A\" eq orderItem.activeC}">
                                                                        &nbsp;
                                                                    </c:if>
                                                                    <c:if test="${\"I\" eq orderItem.activeC}">
                                                                        已取消
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </span>
                                                        <div class="clearBoth"></div>
                                                    </div>
                                                </c:forEach>
                                            </td>

                                            <td class="proTotal">
                                                ￥<span>${order.totalN}</span>
                                            </td>
                                            <td class="proStatus">
                                                <c:choose>
                                                    <c:when test="${'Pending' eq order.statusX}">
                                                        <button type="button" class="pay-order" data-total="${order.totalN}" data-orderid="${order.orderId}">去付款</button>
                                                    </c:when>
                                                    <c:when test="${'Payed' eq order.statusX}">
                                                        等待后勤确认
                                                    </c:when>
                                                    <c:when test="${'Confirmed' eq order.statusX}">
                                                        采购中
                                                    </c:when>
                                                    <c:when test="${'Getted' eq order.statusX}">
                                                        <button type="button" class="get-order" data-orderid="${order.orderId}">确认领取</button>
                                                    </c:when>
                                                    <c:when test="${'Over' eq order.statusX}">
                                                        交易成功
                                                    </c:when>
                                                    <c:when test="${'Cancelled' eq order.statusX}">
                                                        已取消
                                                    </c:when>
                                                    <c:when test="${'Invalid' eq order.statusX}">
                                                        已作废
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </table>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <table class="orderInfo">
                                    <tr class="productList" style="border: none;">
                                        <td colspan="3" align="center">没有任何订单</td>
                                    </tr>
                                </table>
                            </c:otherwise>
                        </c:choose>
                        <div class="clearBoth"></div>

                        <!--分页-->
                        <c:if test="${not empty orderDTOList}">
                            <div class="page">
                                <div class="pageInner">
                                    <a <c:if test='${pageNation.curPage!=1}'>class="mps-pointer" data-page="1"</c:if>>首页</a>
                                    <a <c:if test='${pageNation.curPage!=1}'>class="mps-pointer" data-page="${pageNation.curPage-1}"</c:if>>上一页</a>

                                    <c:choose>
                                        <c:when test="${pageNation.totalPage lt 6}">
                                            <c:forEach begin="1" end="${pageNation.totalPage}" step="1" var="pageIndex">
                                                <c:choose>
                                                    <c:when test="${pageIndex eq pageNation.curPage}">
                                                        <a style="background-color: #E14041;color: #FFFFFF;">${pageIndex}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="mps-pointer" data-page="${pageIndex}">${pageIndex}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${pageNation.totalPage gt 5}">
                                            <c:choose>
                                                <c:when test="${pageNation.curPage lt 4}">
                                                    <c:forEach begin="1" end="3" step="1" var="pageIndex">
                                                        <c:choose>
                                                            <c:when test="${pageIndex eq pageNation.curPage}">
                                                                <a style="background-color: #E14041;color: #FFFFFF;">${pageIndex}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="mps-pointer" data-page="${pageIndex}">${pageIndex}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                                    <a>${pageNation.totalPage}</a>
                                                </c:when>
                                                <c:when test="${pageNation.curPage gt 3 and pageNation.curPage lt pageNation.totalPage-2}">
                                                    <a class="mpa-pointer" data-page="1">1</a>
                                                    <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                                    <a class="mpa-pointer" data-page="${pageNation.curPage-1}">${pageNation.curPage-1}</a>
                                                    <a style="background-color: #E14041;color: #FFFFFF;">${pageNation.curPage}</a>
                                                    <a class="mpa-pointer" data-page="${pageNation.curPage+1}">${pageNation.curPage+1}</a>
                                                    <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                                    <a class="mpa-pointer" data-page="${pageNation.totalPage}">${pageNation.totalPage}</a>
                                                </c:when>
                                                <c:when test="${pageNation.curPage gt pageNation.totalPage-3}">
                                                    <a class="mpa-pointer" data-page="1">1</a>
                                                    <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                                    <c:forEach begin="${pageNation.totalPage-2}" end="${pageNation.totalPage}" step="1" var="pageIndex">
                                                        <c:choose>
                                                            <c:when test="${pageIndex eq pageNation.curPage}">
                                                                <a style="background-color: #E14041;color: #FFFFFF;">${pageIndex}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="mps-pointer" data-page="${pageIndex}">${pageIndex}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </c:when>
                                    </c:choose>

                                    <a <c:if test='${pageNation.curPage!=pageNation.totalPage}'>class="mps-pointer" data-page="${pageNation.curPage+1}"</c:if>>下一页</a>
                                    <a <c:if test='${pageNation.curPage!=pageNation.totalPage}'>class="mps-pointer" data-page="${pageNation.totalPage}"</c:if>>末页</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
        <div style="height: 20px;"></div>
    </div>

    <div class="modal fade" id="orderItemModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>确认取消该商品?</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="orderItemBtn">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>确认支付?</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="payBtn">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="getModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>确认领取?</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="getBtn">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="failModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>取消该商品失败。</p>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="amountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>支付失败，您的月不足。</p>
                </div>
            </div>
        </div>
    </div>

<script>

    $(".mps-pointer").on("click", function () {
        var curPage = $(this).attr("data-page");
        window.location.href = "${pageContext.request.contextPath}/order/listOrder?curPage=" + curPage;
    });

    var orderItemId;
    var orderId;
    var totalN;
    $(".cancel-orderitem").on("click", function () {
        orderItemId = $(this).attr("data-orderitemid");
        orderId = $(this).attr("data-orderid");
        $("#orderItemModal").modal("show");
    });

    $(".pay-order").on("click", function () {
       orderId = $(this).attr("data-orderid");
        totalN = $(this).attr("data-total");
       $("#payModal").modal("show");
    });

    $("#payBtn").on("click", function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/order/confirmPay",
            type: "post",
            data: {
                totalN: totalN,
                orderId: orderId
            },
            success: function (data) {
                $("#orderItemModal").modal("hide");
                if ("success" === data.msg) {
                    window.location.href = "${pageContext.request.contextPath}/order/listOrder";
                } else {
                    $("#failModal").modal("show");
                }
            }
        });
    });

    $("#orderItemBtn").on("click", function () {
        $.ajax({
           url: "${pageContext.request.contextPath}/order/cancelOrderItem",
            type: "post",
            data: {
                orderId: orderId,
                orderItemId: orderItemId
            },
            success: function (data) {
               $("#orderItemModal").modal("hide");
               if ("success" === data.msg) {
                   window.location.href = "${pageContext.request.contextPath}/order/listOrder";
               } else {
                   $("#failModal").modal("show");
               }
            }
        });
    });

    $(".get-order").on("click", function () {
        orderId = $(this).attr("data-orderid");
       $("#getModal").modal("show");
    });

    $("#getBtn").on("click", function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/order/updateStatusByOrderId",
            type: "post",
            data: {
                orderId: orderId,
                statusX: "Over"
            },
            success: function (data) {
                $("#orderItemModal").modal("hide");
                if ("success" === data.msg) {
                    window.location.href = "${pageContext.request.contextPath}/order/listOrder";
                } else {
                    $("#failModal").modal("show");
                }
            }
        });
    });
</script>

</body>
</html>
