$(function(){
	//隐藏、显示弹窗
	//添加地址
	$('.addAddr a').click(function(){
		distance($('.addPop'));
		$('.mask').fadeIn();
		$('.addPop').fadeIn();
	});
	$('.close').click(function(){
		$('.addPop').fadeOut();
		$('.mask').fadeOut();
		$(':input').css('border', '1px solid #ccc');
	});
	$('.mask').click(function(){
		$('.addPop').fadeOut();
		$('.mask').fadeOut();
		$(':input').css('border', '1px solid #ccc');
	});

	function distance(element){
		var aa = $('body').height() * 0.1;
		var aTop = $(window).scrollTop() + aa;
		element.css('top', aTop);
	}


	//弹窗表单提交
	$('.popEdit a').click(function(){
		validePopup($(this).parent().parent());
	});


	//弹窗校验
	function validePopup(element){
		var flag = true;
		element.find(':input').each(function(){
			if($(this).val()=='' || $(this).val()==null) {
				flag = false;
				$(this).css('border', '1px solid #e14041');
			} else {
				$(this).css('border', '1px solid #ccc');
			}
		});
		if(flag) {
			element.serialize();
			element.submit();
		}
	}


	//选择地址
	$('.list').click(function(){
		$('.list').removeClass('chooseList');
		$(this).addClass('chooseList');
	});



	//提交订单
	$('.conClick a').click(function(){
		$('#orderForm').serialize();
		$('#orderForm').submit();
	});




});