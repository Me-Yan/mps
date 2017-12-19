<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/20
  Time: 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/comment.css" />
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
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

    <div class="center">
        <div class="comment">

            <jsp:include page="decorators/left.jsp" />

            <div class="right">
                <div class="comment-title">
                    我的留言
                </div>
                <div class="comment-content" style="padding: 20px;">
                    <table id="commentTable" class="table table-striped table-hover table-condensed"></table>
                </div>
            </div>
        </div>
    </div>

<script>

    $(function () {
        initCommentTable();
    });

    function initCommentTable() {
        $("#commentTable").bootstrapTable({
            url: "${pageContext.request.contextPath}/comment/listCommentData",
            method:'POST',
            dataType:'json',
            contentType: "application/x-www-form-urlencoded",
            cache: false,
            striped: true,
            sidePagination: "client",
            pagination:true,
            queryParams: {},
            pageNumber:1,
            pageSize: 10,
            pageList: [10,15,20],
            uniqueId: "commentId",
            search: false,
            toolbar: "#toolbar",
            toolbarAlign: "right",
            cellStyle: function (value, row, index, field) {
                return {
                    css: {'word-wrap':'break-word', 'word-break':'break-all'}
                }
            },
            onLoadSuccess: function(){
            },
            onPageChange: function () {
            },
            columns: [
                {
                    field : 'serialNumber',
                    title : '#',
                    align : 'center',
                    valign : 'middle',
//                        width: "5%"
                },
                {
                    field : 'commentX',
                    title : '留言',
                    align : 'center',
                    valign : 'middle',
//                        width: "5%"
                },
                {
                    field : 'username',
                    title : '用户',
                    align : 'center',
                    valign : 'middle',
//                        width: "5%"
                },
                {
                    field : 'imagePath',
                    title : '商品图片',
                    align : 'center',
                    valign : 'middle',
//                        width: "5%"
                    formatter: function (value, row, index) {

                        return '<img class="img-thumbnail" style="height:100px;width:100px;" src="${pageContext.request.contextPath}/file/'+value+'" />';
                    }
                },
                {
                    field : 'productName',
                    title : '商品名称',
                    align : 'center',
                    valign : 'middle',
//                        width: "5%"
                },
                {
                    field : 'createDate',
                    title : '留言时间',
                    align : 'center',
                    valign : 'middle',
//                        width: "5%"
                },
                {
                    field : 'statusX',
                    title : '状态',
                    align : 'center',
                    valign : 'middle',
                    formatter: function (value, row, index) {
                        if ('Pending' === value) {
                            return '<button class="btn btn-primary">确认</button>';
                        } else if ('Read' === value) {
                            return '<button class="btn btn-primary">已确认</button>';
                        }
                    }
                }
            ]
        });
    }
</script>
</body>
</html>
