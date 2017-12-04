$(function(){
	$('.edit, .add').click(function(){
		$(this).toggle();
		$(this).next().toggle();
	});
	$('.merge').click(function(){
		$(this).parent().toggle();
		$(this).parent().prev().toggle();
	});
	// 校验
	$('.sBtn').click(function(){
		if($(this).prev().val()==""||$(this).prev().val()==null) {
			$(this).prev().css('border', '1px solid #e14041');
			return false;
		}
	});
	$('.category').focus(function(){
		$(this).css('border', '1px solid #ccc');
	});
});