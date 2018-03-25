<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanyanghong
  Date: 2017/12/10
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通知</title>
</head>
<body>
    <div class="container-fluid">
        <div style="height: 20px;"></div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 text-left">
                <div style="text-align:center;padding: 10px 0px;width: 100px;background-color: #393939;color: #FFFFFF;">网站通知</div>
            </div>
        </div>
        <div style="height: 20px;"></div>
        <div class="row">
            <div class="col-xs-11 col-sm-11 col-xs-offset-1 col-sm-offset-1">
                <table>
                    <tr>
                        <td>
                            <textarea disabled id="webNotice" class="form-control" style="resize: none;height: 250px;width: 520px;">${noticeDTO.contentX}</textarea>
                        </td>
                        <td align="left">
                            <button class="btn btn-primary hide" id="webBtn" style="margin-left: 30px;">确认</button>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="edit" />是否修改通告
                                </label>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <!-- web Modal -->
    <div id="webModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">消息</h4>
                </div>
                <div class="modal-body text-center">
                    <p>确认使用该通告？</p>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button type="button" class="btn btn-primary" id="webConfirm" data-index="">确认</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var noticeContent = "";
        <c:if test="${notice.contentX!=null}">
            noticeContent = ${notice.contentX};
        </c:if>

        $("#edit").on("click", function () {
            if ($(this).is(":checked")) {
                $("#webNotice").removeAttr("disabled");
                $("#webBtn").removeClass("hide");
            } else {
                $("#webNotice").val(noticeContent);
                $("#webNotice").attr("disabled", "true");
                $("#webBtn").addClass("hide");
            }
        });

        $("#webBtn").on("click", function () {
           $("#webModal").modal("show");
        });

        $("#webConfirm").on("click", function () {
           $.ajax({
               url: "${pageContext.request.contextPath}/notice/edit",
               type: "post",
               data: {
                   contentX: $.trim($("#webNotice").val())
               },
               success: function (data) {
                   $("#webModal").modal("hide");
                   if ("success" === data.msg) {
                       noticeContent = $.trim($("#webNotice").val());
                       $("#webNotice").attr("disabled", "true");
                       $("#webBtn").addClass("hide");
                       $("#edit").prop("checked",false);
                       $("#msgContent").text("网站通知修改成功。");
                       $("#msgModal").modal("show");
                   } else {
                       $("#msgContent").text("网站通知修改失败。");
                       $("#msgModal").modal("show");
                   }
               }
           });
        });
    </script>
</body>
</html>
