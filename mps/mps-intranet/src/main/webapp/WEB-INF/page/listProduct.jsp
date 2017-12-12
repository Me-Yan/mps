<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/10
  Time: 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品列表</title>
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
                <table id="productTable" class="table table-striped table-hover table-condensed"></table>
            </div>
        </div>
    </div>

    <!-- 确认Modal -->
    <div id="editModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body text-center">
                    <br>
                    <p>确认修改该商品？</p>
                    <br>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button type="button" class="btn btn-primary" id="editConfirmBtn" data-index="">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 下架Modal -->
    <div id="downModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body text-center">
                    <br>
                    <p>确认下架该商品？</p>
                    <br>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button type="button" class="btn btn-primary" id="downConfirmBtn" data-index="">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 下架Modal -->
    <div id="supplyModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="supplyForm" action="${pageContext.request.contextPath}/product/supply" method="post" class="form-horizontal">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="form-group">
                                    <label for="countN" class="control-label col-xs-4 col-sm-4 text-right">补充数量：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input type="text" name="countN" id="countN" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button type="button" class="btn btn-primary" id="supplyConfirmBtn" data-index="">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            initProductTable();
            initSupplyForm();
        });

        $("#editConfirmBtn").on("click", function () {
            var productId = $(this).attr("data-index");
            window.location.href = "${pageContext.request.contextPath}/product/edit?productId=" + productId;
        });

        $("#downConfirmBtn").on("click", function () {
            var productId = $(this).attr("data-index");
            $.ajax({
                url: "${pageContext.request.contextPath}/product/downProduct",
                type: "post",
                data: {productId: productId},
                success: function (data) {
                    $("#downModal").modal("hide");
                    if ("success" === data.msg) {
                        $("#productTable").bootstrapTable("refresh");
                    } else {
                        alert("Error...");
                    }
                }
            });
        });

        $("#supplyConfirmBtn").on("click", function () {
            var supplyForm = $("#supplyForm").data("formValidation");
            supplyForm.validate();
            if (supplyForm.isValid()) {
                var productId = $(this).attr("data-index");
                var supplyCount = $("#countN").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/product/supplyProduct",
                    type: "post",
                    data: {
                        productId: productId,
                        countN: supplyCount
                    },
                    success: function (data) {
                        $("#supplyModal").modal("hide");
                        if ("success" === data.msg) {
                            $("#productTable").bootstrapTable("refresh");
                        } else {
                            alert("Error...");
                        }
                    }
                })
            }
        });

        $("#searchBtn").on("click", function () {
            $("#productTable").bootstrapTable("refresh");
        });

        $("#supplyModal").on("hidden.bs.modal", function () {
            var supplyForm = $("#supplyForm").data("formValidation");
            supplyForm.resetForm(true);
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

        function initSupplyForm() {
            $("#supplyForm").formValidation({
                excluded: [':disabled'],
                framework: 'bootstrap',
                fields: {
                    countN: {
                        validators: {
                            notEmpty: {
                                message: '请输入需要补充的库存。'
                            },
                            integer: {
                                message: "请填写有效的数字。"
                            },
                            between: {
                                min: 1,
                                max: 99999,
                                message: "请输入合理的库存。"
                            }
                        }
                    }
                }
            });
        }
        
        function queryParams() {
            return {
                categoryId: $("#categoryId").val(),
                categorySecondId: $("#categorySecondId").val()
            };
        }

        function initProductTable() {
            $("#productTable").bootstrapTable({
                url: "${pageContext.request.contextPath}/product/listProductByCriteria",
                method:'POST',
                dataType:'json',
                contentType: "application/x-www-form-urlencoded",
                cache: false,
                striped: true,
                sidePagination: "client",
                pagination:true,
                queryParams: queryParams,
                pageNumber:1,
                pageSize: 10,
                pageList: [10,15,20],
                uniqueId: "productId",
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
                        width: "5%"
                    },
                    {
                        field : 'imagePathX',
                        title : '展示图片',
                        align : 'center',
                        valign : 'middle',
                        width: "10%",
                        formatter: function (value,row, index) {
                            return '<img class="img-thumbnail" style="height:100px;width:100px;" src="${pageContext.request.contextPath}/file/'+value+'" />';
                        }
                    },
                    {
                        field : 'nameX',
                        title : '名称',
                        align : 'center',
                        valign : 'middle',
                        width: "30%"
                    },
                    {
                        field : 'priceN',
                        title : '单价',
                        align : 'center',
                        valign : 'middle',
                        width: "10%",
                        formatter: function (value,row,index) {
                            return '￥'+value;
                        }
                    },
                    {
                        field : 'countN',
                        title : '库存',
                        align : 'center',
                        valign : 'middle',
                        width: "10%"
                    },
                    {
                        field : 'createDate',
                        title : '上架时间',
                        align : 'center',
                        valign : 'middle',
                        width: "10%"
                    },
                    {
                        field : 'productId',
                        title : '操作',
                        align : 'center',
                        valign : 'middle',
                        width: "25%",
                        formatter: function (value,row,index) {
                            return '<a onclick="viewDetail('+value+')" class="mps-pointer">详情</a>丨<a onclick="viewComment('+value+')" class="mps-pointer">留言</a>丨' +
                                '<a onclick="editProduct('+value+')" class="mps-pointer">修改</a>丨<a onclick="downProduct('+value+')" class="mps-pointer">下架</a>丨' +
                                '<a onclick="supplyCount('+value+')" class="mps-pointer">补充</a>';
                        }
                    }
                ]
            });
        }

        function viewDetail(productId) {
            window.location.href = '${pageContext.request.contextPath}/product/detail?productId='+productId;
        }
        
        function viewComment(productId) {
            window.location.href = '${pageContext.request.contextPath}/comment/listProductComment?productId='+productId;
        }

        function editProduct(productId) {
            $("#editConfirmBtn").attr("data-index", productId);
            $("#editModal").modal("show");
        }

        function downProduct(productId) {
            $("#downConfirmBtn").attr("data-index", productId);
            $("#downModal").modal("show");
        }
        
        function supplyCount(productId) {
            $("#supplyConfirmBtn").attr("data-index", productId);
            $("#supplyModal").modal("show");
        }
    </script>
</body>
</html>
