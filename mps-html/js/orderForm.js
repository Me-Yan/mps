$(function(){
	//提交订单
	$('.conClick a').click(function(){
		$('#orderForm').serialize();
		$('#orderForm').submit();
	});
});