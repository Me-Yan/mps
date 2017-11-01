$(function(){
	//获取、失去焦点边框颜色
	$(':input').focus(function(){
		$(this).css('border', '1px solid #6495ED');
	}).blur(function(){
		$(this).css('border', '1px solid #dadada');
	})

	//正则表达式
	
	var email = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;	
	//表单验证
	$('.regBtn').click(function(){
		var value = valideUsername() & validePwd() & valideCode() & validePwdConfirm() & valideEmail();
		if(value == 1) {
			$('#regForm').serialize();
			$('#regForm').submit();
		}
	})

	


	//用户名
	$('#username').blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).parent().next().html('*  用户名不能为空！');
		} else if($(this).val().length<4) {
			$(this).parent().next().html('*  用户名的长度小于4个字符！');
		} else if($(this).val().length>20) {
			$(this).parent().next().html('*  用户名的长度大于20个字符！');
		} else {
			$(this).parent().next().html('');
		}
	});

	function valideUsername(){
		if($('#username').val()=='' || $('#username').val()==null) {
			$('#username').parent().next().html('*  用户名不能为空！');
			return false;
		} else if($('#username').val().length<4) {
			$('#username').parent().next().html('*  用户名的长度小于4个字符！');
			return false;
		} else if($('#username').val().length>20) {
			$('#username').parent().next().html('*  用户名的长度大于20个字符！');
			return false;
		}
		return true;
	}

	//邮箱
	$('#email').blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).parent().next().html('*  邮箱不能为空！');
		} else if(!(email.test($(this).val()))) {
			$(this).parent().next().html('*  邮箱格式不正确！');
		} else {
			$(this).parent().next().html('');
		}
	});

	function valideEmail() {
		if($('#email').val()=='' || $('#email').val()==null) {
			$('#email').parent().next().html('*  邮箱不能为空！');
			return false;
		} else if(!(email.test($('#email').val()))) {
			$('#email').parent().next().html('*  邮箱格式不正确！');
			return false;
		}
		return true;
	}
	//密码
	$('#password').blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).parent().next().html('*  密码不能为空！');
		} else if($(this).val().length<6) {
			$(this).parent().next().html('*  密码低于6个字符！');
		} else if($(this).val().length>16) {
			$(this).parent().next().html('*  密码超过16个字符！');
		} else {
			$(this).parent().next().html('');
		}
	});

	function validePwd(){
		if($('#password').val()=='' || $('#password').val()==null) {
			$('#password').parent().next().html('*  密码不能为空！');
			return false;
		} else if($('#password').val().length<6) {
			$('#password').parent().next().html('*  密码低于6个字符！');
			return false;
		} else if($('#password').val().length>16) {
			$('#password').parent().next().html('*  密码超过16个字符！');
			return false;
		}
		return true;
	}

	//确认密码
	$('#pwdConfirm').blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).parent().next().html('*  请确认密码！');
		} else if($(this).val() != $('#password').val()) {
			$(this).parent().next().html('*  两次密码输入不一致！');
		} else {
			$(this).parent().next().html('');
		}
	});

	function validePwdConfirm(){
		if($('#pwdConfirm').val()=='' || $('#pwdConfirm').val()==null) {
			$('#pwdConfirm').parent().next().html('*  请确认密码！');
			return false;
		} else if($('#pwdConfirm').val() != $('#password').val()) {
			$('#pwdConfirm').parent().next().html('*  两次密码输入不一致！');
			return false;
		}
		return true;
	}

	//验证码
	$('#code').blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).parent().next().html('*  请输入验证码！');
		} else {
			$(this).parent().next().html('');
		}
	});

	function valideCode() {
		if($('#code').val()=='' || $('#code').val()==null) {
			$('#code').parent().next().html('*  请输入验证码！');
			return false;
		}
		return true;
	}

});