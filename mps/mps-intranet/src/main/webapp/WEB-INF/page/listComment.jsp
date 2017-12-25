<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/10
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品留言</title>
</head>
<body>
    <div class="container-fluid">
        <div style="height: 20px;"></div>
        <div class="row">
            <div class="col-xs-3 col-sm-2">
                <select id="categoryId" class="form-control">
                    <option value="">-- 所有一级分类 --</option>
                    <c:if test="${not empty categoryDTOList}">
                        <c:forEach items="${categoryDTOList}" var="category">
                            <option value="${category.categoryId}">${category.nameX}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="col-xs-3 col-sm-2">
                <select id="categorySecondId" class="form-control">
                    <option value="">-- 所有二级分类 --</option>
                </select>
            </div>
            <div class="col-xs-3 col-sm-2">
                <button type="button" class="btn btn-primary" id="searchBtn">查询</button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <table id="commentTable" class="table table-striped table-hover table-condensed"></table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 0px;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>确认失败。</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            initCommentTable();
        });
        
        function confirmComment(commentId) {
            $.ajax({
                url: "${pageContext.request.contextPath}/comment/updateStatusByCommentId",
                type: "post",
                data: {
                    commentId: commentId
                },
                success: function (data) {
                    $("#commentTable").bootstrapTable("refresh");
                    if ("fail"===data.msg) {
                        $("#messageModal").modal("show");
                    }
                }
            });
        }
        
        $("#searchBtn").on("click", function () {
            $("#commentTable").bootstrapTable("refresh");
        });

        var categoryJson = ${categoryJson};
        $("#categoryId").on("change", function () {
            var selectedIndex = this.selectedIndex;

            var secondOptionContent = '<option value="">-- 所有二级分类 --</option>';
            if (selectedIndex>0) {
                var categorySecondJson = categoryJson[selectedIndex-1].categorySecondDTOList;
                if (categorySecondJson) {
                    for (var index in categorySecondJson) {
                        secondOptionContent += '<option value="'+categorySecondJson[index].categorySecondId+'">'+categorySecondJson[index].nameX+'</option>';
                    }
                }
            }

            $("#categorySecondId").html(secondOptionContent);
        });

        function initCommentTable() {
            $("#commentTable").bootstrapTable({
                url: "${pageContext.request.contextPath}/comment/listCommentByCriteria",
                method:'POST',
                dataType:'json',
                contentType: "application/x-www-form-urlencoded",
                cache: false,
                striped: true,
                sidePagination: "client",
                pagination:true,
                queryParams: {
                    categoryId: $("#categoryId").val(),
                    categorySecondId: $("#categorySecondId").val()
                },
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
                                return '<button class="btn btn-primary confirmBtn" onclick="confirmComment('+row.commentId+')">确认</button>';
                            } else if ('Read' === value) {
                                return '已确认';
                            }
                        }
                    }
                ]
            });
        }
    </script>
</body>
</html>
