<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/9
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
</head>
<body>
<div class="container-fluid">
    <form:form commandName="productForm" modelAttribute="productForm" action="${pageContext.request.contextPath}/product/editConfirm" id="productForm" class="form-horizontal" enctype="multipart/form-data" method="post">
        <form:hidden path="productId" />

        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <div style="height: 20px;"></div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 text-left">
                        <button type="button" class="btn btn-success" style="border-radius: 0px;background-color: #393939;border: none">基本信息</button>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="categoryId" class="control-label col-xs-1 col-sm-2 text-right">一级分类：</label>
                    <div class="col-xs-4 col-sm-4">
                        <form:select path="categoryId" id="categoryId" class="form-control">
                            <form:option value="">-- 选择一级分类 --</form:option>
                            <c:if test="${not empty categoryDTOList}">
                                <c:forEach items="${categoryDTOList}" var="category">
                                    <form:option value="${category.categoryId}">${category.nameX}</form:option>
                                </c:forEach>
                            </c:if>
                        </form:select>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="categorySecondId" class="control-label col-xs-1 col-sm-2 text-right">二级分类：</label>
                    <div class="col-xs-4 col-sm-4">
                        <form:select path="categorySecondId" id="categorySecondId" class="form-control">
                            <form:option value="">-- 选择二级分类 --</form:option>
                            <c:forEach items="${categorySecondDTOList}" var="categorySecond">
                                <form:option value="${categorySecond.categorySecondId}">${categorySecond.nameX}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="nameX" class="control-label col-xs-1 col-sm-2 text-right">商品名称：</label>
                    <div class="col-xs-4 col-sm-4">
                        <form:input type="text" path="nameX" id="nameX" class="form-control" />
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="countN" class="control-label col-xs-1 col-sm-2 text-right">数量：</label>
                    <div class="col-xs-4 col-sm-4">
                        <form:input type="text" path="countN" id="countN" class="form-control" />
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="priceN" class="control-label col-xs-1 col-sm-2 text-right">单价：</label>
                    <div class="col-xs-4 col-sm-4 checkbox">
                        <form:input type="text" path="priceN" id="priceN" cssClass="form-control" />
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="imageFile" class="control-label col-xs-1 col-sm-2 text-right">展示图片：</label>
                    <div class="col-xs-4 col-sm-4">
                        <form:input type="file" path="imageFile" id="imageFile" class="form-control file-loading" />
                    </div>
                    <div class="col-xs-7 col-sm-6 checkbox text-left">
                        <label>
                            <input type="checkbox" name="showFlag" id="showFlag" value="Y"/>是否修改
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-xs-offset-1 col-sm-offset-2">
                        <img style="height: 100px;" class="img-thumbnail" src="${pageContext.request.contextPath}/file/${productForm.imagePathX}" alt="" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 text-left">
                        <button type="button" class="btn btn-success" style="border-radius: 0px;background-color: #393939;border: none;">商品详情</button>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <label for="imageList" class="control-label col-xs-1 col-sm-2 text-right">图片详情：</label>
                    <div class="col-xs-4 col-sm-4">
                        <form:input type="file" path="imageList" id="imageList" multiple="multiple" class="form-control file-loading" />
                    </div>
                    <div class="col-xs-7 col-sm-6 checkbox">
                        <label>
                            <input type="checkbox" name="detailFlag" id="detailFlag" value="Y" />是否改修
                        </label>
                    </div>
                </div>
                <div style="height: 50px;"></div>
                <div class="row">
                    <div class="col-xs-5 col-sm-6 text-right">
                        <button type="button" class="btn btn-primary" id="submitBtn">提交</button>
                    </div>
                </div>
                <div style="height: 20px;"></div>
                <div class="form-group clearfix">
                    <label for="images" class="control-label col-xs-1 col-sm-2 text-right">当前使用：</label>
                    <div class="col-xs-4 col-sm-4" id="images">
                        <c:forEach items="${productForm.imageDTOList}" var="image">
                            <img class="img-thumbnail" style="height: 200px;" src="${pageContext.request.contextPath}/file/${image.pathX}" alt="">
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
    <div style="height: 250px;" class="clearfix"></div>
</div>

