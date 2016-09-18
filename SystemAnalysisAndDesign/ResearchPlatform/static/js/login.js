$jQuery(document).ready(function($) {
	$('.btn.confirm').click(function(){
		$.ajax({
			url: '/path/to/file',
			type: 'post',
			data: {
				name:$('input[name=name]').val();
				password:$('input[name=password]').val();
			},
		})
		.done(function() {
			history.back();
		})
		.fail(function() {
			alett("提交失败，请重试！");
		});
	});
	$('.btn.back').click(function(){
		history.back();
	});
});