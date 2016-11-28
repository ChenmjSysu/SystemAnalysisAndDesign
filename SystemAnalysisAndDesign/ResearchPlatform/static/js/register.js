$(document).ready(function($) {
	$('.btn.confirm').click(function(){
		$.ajax({
			url: '/register/',
			type: 'post',
			data: {
				username:$('input[name=username]').val(),
				password1:$('input[name=password1]').val(),
				password2:$('input[name=password2]').val(),
				usertype:$('select[name=usertype]').val(),
			},
		})
		.done(function(data) {
			//history.back();			
			if (eval(data)["result"] == "success") {
				$(location).attr("href", "/index/");
			}
			else {
				alert(eval(data)["message"] + "\n提交失败，请重试！");	
			}
		})
		.fail(function(data) {
			alert(eval(data)["message"]);
			alert("提交失败，请重试！");
		});
	});
	$('.btn.back').click(function(){
		history.back();
	});
});