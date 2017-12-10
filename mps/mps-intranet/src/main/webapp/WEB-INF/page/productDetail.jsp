<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/10
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-12" style="padding: 20px 40px;">
                <div class="row" style="background-color: #393939;height: 40px;line-height: 40px;color: #ffffff;">
                    <div class="col-xs-12 col-sm-12">
                        <span>基本信息</span>
                    </div>
                </div>
                <div style="height: 20px;"></div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <table border="0">
                            <tr>
                                <td>
                                    <img class="img-thumbnail" src="${pageContext.request.contextPath}/file/${productDTO.imagePathX}" style="height: 200px;display: inline-block;" alt="" />
                                </td>
                                <td width="50px"></td>
                                <td>
                                    <table style="height: 100%">
                                        <tr>
                                            <td align="right">商品名称：</td>
                                            <td>${productDTO.nameX}</td>
                                        </tr>
                                        <tr style="height: 20px;">&nbsp;</tr>
                                        <tr>
                                            <td align="right">单价：</td>
                                            <td>￥${productDTO.priceN}</td>
                                        </tr>
                                        <tr style="height: 20px;">&nbsp;</tr>
                                        <tr>
                                            <td align="right">数量：</td>
                                            <td>${productDTO.countN}</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="height: 20px;"></div>
                <div class="row" style="background-color: #393939;height: 40px;line-height: 40px;color: #ffffff;">
                    <div class="col-xs-12 col-sm-12">
                        <span>商品详情</span>
                    </div>
                </div>
                <div style="height: 20px;"></div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <c:choose>
                            <c:when test="${not empty productDTO.imageDTOList}">
                                <c:forEach items="${productDTO.imageDTOList}" var="image">
                                    <img class="img-thumbnail" src="${pageContext.request.contextPath}/file/${image.pathX}" alt="" style="height: 200px;display: inline-block;" />
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <span>没有上传任何图片</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div style="height: 50px;"></div>
    </div>
</body>
</html>
