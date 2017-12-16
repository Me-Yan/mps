<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/15
  Time: 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>付款页面</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles/orderForm.css">
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.js"></script>

    <input hidden value="${orderDTO.totalN}" id="totalN" />
    <input hidden value="${orderDTO.orderId}" id="orderId" />

    <!--中间详细内容-->
    <div class="center">
        <div class="orderForm">
            <form action="" class="order" name="orderForm" id="orderForm">

                <!--具体商品内容-->
                <div class="details">
                    <div class="topTitle">
                        <span class="goods">商品</span>
                        <span class="price">单价(元)</span>
                        <span class="number">数量</span>
                        <span class="total">小计(元)</span>
                    </div>
                    
                    <c:choose>
                        <c:when test="${not empty orderDTO.orderItemDTOList}">
                            <c:forEach items="${orderDTO.orderItemDTOList}" var="orderItem">
                                <div class="productList">
                                    <input type="hidden" name="pid" value="1">
                                    <div class="proImg">
                                        <img src="${pageContext.request.contextPath}/file/${orderItem.imagePath}" alt="">
                                    </div>
                                    <div class="proName">
                                        <a href=""><c:out value="${orderItem.productName}" /></a>
                                    </div>
                                    <div class="proPrice">
                                        <c:out value="${orderItem.priceN}" />
                                    </div>
                                    <div class="proNumber">
                                        <span>${orderItem.countN}</span>
                                    </div>
                                    <div class="proTotal">
                                        ${orderItem.totalN}
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="productList" style="text-align: center">
                                该订单没有任何商品。
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="clearBoth"></div>
                </div>

                <!--提交订单-->
                <div class="conCart">
                    <div class="conRight">
                        <span class="subtotal">总计：<span>${orderDTO.totalN}</span>元</span>
                        <span class="conClick" id="submitOrder"><a>提交订单</a></span>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>确认付款?</p>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="confirmBtn">确认</button>
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
                    <p>您的余额不足。</p>
                </div>
            </div>
        </div>
    </div>

    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script type="text/javascript">
        /*回到顶部*/
        $('.to-top').toTop();

        $("#submitOrder").on("click", function () {
            $("#confirmModal").modal("show");
        });

        $("#confirmBtn").on("click", function () {
            var totalN = $("#totalN").val();
            var orderId = $("#orderId").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/order/confirmPay",
                type: "post",
                data: {
                    totalN: totalN,
                    orderId: orderId
                },
                success: function (data) {
                    $("#confirmModal").modal("hide");
                    if ("success"===data.msg) {
                        window.location.href = "${pageContext.request.contextPath}/order/paySuccess";
                    } else {
                        $("#failModal").modal("show");
                    }
                }
            });
        });
    </script>
</body>
</html>
