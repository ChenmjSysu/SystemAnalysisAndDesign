$(document).ready(function(){
	var ue = UE.getEditor('ueditor');
    
    function getContent() {
	    var arr = [];
	    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
	    arr.push("内容为：");
	    arr.push(UE.getEditor('editor').getContent());
	    alert(arr.join("\n"));
	}

	$("#submit").click(function() {
		/*var arr = [];
	    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
	    arr.push("内容为：");
	    arr.push(UE.getEditor('ueditor').getContent());
	    alert(arr.join("\n"));*/

	    title = $('input[name=title]').val();
	    type = $('select[name=type]').val();
	    content = UE.getEditor('ueditor').getContent();
	    /*alert(title + "\n" + type);*/
	    if(confirm("是否提交")) {
			$.ajax({
			url: "/add/" + type + "/",
			type: "post",
			data: {
				"content": content,
				"title": title,
				"type": type,
			},
			dataType: "json",
			success: function(data) {
				if (eval(data)["result"] == "success") {
					alert("提交成功");
					window.location = "/manage/";
				}
				else {
					alert("操作失败\n" + (eval(data)["message"]));
				}
			},
			error: function(data) {
                /*alert("加载失败");
                window.lacation = "/news/";*/
			},
		});
		}
	});

})