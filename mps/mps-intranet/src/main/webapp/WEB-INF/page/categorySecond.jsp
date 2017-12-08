<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.bootstrap.js"></script>

<div class="container-fluid">
    <div style="height: 20px;"></div>
    <div class="row">
        <div class="col-xs-6 col-sm-6 text-left">
            <div class="col-xs-4 col-sm-4">
                <select id="categoryName" class="form-control">
                    <option value="">-- 所有分类 --</option>
                    <c:if test="${not empty categoryDTOList}">
                        <c:forEach items="${categoryDTOList}" var="category">
                            <option value="${category.categoryId}">${category.nameX}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 text-right">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategorySecondModal" id="addCategorySecondBtn"><i class="fa fa-user-plus" style="color: #ffffff;"></i>&nbsp;&nbsp;添加分类</button>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12">
            <table id="categorySecondTable" class="table table-striped table-hover table-condensed"></table>
        </div>
    </div>
</div>

<!-- 添加分类Modal -->
<div id="addCategorySecondModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">分类</h4>
            </div>
            <div class="modal-body">
                <br>
                <form id="categorySecondForm" data-action="" data-index="" class="form-horizontal">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label for="nameX" class="control-label col-xs-4 col-sm-4 text-right">一级分类：</label>
                                <div class="col-xs-6 col-sm-6">
                                    <select name="categoryId" id="categoryId" class="form-control">
                                        <option value="">-- 选择分类 --</option>
                                        <c:if test="${not empty categoryDTOList}">
                                            <c:forEach items="${categoryDTOList}" var="category">
                                                <option value="${category.categoryId}">${category.nameX}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
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

<!-- 编辑分类Modal -->
<div id="editCategorySecondModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">分类</h4>
            </div>
            <div class="modal-body">
                <br>
                <form id="editCategorySecondForm" data-action="" data-index="" class="form-horizontal">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group">
                                <label for="nameX" class="control-label col-xs-4 col-sm-4 text-right">名称：</label>
                                <div class="col-xs-6 col-sm-6">
                                    <input type="text" name="nameX" id="editNameX" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-primary" id="editConfirm" data-index="">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 删除分类Modal -->
