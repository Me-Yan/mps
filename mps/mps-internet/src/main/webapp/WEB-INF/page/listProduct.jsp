<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/12
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品列表</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/productList.css" />

<input hidden value="${searchCriteria.categoryId}" id="categoryId" />
<input hidden value="${searchCriteria.categorySecondId}" id="categorySecondId" />

    <div class="center">
        <div class="main">
            <div class="left">
                <span>商品分类</span>
                <c:choose>
                    <c:when test="${not empty categoryDTOList}">
                        <c:forEach items="${categoryDTOList}" var="category">
                            <a data-category="${category.categoryId}" style="cursor: pointer;" class='category <c:if test="${searchCriteria.categoryId eq category.categoryId}">category-selected</c:if> '><c:out value="${category.nameX}" /></a>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div style="height: 100px;width: 100%;line-height: 100px;text-align: center;">
                            没有任何分类
                        </div>
                    </c:otherwise>
                </c:choose>
                <div style="height: 50px;"></div>
                <span>通知</span>
                <div style="height: 100px;background-color: #FFFFFF;text-align: center;font-size: 16px;padding: 15px;">
                    <c:choose>
                        <c:when test="${noticeDTO!=null and noticeDTO.contentX!='' and noticeDTO.contentX!=null}">
                            ${noticeDTO.contentX}
                        </c:when>
                        <c:otherwise>&nbsp;</c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="right">
                <c:if test="${searchCriteria.categoryId!=null}">
                    <c:if test="${not empty categorySecondDTOList}">
                        <div class="items">
                            <c:forEach items="${categorySecondDTOList}" var="categorySecond">
                                <span data-categorysecond="${categorySecond.categorySecondId}"
                                      class="category-second <c:if test='${searchCriteria.categorySecondId eq categorySecond.categorySecondId}'>category-second-selected</c:if>"><c:out value="${categorySecond.nameX}"/></span>
                            </c:forEach>
                        </div>
                    </c:if>
                </c:if>
                <div class="clearBoth"></div>
                <div class="list">
                    <div class="line"></div>
                    <ul class="listUl">
                        <c:choose>
                            <c:when test="${not empty productDTOList}">
                                <c:forEach items="${productDTOList}" var="product">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/detail?productId=${product.productId}" class="listImg" target="_blank">
                                            <img src="${pageContext.request.contextPath}/file/${product.imagePathX}" alt="">
                                        </a>
                                        <div style="text-align:center;width: 100%;height: 30px;line-height:30px;border-bottom: 1px solid #ededed;">剩余：${product.countN}</div>
                                        <p class="listName"><a href="${pageContext.request.contextPath}/product/detail?productId=${product.productId}"  target="_blank"><c:out value="${product.nameX}"/></a></p>
                                        <p class="listPrice">
                                            <span class="lPrice">￥<span class="price"><c:out value="${product.priceN}"/></span></span>
                                            <a class="lCart" data-productid="${product.productId}">加入购物车</a>
                                        </p>
                                    </li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                抱歉，还没有商品售卖。
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="clearBoth"></div>
                    <c:if test="${not empty productDTOList}">
                        <div class="page">
                            <div class="pageInner">
                                <c:choose>
                                    <c:when test="${not empty productDTOList}">
                                        <span>共${productDTOList.size()}件商品</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span>共0件商品</span>
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
                </div>
            </div>
        </div>
    </div>

    <!--成功加入购物车显示消息-->
    <div class="successCart"></div>
    <div class="clearBoth"></div>

    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script type="text/javascript">
        <!--回到顶部-->
        $('.to-top').toTop();

        <!-- 点击分页 -->
        $(".mps-pointer").on("click", function () {
            var categoryId = $("#categoryId").val();
            var categorySecondId = $("#categorySecondId").val();
            var curPage = $(this).attr("data-page");

            var parameters = "categoryId="+categoryId+"&categorySecondId="+categorySecondId+"&curPage="+curPage;

            window.location.href = "${pageContext.request.contextPath}/product/listProduct?"+parameters;
        });

        $(".category").on("click", function () {
           var categoryId = $(this).attr("data-category");
           var parameters = "categoryId="+categoryId;
           window.location.href = "${pageContext.request.contextPath}/product/listProduct?"+parameters;
        });

        $(".category-second").on("click", function () {
            var categoryId = $("#categoryId").val();
            var categorySecondId = $(this).attr("data-categorysecond");
            var parameters = "categoryId="+categoryId+"&categorySecondId="+categorySecondId;
            window.location.href = "${pageContext.request.contextPath}/product/listProduct?"+parameters;
        });

        //成功加入购物车
        $('.lCart').on("click", function(){
            var productId = $(this).attr("data-productid");
            var countN = 1;
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
    </script>
</body>
</html>
