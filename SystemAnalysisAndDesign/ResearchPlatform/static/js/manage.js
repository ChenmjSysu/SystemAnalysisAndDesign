$(document).ready(function(){
	for(var i=0;i<$('.list .li').length;i++){
		$('.list .li').eq(i).css({
			animation:(i+1)*0.5+'s fade'
		})
	}

    //点击索引
	$(".term").click(function(e) {
		id = $(e.target).attr("recordId");
		type = $(e.target).attr("type");	
		title = $(e.target).attr("title");	
		if(confirm("是否删除\n" + title)) {
			$.ajax({
			url: "/delete/" + type + "/",
			type: "post",
			data: {"aid": id},
			dataType: "json",
			success: function(data) {
				if (eval(data)["result"] == "success") {
					window.location.reload();
				}
				else {
					alert("操作失败\n" + (eval(data)["message"]));
				}
				/*if(data != "ERROR") {
					title = data[0]["fields"]["title"];
					content = data[0]["fields"]["content"];
				    $("#item_title").html(title);
				    $("#item_content").html(content);
				    $("#index_nav a").removeClass("active");
		            $(e.target).addClass("active");
			    }
			    else {
			    	alert("加载失败");
			    	window.lacation = "/news/";
			    }*/
			},
			error: function(data) {
                /*alert("加载失败");
                window.lacation = "/news/";*/
			},
		});
		}
		
	});
});