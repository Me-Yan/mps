<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/10
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单个商品留言</title>
</head>
<body>

    <div class="container-fluid">
        <div style="height: 20px;"></div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 text-right">
                <a href="${pageContext.request.contextPath}/product/listProduct" class="btn btn-primary">返回</a>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <table id="commentTable" class="table table-striped table-hover table-condensed"></table>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            initCommentTable();
        });
        
        function initCommentTable() {
            $("#commentTable").bootstrapTable({
                url: "${pageContext.request.contextPath}/comment/listCommentByProductId",
                method:'POST',
                dataType:'json',
                contentType: "application/x-www-form-urlencoded",
                cache: false,
                striped: true,
                sidePagination: "client",
                pagination:true,
                queryParams: {productId: ${productId}},
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
