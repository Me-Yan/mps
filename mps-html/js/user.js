$(function(){

	// 遮罩、关闭按钮
	$('.close').click(function(){
		$('.popup').fadeOut();
		$('.imgPop').fadeOut();
		$('.mask').fadeOut();
		$('.state').text('');
	});
	$('.mask').click(function(){
		$('.popup').fadeOut();
		$('.imgPop').fadeOut();
		$('.mask').fadeOut();
		$('.state').text('');
	});

	// 点击编辑按钮

	$('.editBtn').click(function(){
		distance($('.popup'));
		$('.mask').fadeIn();
		$('.popup').fadeIn();

		$('.username input').val($('.ue').text());
		$('.realname input').val($('.re').text());
		if($('.gr').text()=='男') {
			$('#man').attr('checked', true);
			$('#woman').attr('checked', false);
		} else {
			$('#woman').attr('checked', true);
			$('#man').attr('checked', false);
		}
		$('.province input').val($('.pe').text());
	});

	function distance(element){
		var aa = $('body').height() * 0.1;
		var aTop = $(window).scrollTop() + aa;
		element.css('top', aTop);
	}

	//表单校验
	$('.username input').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()==''||$(this).val()==null){
			$('.state').text('*  请输入用户名！');
			$(this).css('border', '1px solid #ccc');
		} else if($(this).val().length<4 || $(this).val().length>20) {
			$('.state').text('*  长度4-20字符！');
			$(this).css('border', '1px solid #ccc');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.state').text('');
		}
	});


	$('.infoBtn').click(function(){
		if(valideName()){
			$('#infoForm').serialize();
			$('#infoForm').submit();
		}
	});

	function valideName(){
		if($('.username input').val()==''||$('.username input').val()==null){
			$('.state').text('*  请输入用户名！');
			$('.username input').css('border', '1px solid #ccc');
			return false;
		} else if($('.username input').val().length<4 || $('.username input').val().length>20) {
			$('.state').text('*  长度4-20字符！');
			$('.username input').css('border', '1px solid #ccc');
			return false;
		} else {
			$('.username input').css('border', '1px solid #ccc');
			$('.state').text('');
			return true;
		}
	}


	// 修改头像
	$('.editImg').click(function(){
		distance($('.imgPop'));
		$('.mask').fadeIn();
		$('.imgPop').fadeIn();
	});


	//表单提交
	$('.imgBtn').click(function(){
		$('#imgForm').submit();
	})
});