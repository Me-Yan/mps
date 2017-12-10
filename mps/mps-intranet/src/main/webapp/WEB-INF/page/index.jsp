<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/4
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后勤物资采购管理系统</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/index.css" />


    <div class="top">
        <div class="user">
            <a href="javascript:void(0)"><i class="fa fa-user"></i><span>某某某</span><i class="fa fa-chevron-down"></i></a>
            <ul class="userList">
                <li><a href="#">修改密码</a></li>
                <li><a href="">退出</a></li>
            </ul>
        </div>
        <a class="homePage" href="main.html" target="navFrame">
            <i class="fa fa-home"></i>主页
        </a>
    </div>

    <div class="center">
        <div class="left">
            <ul id="accordion" class="accordion">
                <li>
                    <div class="link"><i class="fa fa-mobile"></i>订单<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="order.html" target="navFrame">订单列表</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link"><i class="fa fa-mobile"></i>留言<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/comment/listComment" target="navFrame">留言列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/notice/notice" target="navFrame">通告</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link"><i class="fa fa-code"></i>商品<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/product/listProduct" target="navFrame">商品列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/product/add" target="navFrame">添加商品</a></li>
                        <%--<li><a href="shelf.html" target="navFrame">下架商品</a></li>--%>
                    </ul>
                </li>
                <li><div class="link"><i class="fa fa-globe"></i>分类<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/category/listCategory" target="navFrame">一级分类</a></li>
                        <li><a href="${pageContext.request.contextPath}/categorySecond/listCategorySecond" target="navFrame">二级分类</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link"><i class="fa fa-paint-brush"></i>用户<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/user/listUser" target="navFrame">用户列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/company/listCompany" target="navFrame">连队列表</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="right">
            <iframe id="navFrame" name="navFrame" src="main.html" frameborder="0"></iframe>
        </div>
    </div>

<script src="${pageContext.request.contextPath}/resources/scripts/index.js"></script>
</body>
</html>
