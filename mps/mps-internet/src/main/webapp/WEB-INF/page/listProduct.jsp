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
<script src="${pageContext.request.contextPath}/resources/plugins/scrollTop/jquery.toTop.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/scrollTop/jquery.toTop.min.js"></script>

<input hidden value="${searchCriteria.categoryId}" id="categoryId" />
<input hidden value="${searchCriteria.categorySecondId}" id="categorySecondId" />
<input hidden value="${pageNation.curPage}" id="curPage" />

    <div class="center">
        <div class="main">
            <div class="left">
                <span>商品分类</span>
                <c:choose>
                    <c:when test="${not empty categoryDTOList}">
                        <c:forEach items="${categoryDTOList}" var="category">
                            <a href="javascript:void(0);" class='<c:if test="${searchCriteria.categoryId eq category.categoryId}">category-selected</c:if> '><c:out value="${category.nameX}" /></a>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div style="height: 100px;width: 100%;line-height: 100px;text-align: center;">
                            没有任何分类
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="right">
                <c:if test="${searchCriteria.categoryId!=null and searchCriteria.categorySecondId!=null}">
                    <c:if test="${not empty categorySecondDTOList}">
                        <div class="items">
                            <c:forEach items="${categorySecondDTOList}" var="categorySecond">
                                <span><c:out value="${categorySecond.nameX}"/></span>
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
                                        <a href="product.html" class="listImg">
                                            <img src="${pageContext.request.contextPath}/file/${product.imagePathX}" alt="">
                                        </a>
                                        <div style="text-align:center;width: 100%;height: 30px;line-height:30px;border-bottom: 1px solid #ededed;">剩余：${product.countN}</div>
                                        <p class="listName"><a href=""><c:out value="${product.nameX}"/></a></p>
                                        <p class="listPrice">
                                            <span class="lPrice">￥<span class="price"><c:out value="${product.priceN}"/></span></span>
                                            <a class="lCart">加入购物车</a>
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
                            <a class="first <c:if test='${pageNation.curPage!=1}'>mps-pointer</c:if>">首页</a>
                            <a class="pre <c:if test='${pageNation.curPage!=1}'>mps-pointer</c:if>">上一页</a>
                            
                            <c:choose>
                                <c:when test="${pageNation.totalPage lt 6}">
                                    <c:forEach begin="1" end="${pageNation.totalPage}" step="1" var="pageIndex">
                                        <c:choose>
                                            <c:when test="${pageIndex eq pageNation.curPage}">
                                                <a style="background-color: #E14041;color: #FFFFFF;">${pageIndex}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="mps-pointer">${pageIndex}</a>
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
                                                        <a class="mps-pointer">${pageIndex}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                            <a>${pageNation.totalPage}</a>
                                        </c:when>
                                        <c:when test="${pageNation.curPage gt 3 and pageNation.curPage lt pageNation.totalPage-2}">
                                            <a>1</a>
                                            <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                            <a class="mpa-pointer">${pageNation.curPage-1}</a>
                                            <a style="background-color: #E14041;color: #FFFFFF;">${pageNation.curPage}</a>
                                            <a class="mpa-pointer">${pageNation.curPage+1}</a>
                                            <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                            <a>${pageNation.totalPage}</a>
                                        </c:when>
                                        <c:when test="${pageNation.curPage gt pageNation.totalPage-3}">
                                            <a class="mpa-pointer">1</a>
                                            <span style="height: 30px;line-height: 30px;margin-left: 5px;padding: 0px 10px;color: #333;display: inline-block;">...</span>
                                            <c:forEach begin="${pageNation.totalPage-2}" end="${pageNation.totalPage}" step="1" var="pageIndex">
                                                <c:choose>
                                                    <c:when test="${pageIndex eq pageNation.curPage}">
                                                        <a style="background-color: #E14041;color: #FFFFFF;">${pageIndex}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="mps-pointer">${pageIndex}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                            </c:choose>
                            
                            <a class="next <c:if test='${pageNation.curPage!=pageNation.totalPage}'>mps-pointer</c:if>">下一页</a>
                            <a class="last <c:if test='${pageNation.curPage!=pageNation.totalPage}'>mps-pointer</c:if>">末页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--成功加入购物车显示消息-->
    <div class="successCart">
        成功加入购物车
    </div>
    <div class="clearBoth"></div>

    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script type="text/javascript">
        <!--回到顶部-->
        $('.to-top').toTop();
    </script>
</body>
</html>
