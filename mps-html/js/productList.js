$(function(){

	var fprice = true;
	var fsalses = true;
	var ftime = true;

	//价格
	$('.priceda').click(function(){
		if(fprice) {
			$(this).find('i').removeClass('fa-sort').removeClass('fa-arrow-down').addClass('fa-arrow-up');
			//$(this).attr('href', 'javascript:void(0)');
			fprice = false;
		} else {
			$(this).find('i').removeClass('fa-arrow-up').addClass('fa-arrow-down');
			//$(this).attr('href', 'javascript:void(0)');
			fprice = true;
		}
	});

	//销量
	$('.salesda').click(function(){
		if(fsalses) {
			$(this).find('i').removeClass('fa-sort').removeClass('fa-arrow-up').addClass('fa-arrow-down');
			//$(this).attr('href', 'javascript:void(0)');
			fsalses = false;
		} else {
			$(this).find('i').removeClass('fa-arrow-down').addClass('fa-arrow-up');
			//$(this).attr('href', 'javascript:void(0)');
			fsalses = true;
		}
	});

	//上架时间
	$('.timeda').click(function(){
		if(ftime) {
			$(this).find('i').removeClass('fa-arrow-down').addClass('fa-arrow-up');
			//$(this).attr('href', 'javascript:void(0)');
			ftime = false;
		} else {
			$(this).find('i').removeClass('fa-arrow-up').addClass('fa-arrow-down');
			//$(this).attr('href', 'javascript:void(0)');
			ftime = true;
		}
	});

	//成功加入购物车
	$('.lCart').click(function(){
		$('.successCart').show();
		$('.successCart').animate({width:'300px'}, 500);
		setTimeout(function(){
			$('.successCart').animate({width:'0px'}, 500);
		}, 2500);
	});
});