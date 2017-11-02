$(function(){

	//成功加入购物车
	$('.lCart').click(function(){
		$('.successCart').show();
		$('.successCart').animate({width:'300px'}, 500);
		setTimeout(function(){
			$('.successCart').animate({width:'0px'}, 500);
		}, 2500);
	});
});