<div id="deleteCategorySecondModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">消息</h4>
            </div>
            <div class="modal-body text-center">
                <br>
                <p>删除该分类后，会删除该分类下的所有商品，确定要删除该分类么？</p>
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
<div id="tipsCategorySecondModal" class="modal fade" tabindex="-1" role="dialog">
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
        initCategorySecondTable();
        initCategorySecondValidation();
        initEditCategorySecondValidation();
    });

    $("#categoryId").on("change", function () {
        var categorySecondForm = $("#categorySecondForm").data("formValidation");
        categorySecondForm.revalidateField("nameX");
    });

    $("#categoryName").on("change", function () {
        $("#categorySecondTable").bootstrapTable("refresh");
    });

    $("#addCategorySecondModal").modal({
        backdrop: "static",
        keyboard: false,
        show: false
    });

    $("#addCategorySecondModal").on("hidden.bs.modal", function () {
        var categorySecondForm = $("#categorySecondForm").data("formValidation");
        categorySecondForm.resetForm(true);
    });

    $("#editCategorySecondModal").on("hidden.bs.modal", function () {
        var categorySecondForm = $("#editCategorySecondForm").data("formValidation");
        categorySecondForm.resetForm(true);
    });

    $("#addCategorySecondBtn").on("click", function () {
        $("#categorySecondForm").attr("data-action", "add");
    });

    function deleteModal(categorySecondId) {
        $("#deleteConfirm").attr("data-index", categorySecondId);
        $("#deleteCategorySecondModal").modal("show");
    }

    function editModal(action, value, categorySecondName) {
        $("#editCategorySecondForm").attr("data-action", action);
        $("#editCategorySecondForm").attr("data-index", value);
        $("#editNameX").val(categorySecondName);
        $("#editCategorySecondModal").modal("show");
        var categorySecondForm = $("#editCategorySecondForm").data("formValidation");
        categorySecondForm.validate();
    }

    $("#deleteConfirm").on("click", function () {
        var categorySecondId = $(this).attr("data-index");
        $.ajax({
            url: "${pageContext.request.contextPath}/categorySecond/delete",
            type: "post",
            data: {"categorySecondId":categorySecondId},
            success: function (data) {
                $("#deleteCategorySecondModal").modal("hide");
                if ("success" === data.msg) {
                    $("#categorySecondTable").bootstrapTable("refresh");
                } else {
                    alert("Error...");
                }
            }
        }) ;
    });

    $("#confirm").on("click", function () {
        var categorySecondForm = $("#categorySecondForm").data("formValidation");
        categorySecondForm.validate();
        if (categorySecondForm.isValid()) {
            var url = "${pageContext.request.contextPath}/categorySecond/add";
            var data = {
                "nameX": $("#nameX").val(),
                "categoryId": $("#categoryId").val()
            };

            $.ajax({
                url: url,
                type: "post",
                data: data,
                success: function (data) {
                    $("#addCategorySecondModal").modal("hide");
                    if ("success" === data.msg) {
                        $("#categoryName").val("");
                        $("#categorySecondTable").bootstrapTable("refresh");
                    } else {
                        alert("Error...");
                    }
                }
            });
        }
    });

    $("#editConfirm").on("click", function () {
        var categorySecondForm = $("#editCategorySecondForm").data("formValidation");
        categorySecondForm.validate();
        if (categorySecondForm.isValid()) {
            var url = "${pageContext.request.contextPath}/categorySecond/edit";
            var data = {
                "nameX": $("#editNameX").val(),
                "categorySecondId": $("#editCategorySecondForm").attr("data-index")
            };

            $.ajax({
                url: url,
                type: "post",
                data: data,
                success: function (data) {
                    $("#editCategorySecondModal").modal("hide");
                    if ("success" === data.msg) {
                        $("#categorySecondTable").bootstrapTable("refresh");
                    } else {
                        alert("Error...");
                    }
                }
            });
        }
    });

    function deleteModal(value) {
        $("#deleteConfirm").attr("data-index", value);
        $("#deleteCategorySecondModal").modal("show");
    }

    function initEditCategorySecondValidation() {
        $("#editCategorySecondForm").formValidation({
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
                            url: "${pageContext.request.contextPath}/categorySecond/checkIsExistCategorySecond",
                            type: "post",
                            data: function (validator, $field, value) {
                                return {
                                    categoryId: $("#categoryId").val(),
                                    nameX: value
                                };
                            },
                            message: "该一级分类下已存在该分类。"
                        }
                    }
                }
            }
        });
    }

    function initCategorySecondValidation() {
        $("#categorySecondForm").formValidation({
            excluded: [':disabled'],
            framework: 'bootstrap',
            fields: {
                categoryId: {
                    validators: {
                        notEmpty: {
                            message: '请填写名称。'
                        }
                    }
                },
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
                            url: "${pageContext.request.contextPath}/categorySecond/checkIsExistCategorySecond",
                            type: "post",
                            data: function (validator, $field, value) {
                                return {
                                    categoryId: $("#categoryId").val(),
                                    nameX: value
                                };
                            },
                            message: "该一级分类下已存在该分类。"
                        }
                    }
                }
            }
        });
    }
    
    function queryParams() {
        return {
            categoryId: $("#categoryName").val()
        };
    }

    function initCategorySecondTable() {
        var categoryId
        $("#categorySecondTable").bootstrapTable({
            url: "${pageContext.request.contextPath}/categorySecond/listCategorySecondDataByCategoryId",
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
            uniqueId: "categorySecondId",
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
                    field : 'categorySecondId',
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
