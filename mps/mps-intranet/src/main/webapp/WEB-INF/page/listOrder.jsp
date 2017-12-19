<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/19
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/order.css" />
<style>
    a:focus,a:hover {
        text-decoration: none;
    }
    ul {
        margin: 0;
    }
</style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-3 col-sm-3">
                <select id="status" class="form-control">
                    <option value="">-- 所有订单 --</option>
                    <c:if test="${not empty orderStatusList}">
                        <c:forEach items="${orderStatusList}" var="status">
                            <option value="${status}" <c:if test="${status eq searchCriteria.status}">selected</c:if>>
                                <c:choose>
                                    <c:when test="${'Payed' eq status}">
                                        待确认
                                    </c:when>
                                    <c:when test="${'Confirmed' eq status}">
                                        待采购
                                    </c:when>
                                    <c:when test="${'Getted' eq status}">
                                        待收货
                                    </c:when>
                                    <c:when test="${'Over' eq status}">
                                        交易成功
                                    </c:when>
                                </c:choose>
                            </option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
    </div>

    <div class="order">
        <table class="orderTitle">
            <tr>
                <td>商品</td>
                <td>单价</td>
                <td>数量</td>
                <td>状态</td>
                <td>总价</td>
                <td>操作</td>
            </tr>
        </table>

        <!-- 订单详情 -->
        <c:choose>
            <c:when test="${not empty orderDTOList}">
                <c:forEach items="${orderDTOList}" var="order">
                    <table class="orderContent">
                        <tr class="info">
                            <td colspan="3"><span><fmt:formatDate value="${order.crtOnDt}" pattern="yyy-MM-dd HH:mm:ss" /></span>订单号：2016030717092643311&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;连队：${order.companyName}</td>
                        </tr>

                        <tr class="productList">
                            <td class="proInfo">
                                <c:forEach items="${order.orderItemDTOList}" var="orderItem">
                                    <ul <c:if test="${\"I\" eq orderItem.activeC}">style="background-color: #EEEEEE"</c:if>>
                                        <li><img src="${pageContext.request.contextPath}/file/${orderItem.imagePath}" alt=""></li>
                                        <li><span><c:out value="${orderItem.productName}" /></span></li>
                                        <li>￥${orderItem.priceN}</li>
                                        <li>${orderItem.countN}</li>
                                        <li>
                                            <c:choose>
                                                <c:when test="${\"A\" eq orderItem.activeC}">
                                                    &nbsp;
                                                </c:when>
                                                <c:when test="${\"I\" eq orderItem.activeC}">
                                                    已取消
                                                </c:when>
                                            </c:choose>
                                        </li>
                                        <div class="clearBoth"></div>
                                    </ul>
                                </c:forEach>
                            </td>

                            <td class="proTotal">
                                ￥<span>${order.totalN}</span>
                            </td>
                            <td class="proStatus">
                                <c:choose>
                                    <c:when test="${'Payed' eq order.statusX}">
                                        <button class="btn btn-primary confirm-order" data-orderid="${order.orderId}">确认订单</button>
                                    </c:when>
                                    <c:when test="${'Confirmed' eq order.statusX}">
                                        <button class="btn btn-primary get-order" data-orderid="${order.orderId}">采购完成</button>
                                    </c:when>
                                    <c:when test="${'Getted' eq order.statusX}">
                                        待基层用户确认收货
                                    </c:when>
                                    <c:when test="${'Over' eq order.statusX}">
                                        交易成功
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <table class="orderContent">
                    <tr>
                        <td colspan="5" align="center">没有找到匹配的记录</td>
                    </tr>
                </table>
            </c:otherwise>
        </c:choose>

        <c:if test="${not empty orderDTOList}">
            <div class="clearBoth"></div>
            <div class="pagination" style="float: right;">
                <div class="pageInner">
                    <c:choose>
                        <c:when test="${not empty orderDTOList}">
                            <span>共${orderDTOList.size()}个订单</span>
                        </c:when>
                        <c:otherwise>
                            <span>共0个订单</span>
                        </c:otherwise>
                    </c:choose>
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

        <dic class="clearBoth"></dic>
    </div>

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>确认该订单？</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="confirmBtn">确认</button>
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
                    <p>确认取消该商品?</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="getBtn">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

<form action="${pageContext.request.contextPath}/order/updateOrderStatus" id="orderForm" method="post">
    <input hidden name="orderId" id="orderId" value="${pageNation.curPage}"/>
    <input hidden name="outcome" id="outcome" value="${pageNation.curPage}"/>
</form>

<input hidden id="curPage" value="${pageNation.curPage}"/>

<script>
    $("#status").on("change", function () {
        $("#curPage").val(1);
        window.location.href = "${pageContext.request.contextPath}/order/listOrder?"+params();
    });

    $(".mps-pointer").on("click", function () {
        $("#curPage").val($(this).attr("data-page"));
        window.location.href = "${pageContext.request.contextPath}/order/listOrder?"+params();
    });

    function params() {
        var status = $("#status").val();
        var curPage = $("#curPage").val();

        return "status="+status+"&curPage="+curPage;
    }

    var orderId;
    $(".confirm-order").on("click", function () {
        orderId = $(this).attr("data-orderid");
        $("#confirmModal").modal("show");
    });
    $("#confirmBtn").on("click", function () {
        $("#outcome").val("Confirmed");
        $("#orderId").val(orderId);
        $("#orderForm").serialize();
        $("#orderForm").submit();
    });

    $(".get-order").on("click", function () {
        orderId = $(this).attr("data-orderid");
        $("#getModal").modal("show");
    });
    $("#getBtn").on("click", function () {
        $("#outcome").val("Getted");
        $("#orderId").val(orderId);
        $("#orderForm").serialize();
        $("#orderForm").submit();
    });
</script>

</body>
</html>
