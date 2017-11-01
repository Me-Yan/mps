$(function(){
	$('.edit').click(function(){
		$(this).toggle();
		$(this).next().toggle();
	});
	$('.merge').click(function(){
		$(this).parent().toggle();
		$(this).parent().prev().toggle();
	});
	// 校验
	var flag = true;
	$('.sBtn').click(function(){
		if($(this).prev().prev().val()==""||$(this).prev().prev().val()==null) {
			$(this).prev().prev().css('border', '1px solid #e14041');
			flag = false;
		}
		if($(this).prev().val()=="0") {
			$(this).prev().css('border', '1px solid #e14041');
			flag =false;
		}
		if(!flag) {
			return false;
		}
	});
	$('.categorySecond, select').focus(function(){
		$(this).css('border', '1px solid #ccc');
	})
	$('.add').click(function(){
		$(this).hide();
		$(this).next().show();
	});
});