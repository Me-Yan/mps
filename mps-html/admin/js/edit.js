$(function(){
	// 基本信息
	// 修改列表图片
	var head = true;
	$('.headImg a').click(function(){
		if(head) {
			$('.headContent').html('<div class="hid"><input type="text" name="filename" class="filename" readonly/><label for="spath"><a>选择...</a></label><input type="file" accept="image/*" class="spath" name="spath" id="spath"/></div><a>上传</a>');
			
			$(this).html('收起');
			head = false;
		} else {
			$('.headContent').html('');
			$(this).html('修改');
			head = true;
		}
	});
	$('.headContent #spath').live('change', function(){
		$(this).prev().prev().val($(this).val());
	});
	// 提交表单
	$('.confirm .s').click(function(){
		if($('.infoContent .filename').length>0 && ($('.filename').val()==""||$('.filename').val()==null)) {
			alert('请选择需要修改的列表图片！');
			return false;
		}
		var flag = false;
		$('.infoContent input[class!="filename"]').each(function(){
            if($(this).val()==null||$(this).val()==''){
            	flag = true;            	
                return false;
            }
        });
        if(flag) {
        	alert('请完善基本信息！');
        	return false;
        }
        if($('select').val()==''||$('select').val()==null||$('textarea').val()==''||$('textarea').val()==null) {
            alert('请完善基本信息！');
            return false;
        }

        $('#basicForm').serialize();
        $('#basicForm').submit();
	});
	// 重置表单
	$('.confirm .c').click(function(){
		$('.infoContent input').val('');
		$('.infoContent textarea').val('');
	});

	// 图片展示
	var show = true;
	$('.addShow a').click(function(){
		if(show) {
			$('.showContent').show();
			$(this).html('收起');
			show = false;
		} else {
			$('.showContent').hide();
			$(this).html('添加');
			show = true;
		}
	});
	$('.pspath').change(function(){
		if($(this)[0].files.length>1) {
			$(this).prev().prev().val("选中"+$(this)[0].files.length+"个文件");
		} else {
			$(this).prev().prev().val($(this).val());
		}
		var docObj = document.getElementById("pspath");
        var dd = document.getElementById("showImg"); 
		preview(docObj, dd, 'show');
		
	});
	$('.showContent .remove').click(function(){
		$(this).prev().find('input').val('');
		$(this).parent().parent().next().html('');
	});
	$('.showContent .upload').click(function(){
		var v = $(this).prev().prev().find('input:last');
		if(v.val()==""||v.val()==null) {
			alert('您未选择任何图片！');
			return false;
		}

		
	});


	// 商品详情
	var detail = true;
	$('.addDetail a').click(function(){
		if(show) {
			$('.detailContent').show();
			$(this).html('收起');
			show = false;
		} else {
			$('.detailContent').hide();
			$(this).html('添加');
			show = true;
		}
	});
	$('.pdpath').change(function(){
		if($(this)[0].files.length>1) {
			$(this).prev().prev().val("选中"+$(this)[0].files.length+"个文件");
		} else {
			$(this).prev().prev().val($(this).val());
		}
		var docObj = document.getElementById("pdpath");
        var dd = document.getElementById("detailImg"); 
		preview(docObj, dd, 'detail');
	});
	$('.detailContent .remove').click(function(){
		$(this).prev().find('input').val('');
		$(this).parent().parent().next().html('');
	});
	// 


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