<!-- 确认Modal -->
<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog">
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
                <button type="button" class="btn btn-primary" id="confirmBtn">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">

    $(function () {
        initProductForm();
        initImageFile();
        initImageList();
    });

    $("#showFlag").on("click", function () {
        var productForm = $("#productForm").data("formValidation");
        $("#imageFile").val("");
        if ($(this).is(":checked")) {
            productForm.enableFieldValidators("imageFile", true);
            $("#imageFile").removeAttr("disabled");
            $("#imageFile").parent().removeClass("disabled");
        } else {
            productForm.enableFieldValidators("imageFile", false);
            $("#imageFile").attr("disabled", true);
            $("#imageFile").parent().addClass("disabled");
        }
    });

    $("#detailFlag").on("click", function () {
        var productForm = $("#productForm").data("formValidation");
        $("#imageList").val("");
        if ($(this).is(":checked")) {
            productForm.enableFieldValidators("imageList", true);
            $("#imageList").removeAttr("disabled");
            $("#imageList").parent().removeClass("disabled");
        } else {
            productForm.enableFieldValidators("imageList", false);
            $("#imageList").attr("disabled", true);
            $("#imageList").parent().addClass("disabled");
        }
    });

    var categoryJson = ${categoryJson};
    $("#categoryId").on("change", function () {
        var selectedIndex = this.selectedIndex;

        var secondOptionContent = '<option value="">-- 选择二级分类 --</option>';
        if (selectedIndex>0) {
            var categorySecondJson = categoryJson[selectedIndex-1].categorySecondDTOList;
            if (categorySecondJson) {
                for (var index in categorySecondJson) {
                    secondOptionContent += '<option value="'+categorySecondJson[index].categorySecondId+'">'+categorySecondJson[index].nameX+'</option>';
                }
            }
        }

        $("#categorySecondId").html(secondOptionContent);

        var productForm = $("#productForm").data("formValidation");
        productForm.revalidateField("categorySecondId");
    });

    $("#submitBtn").on("click", function () {
        var productForm = $("#productForm").data("formValidation");
        productForm.validate();
        if (productForm.isValid()) {
            $("#confirmModal").modal("show");
        }
    });

    $("#confirmBtn").on("click", function () {
        var productForm = document.getElementById("productForm");
        productForm.submit();
        /*$("#productForm").serialize();
         $("#productForm").submit();*/
    });

    function initProductForm() {
        $("#productForm").formValidation({
            excluded: [':disabled'],
            framework: 'bootstrap',
            fields: {
                categoryId: {
                    validators: {
                        notEmpty: {
                            message: '请选择一级分类。'
                        }
                    }
                },
                categorySecondId: {
                    validators: {
                        notEmpty: {
                            message: '请选择二级分类。'
                        }
                    }
                },
                nameX: {
                    validators: {
                        notEmpty: {
                            message: '请填写商品标题。'
                        },
                        stringLength: {
                            max: 50,
                            message: "标题不能超过50个字符。"
                        }
                    }
                },
                countN: {
                    validators: {
                        notEmpty: {
                            message: '请输入库存剩余。'
                        },
                        integer: {
                            message: "请填写有效的数字。"
                        },
                        between: {
                            min: 1,
                            max: 99999,
                            message: "请输入有效的库存。"
                        }
                    }
                },
                priceN: {
                    validators: {
                        notEmpty: {
                            message: '请输入商品单价。'
                        },
                        stringLength: {
                            max: 10,
                            message: "请输入合理的单价。"
                        },
                        numeric: {
                            message: "请输入有效的单价。"
                        }
                    }
                },
                imageFile: {
                    enabled: false,
                    validators: {
                        notEmpty: {
                            message: '请选择商品的展示图片。'
                        }
                    }
                },
                imageList: {
                    enabled: false,
                    validators: {
                        notEmpty: {
                            message: '请选择商品的图片介绍。'
                        }
                    }
                }
            }
        });
    }

    $("#imageFile").on("fileclear", function () {
        $(this).val("");
        $("#productForm").data("formValidation").revalidateField("imageFile");
    });

    $("#imageList").on("fileclear", function () {
        $(this).val("");
        $("#productForm").data("formValidation").revalidateField("imageList");
    });

    function initImageFile() {
        $("#imageFile").fileinput({
            language: 'zh',
            required: true,
            showUpload: false,
            showClose: false,
            allowedFileTypes: ['image'],
            allowedFileExtensions: ['jpg', 'gif', 'png'],
            allowedPreviewTypes: ['image'],
            uploadAsync: false
        });
        $("#imageFile").attr("disabled", true);
        $("#imageFile").parent().addClass("disabled");
    }

    function initImageList() {
        $("#imageList").fileinput({
            language: 'zh',
            required: true,
            showUpload: false,
            showClose: false,
            allowedFileTypes: ['image'],
            allowedFileExtensions: ['jpg', 'gif', 'png'],
            allowedPreviewTypes: ['image'],
            uploadAsync: false
        });
        $("#imageList").attr("disabled", true);
        $("#imageList").parent().addClass("disabled");
    }
</script>
</body>
</html>
