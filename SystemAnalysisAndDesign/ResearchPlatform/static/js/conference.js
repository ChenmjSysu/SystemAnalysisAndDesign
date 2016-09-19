$(document).ready(function(){
	$('.nav_head_title').click(function(){
		var ob = $(this).parents('.left_nav').find('.nav_body');
		if(ob.is(':visible'))
			ob.slideUp();
		else
			ob.slideDown();
	})
})