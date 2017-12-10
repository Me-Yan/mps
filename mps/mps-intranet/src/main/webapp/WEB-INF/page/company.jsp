<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/5
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>连队列表</title>
</head>
<body>
<div class="container-fluid">
    <div style="height: 20px;"></div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 text-right">
            <button id="addBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCompanyModal"><i style="color: #ffffff;" class="fa fa-user-plus"></i>&nbsp;&nbsp;添加连队</button>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12">
            <table id="companyTable" class="table table-striped table-hover table-condensed"></table>
        </div>
    </div>
</div>

<!-- 连队Modal -->
<div id="addCompanyModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">连队</h4>
            </div>
            <div class="modal-body">
                <form id="companyForm" data-action="" data-index="" class="form-horizontal">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="form-group clearfix">
                                <label for="nameX" class="control-label col-xs-4 col-sm-4 text-right">连队名称：</label>
                                <div class="col-xs-6 col-sm-6">
                                    <input name="nameX" id="nameX" type="text" class="form-control" />
                                </div>
                                <div class="col-xs-2 col-sm-2"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-primary" id="confirm">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 删除连队Modal -->
<div id="deleteCompanyModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">连队</h4>
            </div>
            <div class="modal-body text-center">
                <br>
                <p>删除该连队后，该连队下的所有用户也会被删除，确定要删除该连队么？</p>
                <br>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-primary" id="deleteConfirm" data-index="">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        initCompanyTable();
        initCompanyValidation();
    });

    $("#addCompanyModal").modal({
        backdrop: "static",
        keyboard: false,
        show: false
    });

    $("#addBtn").on("click", function () {
        $("#companyForm").attr("data-action", "add");
    });

    function editModal(action, index, name) {
        $("#companyForm").attr("data-action", action);
        $("#companyForm").attr("data-index", index);
        $("#nameX").val(name);
        $("#addCompanyModal").modal("show");
    }

    function deleteModal(index) {
        $("#deleteConfirm").attr("data-index", index);
        $("#deleteCompanyModal").modal("show");
    }

    $("#deleteConfirm").on("click", function () {
        var companyId = $(this).attr("data-index");
       $.ajax({
           url: "${pageContext.request.contextPath}/company/delete",
           data: {
               companyId: companyId
           },
           type: "post",
           success: function (data) {
               if ("success" === data.msg) {
                   $("#deleteCompanyModal").modal("hide");
                   $("#companyTable").bootstrapTable("refresh");
               } else {
                   $("#deleteCompanyModal").modal("hide");
               }
           }
       });
    });

    $("#confirm").on("click", function () {
        var companyForm = $("#companyForm").data("formValidation");
        companyForm.validate();
        if (companyForm.isValid()) {
            var url = "";
            var data;
            if ("add" === $("#companyForm").attr("data-action")) {
                url = "${pageContext.request.contextPath}/company/add";
                data = {"nameX": $.trim($("#nameX").val())};
            } else if ("edit" === $("#companyForm").attr("data-action")) {
                url = "${pageContext.request.contextPath}/company/edit";
                data = {
                    "nameX": $.trim($("#nameX").val()),
                    "companyId": $("#companyForm").attr("data-index")
                };
            }
            $.ajax({
                url: url,
                data: data,
                type: "post",
                success: function (data) {
                    if (data.msg === "success") {
                        $("#companyTable").bootstrapTable("refresh");
                        $("#addCompanyModal").modal("hide");
                    } else {
                        $("#addCompanyModal").modal("hide");
                        alert("Error...");
                    }
                }
            })
        }
    });

    $("#addCompanyModal").on("hidden.bs.modal", function () {
        var companyForm = $("#companyForm").data("formValidation");
        companyForm.resetForm(true);
    });

    function initCompanyValidation() {
        $("#companyForm").formValidation({
            excluded: [':disabled'],
            framework: 'bootstrap',
            fields: {
                nameX: {
                    validators: {
                        notEmpty: {
                            message: '请填写连队名称。'
                        },
                        stringLength: {
                            max: 20,
                            message: "姓名不能超过20个字符。"
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/company/checkIsExistCompany",
                            type: "post",
                            message: "该连队已添加。"
                        }
                    }
                }
            }
        });
    }

    function initCompanyTable() {
        $("#companyTable").bootstrapTable({
            url: "${pageContext.request.contextPath}/company/listCompanyData",
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
                    title : '连队',
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
                    field : '',
                    title : '操作',
                    align : 'center',
                    valign : 'middle',
                    formatter: function (value, row, $field) {
                        return '<i onclick="editModal(\'edit\', \''+row.companyId+'\', \''+row.nameX+'\');" class="mps-pointer fa fa-edit fa-lg"></i>&nbsp;&nbsp;<i onclick="deleteModal(\''+row.companyId+'\')" class="removeBtn mps-pointer fa fa-remove fa-lg"></i>';
                    }
                },
            ]
        });
    }
</script>
</body>
</html>
