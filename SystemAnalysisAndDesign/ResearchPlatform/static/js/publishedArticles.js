jQuery(document).ready(function($) {
	for(var i=0;i<$('tr').length;i++){
		$('tr').eq(i).css({
			animation:(i+1)+'s fade'
		})
	}
});