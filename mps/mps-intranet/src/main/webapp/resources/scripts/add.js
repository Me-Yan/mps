$(function(){

	$('.spath, .pdpath, .pspath').change(function(){
        $(this).next().css('display', 'inline-block');
		if($(this)[0].files.length>1) {
			$(this).prev().prev().val("选中"+$(this)[0].files.length+"个文件");
		} else {
			$(this).prev().prev().val($(this).val());
		}
		if($(this).hasClass('pspath')) {
			var docObj = document.getElementById("pspath");
	        var dd = document.getElementById("showImg"); 
			preview(docObj, dd, 'show');
		} else if($(this).hasClass('pdpath')) {
			var docObj = document.getElementById("pdpath");
	        var dd = document.getElementById("detailImg"); 
			preview(docObj, dd, 'detail');
		}
	});

    // 移除图片
    $('.remove').click(function(){
        $(this).parent().parent().next().html('');
        $(this).prev().val('');
        $(this).prev().prev().prev().val('');
        $(this).hide();
    });

    // 提交表单
    $('.sBtn').click(function(){
        $('input[class!="filename"]').each(function(){
            if($(this).val()==null||$(this).val()==''){
                $('.formTip').addClass('is-visible');
                return false;
            }
        });
        if($('select').val()==''||$('select').val()==null||$('textarea').val()==''||$('textarea').val()==null) {
            $('.formTip').addClass('is-visible');
            return false;
        }

        $('#addForm').serialize();
        $('#addForm').submit();
    });
    
    //close popup
    $('.formTip').click(function(event){
        if( $(event.target).is('.close') || $(event.target).is('.formTip')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    }); 

    // 重置表单
    $('.cBtn').click(function(){
        $('#showImg, #detailImg').html('');
        $('.remove').hide();
        $('input').val('');
        $('textarea').val('');
    });

	// 图片预览
	function preview(docObj, dd, content) {
        dd.innerHTML = "";
        var fileList = docObj.files;
        for (var i = 0; i < fileList.length; i++) {    
            dd.innerHTML += "<img id='"+ content + i + "'  />";
            var imgObjPreview = document.getElementById(content+i); 
            if (docObj.files && docObj.files[i]) {
                //火狐下，直接设img属性
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
            }

            else {
                //IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById(content + i);
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch (e) {
                    alert("您上传的图片格式不正确，请重新选择!");
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
        }  
    }
});