$(document).ready(function($) {
	console.log('asdfasdf')
	$.ajax({
		url: '/list/News/',
		type: 'post',
		dataType: 'json',
	})
	.done(function(d) {
		console.log("success");
		console.log(d)
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
});