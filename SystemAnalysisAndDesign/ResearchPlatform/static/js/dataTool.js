$(document).ready(function(){
	$('.nav_head_title').click(function(){
		var index=$(this).parents('.left_nav').index();
		$('.container_right:visible').hide();
		$('.container_right').eq(index).slideDown();
	})
})