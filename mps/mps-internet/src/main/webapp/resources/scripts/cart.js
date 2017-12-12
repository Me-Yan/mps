$(function(){

	//减少数量
	$('.less').click(function(){

		var n1 = parseInt($(this).parent().find(':input').val());
		var buy = parseInt($(this).parent().find('.buy').text());
		alert(n1+"---------"+buy);
		var q1 = parseInt($(this).parent().find('.qd').text());
		if(isNaN(n1)){
			$(this).parent().find(':input').val(buy);
			total(buy, $(this));
			subTotal();
		} else if(n1<q1 || n1==q1){
			$(this).parent().find(':input').val(q1);
			total(q1, $(this));
			subTotal();
		} else if(n1>q1) {
			n1 = n1 - 1;
			$(this).parent().find(':input').val(n1);
			total(q1, $(this));
			subTotal();
		}
	});

	//增加数量
	$('.add').click(function(){
		var now = parseInt($(this).parent().find(':input').val());
		var q1 = parseInt($(this).parent().find('.qd').text());
		if(isNaN(now)) {
			$(this).parent().find(':input').val(q1);
			total(q1, $(this));
			subTotal();
		} else if(now<q1) {
			$(this).parent().find(':input').val(q1);
			total(q1, $(this));
			subTotal();
		} else {
			now = now + 1;
			$(this).parent().find(':input').val(now);
			total(now, $(this));
			subTotal();
		}
	});

	//小计
	function total(count, element){
		var price = parseFloat(element.parent().parent().find('.proPrice').text());
		var num = count * price;
		element.parent().parent().find('.proTotal').html(num.toFixed(2));
	}
	//总计
	function subTotal() {
		var sub = 0;

		$('.proTotal').each(function(){
			sub = parseFloat(sub) + parseFloat($(this).text());
		});
		$('.subtotal>span').html(sub.toFixed(2));
	}

	//提交表单
	$('.conClick a').click(function(){
		$('#cartForm').serialize();
		$('#cartForm').submit();
	})
});