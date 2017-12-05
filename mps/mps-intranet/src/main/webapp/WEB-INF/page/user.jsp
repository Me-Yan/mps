<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/4
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/formValidation/formValidation.bootstrap.js"></script>

    <div class="container-fluid">
        <div style="height: 20px;"></div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 text-right">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUserModal"><i class="fa fa-user-plus" style="color: #ffffff;"></i>&nbsp;&nbsp;添加用户</button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <table id="userTable" class="table table-striped table-hover table-condensed"></table>
            </div>
        </div>
    </div>

    <!-- 添加用户Modal -->
    <div id="addUserModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加用户</h4>
                </div>
                <div class="modal-body">
                    <form id="userForm" class="form-horizontal">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="form-group clearfix">
                                    <label for="companyId" class="control-label col-xs-4 col-sm-4 text-right">连队：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <select name="companyId" id="companyId" class="form-control">
                                            <option value="">-- 选择连队 --</option>
                                            <c:if test="${not empty companyDTOList}">
                                                <c:forEach items="${companyDTOList}" var="company">
                                                    <option value="${company.companyId}">${company.nameX}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="realNameM" class="control-label col-xs-4 col-sm-4 text-right">姓名：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="realNameM" id="realNameM" type="text" class="form-control" />
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="passwordX" class="control-label col-xs-4 col-sm-4 text-right">密码：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="passwordX" id="passwordX" type="text" class="form-control" />
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="amountN" class="control-label col-xs-4 col-sm-4 text-right">余额：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="amountN" id="amountN" type="text" class="form-control" />
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="usernameM" class="control-label col-xs-4 col-sm-4 text-right">用户名：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="usernameM" id="usernameM" type="text" class="form-control" />
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="sexX" class="control-label col-xs-4 col-sm-4 text-right">性别：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <select name="sexX" id="sexX" class="form-control">
                                            <option value="">-- 选择性别 --</option>
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="ageN" class="control-label col-xs-4 col-sm-4 text-right">年龄：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="ageN" id="ageN" type="text" class="form-control" />
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="emailX" class="control-label col-xs-4 col-sm-4 text-right">邮箱：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="emailX" id="emailX" type="text" class="form-control" />
                                    </div>
                                    <div class="col-xs-2 col-sm-2"></div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="phoneX" class="control-label col-xs-4 col-sm-4 text-right">电话：</label>
                                    <div class="col-xs-6 col-sm-6">
                                        <input name="phoneX" id="phoneX" type="text" class="form-control" />
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

<script>
    $(function () {
        initUserTable();
        initUserValidation();
    });

    $("#addUserModal").modal({
        backdrop: "static",
        keyboard: false,
        show: false
    });

    $("#confirm").on("click", function () {
        var userForm = $("#userForm").data("formValidation");
        userForm.validate();
        if (userForm.isValid()) {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/add",
                data: $("#userForm").serialize(),
                type: "post",
                success: function (data) {
                    if ("success" === data.msg) {
                        $("#addUserModal").modal("hide");
                        $("#userTable").bootstrapTable("refresh");
                    } else {
                        $("#addUserModal").modal("hide");
                        alert("Error...");
                    }
                }
            });
        }
    });

    $("#addUserModal").on("hidden.bs.modal", function () {
        var userForm = $("#userForm").data("formValidation");
        userForm.resetForm(true);
    });
    
    function initUserValidation() {
        $("#userForm").formValidation({
            excluded: [':disabled'],
            framework: 'bootstrap',
            fields: {
                companyId: {
                    validators: {
                        notEmpty: {
                            message: '请选择一个连队。'
                        }
                    }
                },
                realNameM: {
                    validators: {
                        notEmpty: {
                            message: '请填写用户姓名。'
                        },
                        stringLength: {
                            max: 20,
                            message: "姓名不能超过20个字符。"
                        }
                    }
                },
                passwordX: {
                    validators: {
                        notEmpty: {
                            message: '请填写密码。'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: "密码应不低于6个字符且不能超过20个字符。"
                        }
                    }
                },
                amountN: {
                    validators: {
                        notEmpty: {
                            message: '请填写余额。'
                        },
                        integer: {
                            message: "请填写有效的余额。"
                        },
                        between: {
                            min: 0,
                            max: 1000000,
                            message: "余额不能超过100万。"
                        }
                    }
                },
                usernameM: {
                    validators: {
                        notEmpty: {
                            message: '请填写用户名'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: "用户名应不低于6个且不能超过20个字符。"
                        }
                    }
                },
                sexX: {
                    validators: {
                        notEmpty: {
                            message: '请选择性别。'
                        },
                    }
                },
                ageN: {
                    validators: {
                        notEmpty: {
                            message: '请填写年龄。'
                        },
                        integer: {
                            message: "请填写有效的年龄。"
                        },
                        between: {
                            min: 18,
                            max: 200,
                            message: "请填写合理的年龄。"
                        }

                    }
                },
                emailX: {
                    validators: {
                        notEmpty: {
                            message: '请填写邮箱。'
                        },
                        emailAddress: {
                            message: "请输入有效的邮箱。"
                        },
                        stringLength: {
                            max: 200,
                            message: "邮箱不能超过200个字符。"
                        }
                    }
                },
                phoneX: {
                    validators: {
                        notEmpty: {
                            message: '请填写手机号码。'
                        },
                        regexp: {
                            regexp: /^1[0-9]{10}$/,
                            message: "请填写有效的手机号码。"
                        }
                    }
                }
            }
        });
    }

    function initUserTable() {
        $("#userTable").bootstrapTable({
            url: "${pageContext.request.contextPath}/user/listUserData",
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
            uniqueId: "userId",
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
                    field : 'companyName',
                    title : '连队',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'usernameM',
                    title : '账号名',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'realNameM',
                    title : '姓名',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'sexX',
                    title : '性别',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'ageN',
                    title : '年龄',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'emailX',
                    title : '邮箱',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'phoneX',
                    title : '电话',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : 'amountN',
                    title : '余额',
                    align : 'center',
                    valign : 'middle',
                },
                {
                    field : '',
                    title : '操作',
                    align : 'center',
                    valign : 'middle',
                    formatter: function () {
                        return '<button class="btn btn-primary">重置密码</button>&nbsp;&nbsp;<button class="btn btn-primary">删除</button>';
                    }
                }
            ]
        });
    }
</script>
</body>
</html>
