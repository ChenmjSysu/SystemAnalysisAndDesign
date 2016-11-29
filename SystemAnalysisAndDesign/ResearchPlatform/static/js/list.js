jQuery(document).ready(function($) {
	for(var i=0;i<$('a.li').length;i++){
		$('a.li').eq(i).css({
			animation:(i+1)*0.75+'s fade'
		})
	}
});