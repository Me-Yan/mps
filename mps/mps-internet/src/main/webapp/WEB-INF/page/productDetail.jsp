<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/14
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/product.css" />
<script src="${pageContext.request.contextPath}/resources/scripts/product.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.bootstrap.js"></script>

    <div class="proInfo">
        <div class="product">
            <div class="proIntroduce">
                <div class="introLeft">
                    <img src="${pageContext.request.contextPath}/file/${productDTO.imagePathX}" width="250" height="250" alt="" id="midimg" />
                </div>
                <div class="introRight">
                    <span class="name"><c:out value="${productDTO.nameX}" /></span>
                    <p class="price"><span class="pr">价格</span><span class="sm">￥<span class="sPrice">${productDTO.priceN}</span></span></p>
                    <p>
                    <div class="count">
                        <span class="sl">数量</span>
                        <a class="less fa fa-minus fa-0.1x"></a>
                        <input type="text" class="countInput" value="1">
                        <a class="add fa fa-plus"></a>
                        <span class="dw"></span>
                        <span class="qd">1</span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库存剩余${productDTO.countN}</span>
                    </div>
                    </p>
                    <div class="buy">
                        <a class="bCart bnc" data-productid="${productDTO.productId}"><i class="fa fa-cart-arrow-down fa-1x"></i><span>加入购物车</span></a>
                        <a class="bnote bnc" data-toggle="modal" data-target="#commentModal"><span>留言</span></a>
                    </div>
                </div>
            </div>

            <div class="proRight">
                <div class="tabList">
                    <ul class="tabControl">
                        <li class="detail tClick">商品详情</li>
                    </ul>
                </div>

                <div class="tabContent">
                    <div class="tabImg">
                        <p class="tabP">
                            <c:if test="${not empty productDTO.imageDTOList}">
                                <c:forEach items="${productDTO.imageDTOList}" var="image">
                                    <img src="${pageContext.request.contextPath}/file/${image.pathX}" alt="" />
                                </c:forEach>
                            </c:if>
                        </p>
                        <div style="height: 50px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body">
                    <form id="commentForm" method="post" class="form-horizontal">
                        <input type="hidden" name="productId" value="${productDTO.productId}" />

                        <div class="form-group">
                            <label for="commentX" class="control-label col-xs-4 col-sm-4 text-right">内容：</label>
                            <div class="col-xs-6 col-sm-6">
                                <textarea id="commentX" name="commentX" class="form-control" maxlength="200" style="resize: none;height: 100px;"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" id="commentBtn">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tipsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p id="msgContent">留言成功。</p>
                </div>
            </div>
        </div>
    </div>

    <!--成功加入购物车显示消息-->
    <div class="successCart"></div>

    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script>

        $(function(){
            initCommentValidation();
        });

        $("#commentModal").on("hidden.bs.modal", function () {
            var commentForm = $("#commentForm").data("formValidation");
            commentForm.resetForm(true);
        });

        /*回到顶部*/
        $('.to-top').toTop();

        $("#commentBtn").on("click", function () {
            var commentForm = $("#commentForm").data("formValidation");
            commentForm.validate();
            if (commentForm.isValid()) {
                $.ajax({
                   url: "${pageContext.request.contextPath}/comment/addComment",
                    type: "post",
                    data: $("#commentForm").serialize(),
                    success: function (data) {
                        $("#commentModal").modal("hide");
                        if ("success" === data.msg) {
                            $("#msgContent").text("留言成功。");
                            $("#tipsModal").modal("show");
                        } else {
                            $("#msgContent").text("留言失败。");
                            $("#tipsModal").modal("show");
                        }
                    }
                });
            }
        });

        $(".bCart").on("click", function () {
            var productId = $(this).attr("data-productid");
           var countN = 1;
           if (parseInt($(".countInput").val())!=NaN&&$(".countInput").val()>0) {
               countN = $(".countInput").val();
           }

            $.ajax({
                url: "${pageContext.request.contextPath}/cart/add",
                type: "post",
                data: {
                    productId: productId,
                    countN: countN
                },
                success: function (data) {
                    if ("success" === data.msg) {
                        $(".successCart").text("成功加入购物车。");
                        $('.successCart').show();
                        $('.successCart').animate({width:'300px'}, 500);
                        setTimeout(function(){
                            $('.successCart').animate({width:'0px'}, 500);
                        }, 2500);
                    } else {
                        $(".successCart").text("加入购物车失败。");
                        $('.successCart').show();
                        $('.successCart').animate({width:'300px'}, 500);
                        setTimeout(function(){
                            $('.successCart').animate({width:'0px'}, 500);
                        }, 2500);
                    }
                }
            });
        });

        function initCommentValidation() {
            $("#commentForm").formValidation({
                excluded: [':disabled'],
                framework: 'bootstrap',
                fields: {
                    commentX: {
                        validators: {
                            notEmpty: {
                                message: '请填写留言内容。'
                            },
                            stringLength: {
                                max: 200,
                                message: "留言内容不能超过200个字符。"
                            }
                        }
                    }
                }
            });
        }
    </script>

</body>
</html>
