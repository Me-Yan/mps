var editFlag = false;
$("#web-edit").on("click", function(){
	if (editFlag) {
		$("#btn-confirm").addClass("dispaly-none");		
		$("#alert-message").attr("disabled", "disabled");
		editFlag = false;
	} else {
		$("#btn-confirm").removeClass("dispaly-none");
		$("#alert-message").removeAttr("disabled");
		editFlag = true;
	}
});