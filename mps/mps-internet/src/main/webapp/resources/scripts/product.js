$(function(){
	//减少数量
	$('.less').click(function(){

		var n1 = parseInt($(this).parent().find(':input').val());
		var q1 = parseInt($(this).parent().find('.qd').text());
		if(isNaN(n1)){
			$(this).parent().find(':input').val(q1);
		} else if(n1<q1 || n1==q1){
			$(this).parent().find(':input').val(q1);
		} else if(n1>q1) {
			n1 = n1 - 1;
			$(this).parent().find(':input').val(n1);
		}
	});

	//增加数量
	$('.add').click(function(){
		var now = parseInt($(this).parent().find(':input').val());
		var q1 = parseInt($(this).parent().find('.qd').text());
		if(isNaN(now)) {
			$(this).parent().find(':input').val(q1);
		} else if(now<q1) {
			$(this).parent().find(':input').val(q1);
		} else {
			now = now + 1;
			$(this).parent().find(':input').val(now);
		}
	});
});