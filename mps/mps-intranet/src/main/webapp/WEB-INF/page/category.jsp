<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/7
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>一级分类</title>
</head>
<body>
    <div class="container-fluid">
        <div style="height: 20px;"></div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 text-right">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategoryModal" id="addCategoryBtn"><i class="fa fa-user-plus" style="color: #ffffff;"></i>&nbsp;&nbsp;添加分类</button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <table id="categoryTable" class="table table-striped table-hover table-condensed"></table>
            </div>
        </div>
    </div>

    <!-- 添加分类Modal -->
    <div id="addCategoryModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">分类</h4>
                </div>
                <div class="modal-body">
                    <br>
                    <form id="categoryForm" data-action="" data-index="" class="form-horizontal">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="form-group">
                                    <label for="nameX" class="control-label col-xs-4 col-sm-4 text-right">名称：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input type="text" name="nameX" id="nameX" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button type="button" class="btn btn-primary" id="confirm" data-index="">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 删除分类Modal -->
    <div id="deleteCategoryModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body text-center">
                    <br>
                    <p>删除该类后，会删除相应的二级分类，以及该分类下的所有商品,确定要删除该分类么？</p>
                    <br>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button type="button" class="btn btn-primary" id="deleteConfirm" data-index="">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 消息Modal -->
    <div id="tipsCategoryModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body text-center text-center">
                    <br>
                    <p>删除成功。</p>
                    <br>
                </div>
            </div>
        </div>
    </div>

<script>
    $(function () {
        initCategoryTable();
        initCategoryValidation();
    });

    $("#addCategoryModal").modal({
        backdrop: "static",
        keyboard: false,
        show: false
    });

    $("#addCategoryModal").on("hidden.bs.modal", function () {
        var categoryForm = $("#categoryForm").data("formValidation");
        categoryForm.resetForm(true);
    });

    $("#addCategoryBtn").on("click", function () {
        $("#categoryForm").attr("data-action", "add");
    });
    
    function deleteModal(categoryId) {
        $("#deleteConfirm").attr("data-index", categoryId);
        $("#deleteCategoryModal").modal("show");
    }
    
    function editModal(action, value, categoryName) {
        $("#categoryForm").attr("data-action", action);
        $("#categoryForm").attr("data-index", value);
        $("#nameX").val(categoryName);
        $("#addCategoryModal").modal("show");
    }

    $("#deleteConfirm").on("click", function () {
        var categoryId = $(this).attr("data-index");
       $.ajax({
           url: "${pageContext.request.contextPath}/category/delete",
           type: "post",
           data: {"categoryId":categoryId},
           success: function (data) {
               $("#deleteCategoryModal").modal("hide");
               if ("success" === data.msg) {
                   $("#categoryTable").bootstrapTable("refresh");
               } else {
                   alert("Error...");
               }
           }
       }) ;
    });

    $("#confirm").on("click", function () {
        var categoryForm = $("#categoryForm").data("formValidation");
        categoryForm.validate();
        if (categoryForm.isValid()) {
            var url = "";
            var data;
            if ("add" == $("#categoryForm").attr("data-action")) {
                url = "${pageContext.request.contextPath}/category/add";
                data = {
                    "nameX": $("#nameX").val()
                };
            } else if ("edit" == $("#categoryForm").attr("data-action")) {
                url = "${pageContext.request.contextPath}/category/edit";
                data = {
                    "nameX": $("#nameX").val(),
                    "categoryId": $("#categoryForm").attr("data-index")
                };
            }

            $.ajax({
                url: url,
                type: "post",
                data: data,
                success: function (data) {
                    $("#addCategoryModal").modal("hide");
                    if ("success" === data.msg) {
                        $("#categoryTable").bootstrapTable("refresh");
                    } else {
                        alert("Error...");
                    }
                }
            });
        }
    });

    function deleteModal(value) {
        $("#deleteConfirm").attr("data-index", value);
        $("#deleteCategoryModal").modal("show");
    }
    
    function initCategoryValidation() {
        $("#categoryForm").formValidation({
            excluded: [':disabled'],
            framework: 'bootstrap',
            fields: {
                nameX: {
                    validators: {
                        notEmpty: {
                            message: '请填写名称。'
                        },
                        stringLength: {
                            max: 20,
                            message: "名称不能超过20个字符。"
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/category/checkIsExistCategory",
                            type: "post",
                            message: "该分类已存在。"
                        }
                    }
                }
            }
        });
    }

    function initCategoryTable() {
        $("#categoryTable").bootstrapTable({
            url: "${pageContext.request.contextPath}/category/listCategoryData",
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
            uniqueId: "companyId",
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
                },
                {
                    field : 'nameX',
                    title : '名称',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'createDate',
                    title : '创建时间',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'categoryId',
                    title : ' 操作',
                    align : 'center',
                    valign : 'middle',
                    formatter: function (value, row, $field) {
                        return '<i onclick="editModal(\'edit\', \''+value+'\', \''+row.nameX+'\');" class="mps-pointer fa fa-edit fa-lg"></i>&nbsp;&nbsp;<i onclick="deleteModal(\''+value+'\')" class="removeBtn mps-pointer fa fa-remove fa-lg"></i>';
                    }
                }
            ]
        })
    }
</script>

</body>
</html>
