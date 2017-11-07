$(function(){




	//默认地址显示的样式
	$('.addrList').mouseover(function(){
		$(this).css('background-color', '#eee');

		if($(this).find('.one').css('display') == 'none') {
			$(this).find('.two').css('display', 'inline');
		}

	}).mouseout(function(){
		$(this).css('background-color', '#fff');
		$(this).find('.two').css('display', 'none');
	});

});