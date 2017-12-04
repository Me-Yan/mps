$(function(){
	// 上架
	$('.downshelf').click(function(event){
		event.preventDefault();
		$('.shelf').addClass('is-visible');
	});
	
	//close popup
	$('.downCancel').click(function(){
		$('.shelf').removeClass('is-visible');
	});
	$('.shelf').click(function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.shelf') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.shelf').removeClass('is-visible');
	    }
    });

});